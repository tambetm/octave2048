addpath(genpath('../DeepLearnToolbox'));
clear;

nrtrials = 10000;
groupsize = 1000;
nrgroups = nrtrials / groupsize;

alfa = 0.01;    % learning rate
gamma = 0.9;    % discount factor
epsilon = 0.05; % greedyness factor

results_nngamma9 = reshape(game_nn5(nrtrials, alfa, gamma, epsilon), groupsize, nrgroups);
global nn;
save results_nngamma9.mat
