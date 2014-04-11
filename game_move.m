function [b, points, changed] = game_move(a, direction)

  # all shifts and merges are done towards left,
  # so we need to rotate matrix first for other directions:
  # 1 - shift up,
  # 2 - shift right,
  # 3 - shift down,
  # 4 - shift left.
  # we could have used 0 as left, but starting from 1 works better as index.
  a = rot90(a, direction);

  # perform shifts and merges. a is the original matrix, b is the destination.
  b = zeros(size(a));
  points = 0;
  changed = 0;
  for row = (1:size(a, 1))
    # i is the leftmost cell in b, that we are going to populate
    i = 1;
    # j is the current cell in a, that we are going to shift or merge
    for j = (1:size(a, 2))
      if (a(row, j) != 0)
        if (b(row, i) == a(row, j))
          b(row, i) += a(row, j);
          points += b(row, i);
          i++;
          changed = 1;
        else
          if (b(row, i) != 0)
            i++;
          endif
          b(row, i) = a(row, j);
          if (i != j)
            changed = 1;
          endif
        endif
      endif
    endfor
  endfor

  # generate 2 or 4 to empty place only if changed
  if (changed == 1)
    b = game_populate(b);
  endif

  # restore original direction
  b = rot90(b, -direction);
endfunction
