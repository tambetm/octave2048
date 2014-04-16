clear;

nrtrials = 10000;
groupsize = 1000;
nrgroups = nrtrials / groupsize;

alfa = 1;       % learning rate
gamma = 0.9;    % discount factor
epsilon = 0.2;  % greedyness factor

results(:,:, 1) = reshape(game_qtable(nrtrials, alfa, gamma, epsilon), groupsize, nrgroups);
results(:,:, 2) = reshape(game_qtablepath(nrtrials, alfa, gamma, epsilon), groupsize, nrgroups);

errorbar(squeeze(mean(results)), squeeze(std(results)));
set(gca,'xtick',(1:nrgroups));
set(gca,'xticklabel',(groupsize:groupsize:nrtrials));
xlabel('Nr of trials')
ylabel('Average score');
legend('Q-table', 'Q-table with path update');
