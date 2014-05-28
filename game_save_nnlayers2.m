addpath(genpath('../DeepLearnToolbox'));
clear;

nrtrials = 10000;
groupsize = 1000;
nrgroups = nrtrials / groupsize;

alfa = 0.01;    % learning rate
gamma = 0;      % discount factor
epsilon = 0.05; % greedyness factor

results_nnlayers2 = reshape(game_nn5(nrtrials, alfa, gamma, epsilon, [100 100]), groupsize, nrgroups);
global nn;
save results_nnlayers2.mat
