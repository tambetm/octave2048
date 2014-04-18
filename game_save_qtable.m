clear;

nrtrials = 100000;
groupsize = 1000;
nrgroups = nrtrials / groupsize;

alfa = 1;       % learning rate
gamma = 0.9;    % discount factor
epsilon = 0.2;  % greedyness factor

results = reshape(game_qtable(nrtrials, alfa, gamma, epsilon), groupsize, nrgroups);
global Q;
save qtable.mat
