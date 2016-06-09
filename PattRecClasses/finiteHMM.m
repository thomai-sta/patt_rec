clc
clear all

q = [0.7; 0.3]

A = [0.9 0.05 0.05; 0.05 0.9 0.05]

b1 = GaussD('Mean', 0, 'StDev', 1);
b2 = GaussD('Mean', 3, 'StDev', 2);
b3 = GaussD('Mean', 6, 'StDev', 4);

B = [b1; b2]

%% Markov Chain
mc = MarkovChain(q, A);
for i = 1:1000
  seq = rand(mc, 100)
  len(i) = length(seq);
end

mean(len)
sum(len < 100)/1000