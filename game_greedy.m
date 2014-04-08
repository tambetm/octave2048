function [results, a] = game_greedy(nr_trials)
  for i = (1:nr_trials)
    a = game_init(4, 4);
    results(i) = 0;
    while (!game_end(a))
      maxpoints = 0;
      for action = (1:4)
        [c, points, changed] = game_move(a, action);
        if (points > maxpoints || (maxpoints == 0 && changed))
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
