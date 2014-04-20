clear;

nrtrials = 100000;
groupsize = 1000;
nrgroups = nrtrials / groupsize;

alfa = 0.2;     % learning rate
gamma = 0.9;    % discount factor
epsilon = 0.2;  % greedyness factor

results_alfa2 = reshape(game_qtablepath(nrtrials, alfa, gamma, epsilon), groupsize, nrgroups);
global Q;
save qtablepath_alfa2.mat
