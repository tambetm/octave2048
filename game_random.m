function [results, a] = game_random(nr_trials = 1)
  for i = (1:nr_trials)
    a = game_init();
    results(i) = 0;
    while (!game_end(a))
      [b, points] = game_move(a, randi(4));
      results(i) += points;
      a = b;
    endwhile
  endfor
endfunction
