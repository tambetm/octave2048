function results = game_random(nr_trials)
  for i = (1:nr_trials)
    a = zeros(4, 4);
    results(i) = 0;
    while (!game_end(a))
      [b, points] = game_move(a, randi(4));
      results(i) += points;
      a = b;
    endwhile
    disp(i)
  endfor
endfunction
