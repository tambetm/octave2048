function n = game_state(matrix, base = 10)
  % rotate matrix to the left so indexes are lower
  matrix = rot90(matrix, 1);
  n = uint64(0);
  for i = (1:numel(matrix))
    n *= base;
    if (matrix(i) > 0)
      n += log2(matrix(i));
    endif
  endfor
endfunction
