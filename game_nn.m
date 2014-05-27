function results = game_nn(nr_trials = 1, alpha = 1, gamma = 0.9, epsilon = 0.05)
  global nn;
  % initialize neural network, if it hasn't been initialized yet
  if (isempty(nn))
    nn = nnsetup([16 100 4]);
    nn.output = 'linear';
    nn.activation_function = 'lin_rect';
    nn.learningRate = alpha;
  endif

  for i = (1:nr_trials)
    a = game_init(4, 4);
    results(i) = 0;
    path = {};
    j = 1;
    while (!game_end(a))
      if (nr_trials == 1)
        disp(a);
      endif
      s = reshape(a, 1, 16);
      if (unifrnd(0, 1) < epsilon)
        % choose random action
        action = randi(4);
        if (nr_trials == 1)
          game_disp_action(action, '(random)');
        endif
      else
        % choose action with the best Q-value
        action = nnpredict(nn, s);
        if (nr_trials == 1)
          game_disp_action(action, '(predicted)');
        endif
      endif
      [b, points, changed] = game_move(a, action);
      if (changed)
        ss = reshape(b, 1, 16);
        path{j,1} = s;
        path{j,2} = action;
        path{j,3} = points;
        path{j,4} = ss;
        j++;
        results(i) += points;
        a = b;
      endif
    endwhile
    if (nr_trials == 1)
      disp(a);
    endif
    %disp(path);
    states = [];
    Qvalues = [];
    score = 0;
    for j = (size(path, 1):-1:1)
      s = path{j,1};
      action = path{j,2};
      points = path{j,3};
      ss = path{j,4};
      % calculate discounted score
      score = points + gamma * score;
      Q = zeros(1, 4);
      Q(action) = score;
      states = [states; s];
      Qvalues = [Qvalues; Q];
    endfor
    % train neural network
    opts.batchsize = size(states, 1);
    opts.numepochs = 1;
    nn = nntrain(nn, states, Qvalues, opts);
  endfor
endfunction