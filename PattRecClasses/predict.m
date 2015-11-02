function [class] = predict(hmms, sequences, sizes)

nSequences = length(sizes);
nClasses = size(hmms, 1);

class = zeros(nSequences, 1);
probs = zeros(nClasses, 1);
for i = 1:nSequences
  for j = 1:nClasses
    probs(j) = hmms{j}.logprob(sequences(1:sizes(i), i)');
  end
  [~, class(i)] = max(probs);
end