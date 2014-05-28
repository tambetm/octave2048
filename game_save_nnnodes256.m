addpath(genpath('../DeepLearnToolbox'));
clear;

nrtrials = 10000;
groupsize = 1000;
nrgroups = nrtrials / groupsize;

alfa = 0.01;    % learning rate
gamma = 0;      % discount factor
epsilon = 0.05; % greedyness factor

results_nnnodes256 = reshape(game_nn5(nrtrials, alfa, gamma, epsilon, [256]), groupsize, nrgroups);
global nn;
save results_nnnodes256.mat
