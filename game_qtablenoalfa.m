function results = game_qtablenoalfa(nr_trials = 1, gamma = 0.9, epsilon = 0.2)
  global Q;
  global N;
  % initialize Q-table, when it hasn't initialized yet
  if (isempty(Q))
    Q = sparse(10^9, 4);
    N = sparse(10^9, 4);
  endif

  for i = (1:nr_trials)
    % initial matrix with 2 cells populated
    a = game_init(3, 3);
    % print the initial matrix out only when debugging
    if (nr_trials == 1)
      disp(a);
    endif
    results(i) = 0;
    path = {};
    j = 1;
    while (!game_end(a))
      % s is matrix encoded into 64-bit integer
      s = game_state(a, 10);
      % with probability epsilon choose random move
      % otherwise choose move with the best Q-value
      if (unifrnd(0, 1) < epsilon)
        % choose random action
        action = randi(4);
      else
        % choose action with the best Q-value
        [Qmax, action] = max(Q(s, :));
      endif
      % make the move, b is the new matrix
      [b, points, changed] = game_move(a, action);
      % ss is the next state encoded as 64-bit integer
      ss = game_state(b, 10);
      % remember the {state, action, reward, next state} tuple
      path{j,1} = s;
      path{j,2} = action;
      path{j,3} = points;
      path{j,4} = ss;
      j++;
      results(i) += points;
      a = b;
      % print the resulting matrix out when debugging
      if (nr_trials == 1)
        game_disp_action(action);
        disp(a);
      endif
    endwhile
    % update Q-values in reverse order
    for j = (size(path, 1):-1:1)
      s = path{j,1};
      action = path{j,2};
      points = path{j,3};
      ss = path{j,4};
      % increase the number of occasions we have updated this Q-value
      N(s, action)++;
      % learning rate is 1 / N (try to achieve average)
      alfa = 1 / N(s, action);
      % Q-learning update rule
      Q(s, action) = Q(s, action) + alfa * (points + gamma * max(Q(ss, :)) - Q(s, action));
    endfor
  endfor
endfunction