function results = game_qtable(nr_trials = 1, alfa = 1, gamma = 0.9, epsilon = 0.2)
  global Q;
  % initialize Q-table, when it hasn't initialized yet
  if (isempty(Q))
    Q = sparse(10^9, 4);
  endif

  for i = (1:nr_trials)
    a = game_init(3, 3);
    if (nr_trials == 1)
      disp(a);
    endif
    results(i) = 0;
    while (!game_end(a))
      s = game_state(a, 10);
      if (unifrnd(0, 1) < epsilon)
        % choose random action
        action = randi(4);
      else
        % choose action with the best Q-value
        [Qmax, action] = max(Q(s, :));
      endif
      [b, points, changed] = game_move(a, action);
      ss = game_state(b, 10);
      % Q-learning update rule
      Q(s, action) = Q(s, action) + alfa * (points + gamma * max(Q(ss, :)) - Q(s, action));
      results(i) += points;
      a = b;
      if (nr_trials == 1)
        game_disp_action(action);
        disp(a);
      endif
    endwhile
  endfor
endfunction