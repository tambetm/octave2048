function results = game_nn4(nr_trials = 1, alpha = 0.01, gamma = 0.5, epsilon = 0.05, batchsize = 10)
  global nn;
  global memory;

  % initialize neural network, if it hasn't been initialized yet
  if (isempty(nn))
    % init neural network
    nn = nnsetup([16 100 4]);
    nn.output = 'linear';
    nn.momentum = 0;
    nn.activation_function = 'sigm';
    nn.learningRate = alpha;

    % reset memory
    memory.states = [];
    memory.actions = [];
    memory.rewards = [];
    memory.nextstates = [];
  endif

  for i = (1:nr_trials)
    % init game
    a = game_init(4, 4);
    results(i) = 0;

    % continue until no move possible
    while (!game_end(a))
      % print out state
      if (nr_trials == 1)
        disp(a);
      endif
      s = reshape(a, 1, 16);

      % epsilon-greedy exploration
      if (unifrnd(0, 1) < epsilon)
        % choose random action
        action = randi(4);
        if (nr_trials == 1)
          game_disp_action(action, '(random)');
        endif
      else
        % choose action with the best Q-value
        %action = nnpredict(nn, s);
        nn.testing = 1;
        nn = nnff(nn, s, zeros(1, 4));
        nn.testing = 0;
        [Qmax, action] = max(nn.a{end});
        if (nr_trials == 1)
          disp(nn.a{end});
          game_disp_action(action, '(predicted)');
        endif
      endif

      % make move
      [b, points, changed] = game_move(a, action);
      ss = reshape(b, 1, 16);
      results(i) += points;
      a = b;

      % remember this transition
      memory.states = [memory.states; s];
      memory.actions = [memory.actions; action];
      memory.rewards = [memory.rewards; points];
      memory.nextstates = [memory.nextstates; ss];

      % train network for 10 random transitions
      n = size(memory.states, 1);
      if (n >= batchsize) 
        perm = randperm(n);
        perm = perm(1:batchsize);

        % feedforward pass for this state
        nn.testing = 1;
        nn = nnff(nn, memory.states(perm, :), zeros(batchsize, 4));
        Qs = nn.a{end};

        % feedforward pass for next state
        nn = nnff(nn, memory.nextstates(perm, :), zeros(batchsize, 4));
        Qss = nn.a{end};
        nn.testing = 0;

        % apply Q-learning rule
        for k = (1:batchsize)
          l = perm(k);
          Qs(k, memory.actions(l)) = memory.rewards(l) + gamma * max(Qss(k, :));
        endfor

        % train the network
        opts.batchsize = batchsize;
        opts.numepochs = 1;
        nn = nntrain(nn, memory.states(perm, :), Qs, opts);
      endif
    endwhile

    % print out final state
    if (nr_trials == 1)
      disp(a);
    endif
  endfor
endfunction