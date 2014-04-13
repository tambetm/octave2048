function a = game_decode(s, base = 12, cols = 4, rows = 4)
  a = zeros(cols, rows);
  for i = (numel(a):-1:1)
    n = mod(s, base);
    if (n > 0)
      a(i) = 2 ** n;
    endif
    s = idivide(s, base);
  endfor
endfunction