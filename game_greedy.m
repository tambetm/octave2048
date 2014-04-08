function [results, a] = game_greedy(nr_trials = 1)
  for i = (1:nr_trials)
    a = game_init();
    results(i) = 0;
    while (!game_end(a))
      maxpoints = -1;
      for action = (1:4)
        [c, points, changed] = game_move(a, action);
        if (changed && points > maxpoints)
          maxpoints = points;
          b = c;
        endif
      endfor
      results(i) += maxpoints;
      a = b;
    endwhile
  endfor
endfunction
