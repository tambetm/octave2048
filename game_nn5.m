%addpath(genpath('C:\Projects\Neuro\DeepLearnToolbox'));
function results = game_nn5(nr_trials = 1, alpha = 0.01, gamma = 0, epsilon = 0.05, layers = [100])
  global nn;
  % initialize neural network, if it hasn't been initialized yet
  if (isempty(nn))
    nn = nnsetup([16 layers 4]);
    nn.output = 'linear';
    nn.momentum = 0;
    nn.activation_function = 'sigm';
    nn.learningRate = alpha;
  endif

  for i = (1:nr_trials)
    a = game_init(4, 4);
    results(i) = 0;
    while (!game_end(a))
      if (nr_trials == 1)
        disp(a);
      endif
      s = reshape(a, 1, 16);
      % feedforward pass for this state
      nn.testing = 1;
      [nn, Qs] = nnff2(nn, s);
      nn.testing = 0;
      if (nr_trials == 1)
        disp(Qs);
      endif
      if (unifrnd(0, 1) < epsilon)
        % choose random action
        action = randi(4);
        if (nr_trials == 1)
          game_disp_action(action, '(random)');
        endif
      else
        % choose action with the best Q-value
        [Qmax, action] = max(Qs);
        if (nr_trials == 1)
          game_disp_action(action, '(predicted)');
        endif
      endif
      [b, points, changed] = game_move(a, action);
      ss = reshape(b, 1, 16);

      % feedforward pass for next state
      if (gamma > 0)
        nn.testing = 1;
        [nnss, Qss] = nnff2(nn, ss);
        nn.testing = 0;
      else
        Qss = zeros(1, 4);
      endif

      % update Q-value for this action
      Qs(action) = points + gamma * max(Qss);
      if (nr_trials == 1)
        disp(Qs);
      endif

      % do a back-propagation
      nn = nnbp2(nn, Qs);
      nn = nnapplygrads(nn);

      if (nr_trials == 1)
        nn.testing = 1;
        [nn, Qnew] = nnff2(nn, s);
        nn.testing = 0;
        disp(Qnew);
      endif

      results(i) += points;
      a = b;
    endwhile
    if (nr_trials == 1)
      disp(a);
    endif
  endfor
endfunction