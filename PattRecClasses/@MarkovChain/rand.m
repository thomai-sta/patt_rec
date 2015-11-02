function S = rand(mc, T)
%S=rand(mc,T) returns a random state sequence from given MarkovChain object.
%
%Input:
%mc=    a single MarkovChain object
%T= scalar defining maximum length of desired state sequence.
%   An infinite-duration MarkovChain always generates sequence of length=T
%   A finite-duration MarkovChain may return shorter sequence,
%   if END state was reached before T samples.
%
%Result:
%S= integer row vector with random state sequence,
%   NOT INCLUDING the END state,
%   even if encountered within T samples
%If mc has INFINITE duration,
%   length(S) == T
%If mc has FINITE duration,
%   length(S) <= T
%
%---------------------------------------------
%Code Authors:
%---------------------------------------------
S=zeros(1,T);%space for resulting row vector
nS=mc.nStates;
q = DiscreteD(mc.InitialProb);
%sample initial state
p = q.rand(1);

a = DiscreteD(); %just a temp object creation
for i=1:T
    %get transition probabilities for this state
    v = mc.TransitionProb(p,:).*mc.InitialProb(p);
    %make distribution from the new probabilities
    a.ProbMass = v;
    %sample from new distribution to get state
    S(i) = a.rand(1);
    %assign new state to p
    p = S(i);
end