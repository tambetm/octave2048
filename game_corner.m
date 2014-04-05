function results = game_corner(nr_trials)
  for i = (1:nr_trials)
    a = zeros(4, 4);
    results(i) = 0;
    while (!game_end(a))
      for action = (1:4)
        [b, points] = game_move(a, action);
        if (points > 0)
          break;
        endif
      endfor
      results(i) += points;
      a = b;
    endwhile
    disp(i)
  endfor
endfunction
