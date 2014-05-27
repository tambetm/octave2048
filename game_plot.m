clear;

results(1, :) = game_random(1000);
results(2, :) = game_corner(1000);
results(3, :) = game_corner2(1000);
results(4, :) = game_greedy(1000);

clf;

figure(1);

subplot(2,2,1);
hist(results(1, :));
title('Random algorithm');
#xlabel('Score');
ylabel('Nr of trials');

subplot(2,2,2);
hist(results(2, :));
title('Corner algorithm');
#xlabel('Score');
ylabel('Nr of trials');

subplot(2,2,3);
hist(results(3, :));
title('Corner2 algorithm');
xlabel('Score');
ylabel('Nr of trials');
%set(gca,'xtick',(0:1000:10000));

subplot(2,2,4);
hist(results(4, :));
title('Greedy algorithm');
xlabel('Score');
ylabel('Nr of trials');

figure(2);

errorbar(mean(results'), std(results'));
set(gca,'xtick',[1 2 3 4]);
set(gca,'xticklabel',{'random', 'corner', 'corner2', 'greedy'});
ylabel('Score');

load qtablepath_epsilon5a results_epsilon5

figure(1);

subplot(2,2,1);
hist(results(1, :));
title('Random algorithm');
#xlabel('Score');
ylabel('Nr of trials');

%subplot(2,2,2);
%hist(results(2, :));
%title('Corner algorithm');
%xlabel('Score');
%ylabel('Nr of trials');

subplot(2,2,2);
hist(results(3, :));
title('Corner2 algorithm');
%xlabel('Score');
ylabel('Nr of trials');
%set(gca,'xtick',(0:1000:20000));

subplot(2,2,3);
hist(results(4, :));
title('Greedy algorithm');
xlabel('Score');
ylabel('Nr of trials');

subplot(2,2,4);
hist(results_epsilon5(:, end)');
title('Q-table algorithm');
xlabel('Score');
ylabel('Nr of trials');
%set(gca,'xtick',(0:1000:20000));

figure(2);

resultsa = [results; results_epsilon5(:, end)'];
errorbar(mean(resultsa'), std(resultsa'));
set(gca,'xtick',[1 2 3 4 5]);
set(gca,'xticklabel',{'random', 'corner', 'corner2', 'greedy', 'qtable'});
ylabel('Score');

load nn3_results results10

figure(3);
resultsb = [results; results10(9001:10000)];
errorbar(mean(resultsb'), std(resultsb'));
set(gca,'xtick',[1 2 3 4 5]);
set(gca,'xticklabel',{'random', 'corner', 'corner2', 'greedy', 'neural net'});
ylabel('Score');


figure(4);

subplot(2,2,1);
hist(results(1, :));
title('Random algorithm');
#xlabel('Score');
ylabel('Nr of trials');

%subplot(2,2,2);
%hist(results(2, :));
%title('Corner algorithm');
%xlabel('Score');
%ylabel('Nr of trials');

subplot(2,2,2);
hist(results(3, :));
title('Corner2 algorithm');
%xlabel('Score');
ylabel('Nr of trials');
set(gca,'xtick',(0:1000:20000));

subplot(2,2,3);
hist(results(4, :));
title('Greedy algorithm');
xlabel('Score');
ylabel('Nr of trials');

subplot(2,2,4);
hist(results10(9001:10000));
title('Neural net algorithm');
xlabel('Score');
ylabel('Nr of trials');
set(gca,'xtick',(0:1000:20000));
