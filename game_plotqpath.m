results = game_qtablepath(10000, 1, 0.9, 0.5);
resultsmean = mean(reshape(results, 1000, 10));
plot(resultsmean);
set(gca,'xtick',(1:10));
set(gca,'xticklabel',(1000:1000:10000));
xlabel('Nr of trials')
ylabel('Average score');
