clf;

subplot(2,1,1);
hist(random_results);
title('Random algorithm');
#xlabel('Score');
ylabel('Nr of trials');

subplot(2,1,2);
hist(corner_results);
title('Corner algorithm');
xlabel('Score');
ylabel('Nr of trials');
