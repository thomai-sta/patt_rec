clear all
clc


q = [0.75; 0.25]

A = [0.99 0.01; 0.03 0.97]

b1 = GaussD('Mean', 0, 'StDev', 1);
b2 = GaussD('Mean', 3, 'StDev', 2);

B = [b1; b2]

%% HMM 
mc = MarkovChain(q, A);
hmm = HMM(mc, [b1; b2]);
seq = rand(hmm, 500);
figure
plot([1:500], seq);
grid
title('Output sequence')
xlabel('timesteps (t)')
ylabel('Xt')