q = [1; 0];
A = [0.9 0.1 0;
     0   0.9 0.1];
    
x = [ -0.2  2.6 1.3 ];
c = [ 1 0.1625 0.8266 0.0581 ];

b1 = GaussD('Mean',0, 'StDev', 1);
b2 = GaussD('Mean',3, 'StDev', 2);
% 
% pX = [b1.prob(x);
%       b2.prob(x)];
    
mc = MarkovChain(q, A);

hmm = HMM(mc, [b1;b2]);

pX = hmm.OutputDistr.prob(x);

[alphaHat, c] = forward(mc, pX)

mc = MarkovChain(q, A(:,1:end-1));
[alphaHat, c] = forward(mc, pX)