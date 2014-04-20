clear;
clf;

load plotq1 results
results_qtable = results;
load plotq2 results
results_qtablepath = results;
%load qtablepath results
%results_qtablepath = [results zeros(1000, 90)];
load qtablepath_alfa2a results_alfa2
load qtablepath_alfa5a results_alfa5
%load qtablepath_gamma1 results_gamma1
%results_gamma1 = [results_gamma1 zeros(1000, 90)];
load qtablepath_epsilon5a results_epsilon5
load qtablenoalfaa results_noalfa
load qtablenoepsilona results_noepsilon
load qtablenorepeata results_norepeat

figure(1);
plot([mean(results_qtable)' mean(results_qtablepath)' mean(results_alfa2)' mean(results_alfa5)' mean(results_epsilon5)' ...
      mean(results_noalfa)' mean(results_noepsilon)' mean(results_norepeat)']);
xlabel('Nr of trials (x1000)');
ylabel('Score');
legend({'Vanilla Q-table', 'Q-table with path update', 'Q-table with alpha=0.2', 'Q-table with alpha=0.5', 'Q-table with epsilon=0.05', ...
        'Q-table with alpha=1/N', 'Q-table with epsilon decay to 0.05', 'Q-table with only moves that change matrix'}, ...
        'location', 'southeast');

figure(2);       
errorbar([mean(results_qtable); mean(results_qtablepath); mean(results_alfa2); mean(results_alfa5); mean(results_gamma1); mean(results_epsilon5); mean(results_noalfa); mean(results_noepsilon); mean(results_norepeat)], ...
      [std(results_qtable); std(results_qtablepath); std(results_alfa2); std(results_alfa5); std(results_gamma1); std(results_epsilon5); std(results_noalfa); std(results_noepsilon); std(results_norepeat)]);
%errorbar([mean(results_alfa2); mean(results_alfa5); mean(results_epsilon5); mean(results_noalfa); mean(results_noepsilon); mean(results_norepeat)], ...
%      [std(results_alfa2); std(results_alfa5); std(results_epsilon5); std(results_noalfa); std(results_noepsilon); std(results_norepeat)]);
legend({'Vanilla Q-table', 'Q-table with path update', 'Q-table with alpha=0.2', 'Q-table with alpha=0.5', 'Q-table with epsilon=0.05', ...
        'Q-table with alpha=1/N', 'Q-table with epsilon decay to 0.05', 'Q-table with only moves that change matrix'}, ...
        'location', 'southeast');
