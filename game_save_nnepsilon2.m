addpath(genpath('../DeepLearnToolbox'));
clear;

nrtrials = 10000;
groupsize = 1000;
nrgroups = nrtrials / groupsize;

alfa = 0.01;    % learning rate
gamma = 0;      % discount factor
epsilon = 0.2;  % greedyness factor

results_nnepsilon2 = reshape(game_nn5(nrtrials, alfa, gamma, epsilon), groupsize, nrgroups);
global nn;
save results_nnepsilon2.mat
