function results = game_nn2(nr_trials = 1, alpha = 1, gamma = 0.9, epsilon = 0.05)
  global nn;
  % initialize neural network, if it hasn't been initialized yet
  if (isempty(nn))
    nn = nnsetup([16 100 4]);
    nn.output = 'linear';
    %nn.activation_function = 'lin_rect';
    nn.learningRate = alpha;
  endif

  for i = (1:nr_trials)
    a = game_init(4, 4);
    if (nr_trials == 1)
      disp(a);
    endif
    results(i) = 0;
    path = {};
    j = 1;
    while (!game_end(a))
      s = reshape(a, 1, 16);
      if (unifrnd(0, 1) < epsilon)
        % choose random action
        action = randi(4);
      else
        % choose action with the best Q-value
        action = nnpredict(nn, s);
      endif
      [b, points, changed] = game_move(a, action);
      ss = reshape(b, 1, 16);
      path{j,1} = s;
      path{j,2} = action;
      path{j,3} = points;
      path{j,4} = ss;
      j++;
      results(i) += points;
      a = b;
      if (nr_trials == 1)
        game_disp_action(action);
        disp(a);
      endif
    endwhile

    for j = (size(path, 1):-1:1)
      s = path{j,1};
      action = path{j,2};
      points = path{j,3};
      ss = path{j,4};

      nn = nnff(nn, s, zeros(1, 4));
      Qs = nn.a{end};
      nnss = nnff(nn, ss, zeros(1, 4));
      Qss = nnss.a{end};
      Qs(action) = points + gamma * max(Qss);
      nn = nnbp(nn);
      nn = nnapplygrads(nn);
    endfor
  endfor
endfunction