results(1, :) = game_random(100);
results(2, :) = game_corner(100);
results(3, :) = game_corner2(100);
results(4, :) = game_greedy(100);

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

subplot(2,2,4);
hist(results(4, :));
title('Greedy algorithm');
xlabel('Score');
ylabel('Nr of trials');

figure(2);

errorbar(mean(results'), std(results'));
set(gca,'xtick',[1 2 3 4]);
set(gca,'xticklabel',{'random', 'corner', 'corner2', 'greedy'});
