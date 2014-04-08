function result = game_end(a)
  # if all cells are filled out and there are no two adjacent equal cells
  if (all(a))
    for i = (1:size(a, 1))
      for j = (1:size(a, 2))
        if (i > 1 && a(i,j) == a(i - 1, j))
          result = 0;
          return;
        endif
        if (j > 1 && a(i,j) == a(i, j - 1))
          result = 0;
          return;
        endif
      endfor
    endfor
    result = 1;
  else 
    result = 0;
  endif
endfunction
