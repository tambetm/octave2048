function a = game_init(rows = 3, cols = 3)
  a = game_populate(game_populate(zeros(rows, cols)));
endfunction
