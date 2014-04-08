function [results, a] = game_corner2(nr_trials = 1)
  for i = (1:nr_trials)
    a = game_init();
    results(i) = 0;
    actions = (1:4);
    while (!game_end(a))
      for action = actions
        [b, points, changed] = game_move(a, action);
        if (changed)
          break;
        endif
      endfor
      results(i) += points;
      a = b;
      % swap first two actions
      actions([1 2]) = actions([2 1]);
    endwhile
  endfor
endfunction
