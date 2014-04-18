clear;

nrtrials = 1000;
groupsize = 100;
nrgroups = nrtrials / groupsize;

alfa = 1;       % learning rate
gamma = 1;      % discount factor
epsilon = 0.2;  % greedyness factor

results_gamma1 = reshape(game_qtablepath(nrtrials, alfa, gamma, epsilon), groupsize, nrgroups);
global Q;
save qtablepath_gamma1.mat
