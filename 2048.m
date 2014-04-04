function [b, score] = move_left(a)
  b = zeros(size(a));
  score = 0;
  for row = (1:size(a, 1))
    i = 1;
    for j = (1:size(a, 2))
      if (a(row, j) != 0)
        if (b(row, i) == a(row, j))
          b(row, i) += a(row, j);
          score += b(row, i);
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
endfunction

function [b, score] = move_right(a)
  a = fliplr(a);
  [b, score] = move_left(a);
  b = fliplr(b);
endfunction

function [b, score] = move_down(a)
  a = rot90(a, -1);
  [b, score] = move_left(a);
  b = rot90(b);
endfunction

function [b, score] = move_up(a)
  a = rot90(a);
  [b, score] = move_left(a);
  b = rot90(b, -1);
endfunction
