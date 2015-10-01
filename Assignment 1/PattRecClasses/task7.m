clear all
clc


q = [0.75; 0.25]

A = [0.99 0.01; 0.03 0.97]

% b1 = GaussD('Mean', 0, 'StDev', 1);
% b2 = GaussD('Mean', 3, 'StDev', 2);

% B = [b1; b2]
b1 = GaussD('Mean', [5; 20], 'Covariance', [2 1; 1 4]);
b2 = GaussD('Mean', [0; 10], 'Covariance', [1 6; 6 3]);

B = [b1; b2];

%% HMM 
mc = MarkovChain(q, A);
hmm = HMM(mc, B);
seq = rand(hmm, 500);
plot([1:500], seq(1, :))
hold on
plot([1:500], seq(2, :))
grid
xlabel('timesteps (t)')
ylabel('Output Xt1 and Xt2')
title('Output sequence of 500 states')
% X_mean = mean(seq);
% X_var = var(seq);
% S1_freq = sum(seq == 1) / length(seq);
% S2_freq = sum(seq == 2) / length(seq);