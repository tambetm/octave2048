function results = game_qtablereplay(nr_trials = 1, gamma = 0.9, final_epsilon = 0.05, trials_coeff = 0.1, replay_size = 32)
  global Q;
  global N;
  global D;
  % initialize Q-table, when it hasn't initialized yet
  if (isempty(Q))
    Q = sparse(10^9, 4);
    N = sparse(10^9, 4);
    D = {};
  endif

  for i = (1:nr_trials)
    % decrease epsilon linearly from 1 to final_epsilon for nr_trials * trials_coeff trials
    if (nr_trials > 1 && i < nr_trials * trials_coeff)
      epsilon = final_epsilon + ...
          (1 - final_epsilon) * ((nr_trials * trials_coeff - (i - 1)) / (nr_trials * trials_coeff));
    else
      epsilon = final_epsilon;
    endif
    % initial matrix with 2 cells populated
    a = game_init(3, 3);
    % print the initial matrix out only when debugging
    if (nr_trials == 1)
      disp(a);
    endif
    results(i) = 0;
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
      D{end+1,1} = s;
      D{end,2} = action;
      D{end,3} = points;
      D{end,4} = ss;
      % update random minibatch of Q-values
      for j = randperm(size(D, 1), min(replay_size, size(D, 1)))
        s = D{j,1};
        action = D{j,2};
        points = D{j,3};
        ss = D{j,4};
        % increase the number of occasions we have updated this Q-value
        N(s, action)++;
        % learning rate is 1 / N (try to achieve average)
        alfa = 1 / N(s, action);
        % Q-learning update rule
        Q(s, action) = Q(s, action) + alfa * (points + gamma * max(Q(ss, :)) - Q(s, action));
      endfor
      results(i) += points;
      a = b;
      % print the resulting matrix out when debugging
      if (nr_trials == 1)
        game_disp_action(action);
        disp(a);
      endif
    endwhile
  endfor
endfunction