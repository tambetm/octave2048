clear;

nrtrials = 100000;
groupsize = 1000;
nrgroups = nrtrials / groupsize;

gamma = 0.9;    % discount factor
final_epsilon = 0.05; % final greedyness factor
trials_coeff = 0.1;   % linearly decrease greedyness for 10% of trials

results_noepsilon = reshape(game_qtablenoepsilon(nrtrials, gamma, final_epsilon, trials_coeff), groupsize, nrgroups);
global Q;
save qtablenoepsilon.mat
