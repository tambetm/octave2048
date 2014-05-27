function game_disp_action(action, src = '')
  action_labels = {'UP', 'RIGHT', 'DOWN', 'LEFT'};
  disp(strcat(action_labels{action}, src));
endfunction
