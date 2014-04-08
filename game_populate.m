function b = game_populate(a)
  b = a;
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
