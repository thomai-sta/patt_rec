function R = rand(pD, nData)
% R = rand(pD, nData) returns random scalars drawn from given Discrete Distribution.
%
% Input:
% pD = DiscreteD object
% nData = scalar defining number of wanted random data elements
%
% Result:
% R = row vector with integer random data drawn from the DiscreteD object pD
%    (size(R)= [1, nData]
%
% ----------------------------------------------------
% Code Authors: Thomai Stathopoulou & Dario Vidas
% ----------------------------------------------------

if numel(pD) > 1
  error('Method works only for a single DiscreteD object');
end;

nValues = length(pD.ProbMass);
sum_prob = cumsum(pD.ProbMass);

R = zeros(1, nData);
for i = 1:nData
  temp = rand;
  j = 1;
  found = 0;
  % Generate the random number
  while (j <= nValues && found == 0)
    if (temp <= sum_prob(j))
      R(i) = j;
      found = 1;
    end
    j = j + 1;
  end
end
