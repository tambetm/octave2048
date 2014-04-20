clear;

nrtrials = 100000;
groupsize = 1000;
nrgroups = nrtrials / groupsize;

alfa = 1;       % learning rate
gamma = 0.9;    % discount factor
epsilon = 0.05;  % greedyness factor

results_epsilon5 = reshape(game_qtablepath(nrtrials, alfa, gamma, epsilon), groupsize, nrgroups);
global Q;
save qtablepath_epsilon5.mat
