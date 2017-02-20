clear
close all
clc

load('hmm_data');

nStates = [3, 6, 8, 8, 4, 3, 2, 2, 2, 6];

nObservations = angles_n * distances_n;

hmm = cell(10, 1);

for class = 1:10
  pD = DiscreteD(ones(nStates(class), nObservations));
  idx = (train_labels == class);
  a = train_data(:, idx);
  conc = a(a > 0);
  hmm{class} = ...
    MakeLeftRightHMM(nStates(class), pD, conc', train_sizes(idx)');
  temp = zeros(nStates(class), nObservations);
  hmm{class}.OutputDistr.ProbMass;
  b = hmm{class}.OutputDistr.ProbMass;
  for i = 1:nStates(class)
    temp(i, 1:size(b, 1)) = hmm{class}.OutputDistr(i, 1).ProbMass';
  end
  temp(temp == 0) = 0.000001;
  temp = temp ./ repmat(sum(temp, 2), [1 size(temp, 2)]);
  
  pD1 = DiscreteD(temp);
  hmm{class}.OutputDistr = pD1;
end

save('hmm', 'hmm');