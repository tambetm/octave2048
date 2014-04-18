clear;

nrtrials = 1000;
groupsize = 100;
nrgroups = nrtrials / groupsize;

gamma = 0.9;    % discount factor
epsilon = 0.2;  % greedyness factor

results_noalfa = reshape(game_qtablenoalfa(nrtrials, gamma, epsilon), groupsize, nrgroups);
global Q;
save qtablenoalfa.mat
