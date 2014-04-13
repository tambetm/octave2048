results = game_qtable(10000, 1, 0.9, 0.2);
resultsmean = accumarray((idivide((1:10000).-1, 1000, 'floor').+1)',results, [], @mean);
plot(resultsmean);
set(gca,'xtick',(1:10));
set(gca,'xticklabel',(0:1000:10000));
