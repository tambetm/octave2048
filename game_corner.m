function results = game_corner(nr_trials = 1)
  for i = (1:nr_trials)
    a = game_init();
    if (nr_trials == 1)
      disp(a);
    endif
    results(i) = 0;
    while (!game_end(a))
      for action = (1:4)
        [b, points, changed] = game_move(a, action);
        if (changed)
          break;
        endif
      endfor
      results(i) += points;
      a = b;
      if (nr_trials == 1)
        game_disp_action(action);
        disp(a);
      endif
    endwhile
  endfor
endfunction
