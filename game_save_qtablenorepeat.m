clear;

nrtrials = 1000;
groupsize = 100;
nrgroups = nrtrials / groupsize;

gamma = 0.9;    % discount factor
final_epsilon = 0.05; % final greedyness factor
trials_coeff = 0.1;   % linearly decrease greedyness for 10% of trials

results_norepeat = reshape(game_qtablenorepeat(nrtrials, gamma, final_epsilon, trials_coeff), groupsize, nrgroups);
global Q;
save qtablenorpeat.mat
