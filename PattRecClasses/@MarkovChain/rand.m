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
[nStates1, nStates2] = size(mc.TransitionProb);

sum_transition_prob = cumsum(mc.TransitionProb, 2);
sum_initial_prob = cumsum(mc.InitialProb);

% Generate first state
temp = rand;
found = 0;
j = 1;
S = [];
while (j <= nStates1 && ~found)
  if (temp <= sum_initial_prob(j))
    S = [S j];
    found = 1;
  end
  j = j + 1;
end

% Generate rest of states
End = 0;
i = 2;
while (i <= T && ~End)
  temp = rand;
  found = 0;
  j = 1;
  while (j <= nStates2 && ~found)
    if (temp <= sum_transition_prob(S(end), j))
      if (j == nStates2 && nStates2 > nStates1)
        End = 1;
      else
        S = [S j];
      end
      found = 1;
    end
    j = j + 1;
  end
  i = i + 1;
end