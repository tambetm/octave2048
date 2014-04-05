random_results = game_random(100);
corner_results = game_corner(100);
random3_results = game_random3(100);
greedy_results = game_greedy(100);

clf;

subplot(2,2,1);
hist(random_results);
title('Random algorithm');
#xlabel('Score');
ylabel('Nr of trials');

subplot(2,2,2);
hist(corner_results);
title('Corner algorithm');
#xlabel('Score');
ylabel('Nr of trials');

subplot(2,2,3);
hist(random3_results);
title('Random3 algorithm');
xlabel('Score');
ylabel('Nr of trials');

subplot(2,2,4);
hist(greedy_results);
title('Greedy algorithm');
xlabel('Score');
ylabel('Nr of trials');
