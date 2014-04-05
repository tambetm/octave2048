function results = game_greedy(nr_trials)
  for i = (1:nr_trials)
    a = zeros(4, 4);
    results(i) = 0;
    while (!game_end(a))
      maxpoints = -1;
      for action = (1:4)
        [c, points] = game_move(a, action);
        if (points > maxpoints)
          maxpoints = points;
          b = c;
        endif
      endfor
      results(i) += maxpoints;
      a = b;
    endwhile
    disp(i)
  endfor
endfunction
