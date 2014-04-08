function [results, a] = game_corner(nr_trials)
  for i = (1:nr_trials)
    a = game_init(4, 4);
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
    endwhile
    disp(i)
  endfor
endfunction
