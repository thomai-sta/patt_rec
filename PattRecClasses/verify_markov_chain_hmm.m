q = [0.75;
     0.25]

A = [0.99 0.01;
     0.03 0.97]

b1 = GaussD('Mean', 0, 'StDev', 1);
b2 = GaussD('Mean', 3, 'StDev', 2);

B = [b1; b2];

%% Markov Chain
mc = MarkovChain(q, A);
seq = rand(mc, 10000);
S1_freq = sum(seq == 1) / length(seq);
S2_freq = sum(seq == 2) / length(seq);