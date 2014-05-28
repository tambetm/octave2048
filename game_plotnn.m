clear;

load results_nn;
load nn3_results;

resultsa = [results_nn3; results_nn32; results_nn33; results_nn34; results_nn35];
figure;
errorbar(mean(resultsa, 2), std(resultsa, 0, 2));
xlabel('Nr of trials (x1000)');
ylabel('Score');
title('Results of neural network');

resultsb = [results1; results2; results3; results4; results5; reshape(results10, 10, 1000)];

figure;
errorbar(mean(resultsb, 2), std(resultsb, 0, 2));
xlabel('Nr of trials (x1000)');
ylabel('Score');
title('Results of neural network');

figure;
plot(mean(resultsb, 2));
xlabel('Nr of trials (x1000)');
ylabel('Score');
title('Results of neural network');
