function result = game_end(a)
  # if all cells are nonzero and stay nonzero after any move
  if (all(a) && 
      all(game_move(a, 1)) && 
      all(game_move(a, 2)) && 
      all(game_move(a, 3)) && 
      all(game_move(a, 4)))
    result = 1;
  else
    result = 0;
  endif
endfunction
