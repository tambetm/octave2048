function [results, a] = game_corner2(nr_trials)
  for i = (1:nr_trials)
    a = game_init(4, 4);
    results(i) = 0;
    while (!game_end(a))
      for action = (1:4)
        [c, points, changed] = game_move(a, action);
        % if we got points, choose this action
        if (points > 0)
          b = c;
          break;
        endif
        % if we got no points, but matrix was changed, 
        % then prefer this action to actions that cause no change
        if (changed)
          b = c;
        endif
      endfor
      results(i) += points;
      a = b;
    endwhile
    disp(i)
  endfor
endfunction
