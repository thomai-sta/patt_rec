clear all
clc
close all


q = [0.75; 0.25]

A = [0.99 0.01; 0.03 0.97]

b1 = GaussD('Mean', 0, 'StDev', 1);
b2 = GaussD('Mean', 0, 'StDev', 2);

B = [b1; b2]

%% HMM 
mc = MarkovChain(q, A);
hmm = HMM(mc, [b1; b2]);
seq = rand(hmm, 500);
figure
plot([1:500], seq);
hold on
b = 2.2 * ones(1, 500);
plot([1:500], b)
plot([1:500], -b)
grid
title('Output sequence', 'FontSize', 20)
xlabel('timesteps (t)', 'FontSize', 20)
ylabel('Xt', 'FontSize', 20)