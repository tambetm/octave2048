function results = game_greedy(nr_trials = 1)
  for i = (1:nr_trials)
    a = game_init();
    if (nr_trials == 1)
      disp(a);
    endif
    results(i) = 0;
    while (!game_end(a))
      maxpoints = -1;
      maxaction = 0;
      for action = (1:4)
        [c, points, changed] = game_move(a, action);
        if (changed && points > maxpoints)
          maxpoints = points;
          maxaction = action;
          b = c;
        endif
      endfor
      results(i) += maxpoints;
      a = b;
      if (nr_trials == 1)
        game_disp_action(maxaction);
        disp(a);
      endif
    endwhile
  endfor
endfunction
