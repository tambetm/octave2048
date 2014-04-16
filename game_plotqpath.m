results = game_qtablepath(10000, 1, 0.9, 0.2);
resultsgrouped = reshape(results, 1000, 10);
resultsmean = mean(resultsgrouped);
resultsstd = std(resultsgrouped);
errorbar(resultsmean, resultsstd);
set(gca,'xtick',(1:10));
set(gca,'xticklabel',(1000:1000:10000));
xlabel('Nr of trials')
ylabel('Average score');
