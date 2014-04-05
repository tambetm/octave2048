function [b, points] = game_move(a, direction)

  # all shifts and merges are done towards left,
  # so we need to rotate matrix first for other directions:
  # 1 - up,
  # 2 - right,
  # 3 - down,
  # 4 - left.
  # we could have used 0 as left, but starting from 1 works better as index.
  a = rot90(a, direction);

  # perform shifts and merges. a is the original matrix, b is the destination.
  b = zeros(size(a));
  points = 0;
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
        else
          if (b(row, i) != 0)
            i++;
          endif
          b(row, i) = a(row, j);
        endif
      endif
    endfor
  endfor

  # generate 2 or 4 to empty place
  empty = find(b == 0);
  if (length(empty) > 0)
    if (unifrnd(0, 1) < 0.9)
      value = 2;
    else
      value = 4;
    endif
    b(empty(randi(length(empty)))) = value;
  endif

  # restore original direction
  b = rot90(b, -direction);
endfunction
