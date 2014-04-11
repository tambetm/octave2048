function a = game_init(rows = 4, cols = 4)
  a = game_populate(game_populate(zeros(rows, cols)));
endfunction
