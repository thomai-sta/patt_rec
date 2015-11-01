%% ENUMERATE CLASSES
% A 1
% B 2
% C 3
% D 4
% E 5
% F 6
% X 7
% + 8
% - 9
% =) 10

clear all
clc

angles_n = 8;
distances_n = 6;
K = 5;

classes = {};
classes{1} = 'A';
classes{2} = 'B';
classes{3} = 'C';
classes{4} = 'D';
classes{5} = 'E';
classes{6} = 'F';
classes{7} = 'X';
classes{8} = '+';
classes{9} = '-';
classes{10} = '=)';

load('alldata.mat');

raw_data = {};
features = {};
labels = [];
count = 1;

for i = 1:size(data.a, 1)
  % A
  raw_data{count} = data.a{i};
  labels(count) = 1;
  [~, ~, ~, features{count}] = FeatureExtract(raw_data{count}, angles_n, distances_n);
  count = count + 1;
  
  % B
  raw_data{count} = data.b{i};
  labels(count) = 2;
  [~, ~, ~, features{count}] = FeatureExtract(raw_data{count}, angles_n, distances_n);
  count = count + 1;
  
  % C
  raw_data{count} = data.c{i};
  labels(count) = 3;
  [~, ~, ~, features{count}] = FeatureExtract(raw_data{count}, angles_n, distances_n);
  count = count + 1;
  
  % D
  raw_data{count} = data.d{i};
  labels(count) = 4;
  [~, ~, ~, features{count}] = FeatureExtract(raw_data{count}, angles_n, distances_n);
  count = count + 1;
  
  % E
  raw_data{count} = data.e{i};
  labels(count) = 5;
  [~, ~, ~, features{count}] = FeatureExtract(raw_data{count}, angles_n, distances_n);
  count = count + 1;
  
  % F
  raw_data{count} = data.f{i};
  labels(count) = 6;
  [~, ~, ~, features{count}] = FeatureExtract(raw_data{count}, angles_n, distances_n);
  count = count + 1;
  
  % X
  raw_data{count} = data.x{i};
  labels(count) = 7;
  [~, ~, ~, features{count}] = FeatureExtract(raw_data{count}, angles_n, distances_n);
  count = count + 1;
  
  % +
  raw_data{count} = data.plus{i};
  labels(count) = 8;
  [~, ~, ~, features{count}] = FeatureExtract(raw_data{count}, angles_n, distances_n);
  count = count + 1;
  
  % -
  raw_data{count} = data.minus{i};
  labels(count) = 9;
  [~, ~, ~, features{count}] = FeatureExtract(raw_data{count}, angles_n, distances_n);
  count = count + 1;
  
  % =)
  raw_data{count} = data.smiley{i};
  labels(count) = 10;
  [~, ~, ~, features{count}] = FeatureExtract(raw_data{count}, angles_n, distances_n);
  count = count + 1;  
end


Indices = crossvalind('Kfold', labels, K);
trainData = features(Indices ~= 5);
train_sizes = cellfun(@(x) size(x, 2), trainData, 'UniformOutput', false);
train_sizes = cell2mat(train_sizes);
train_sizes = train_sizes';
train_data = zeros(max(train_sizes), size(trainData, 2));
for j = 1:size(trainData, 2)
  for i = 1:size(trainData{j}, 2)
    train_data(i, j) = trainData{j}(i);
  end
end

testData = features(Indices == 5);
test_sizes = cellfun(@(x) size(x, 2), testData, 'UniformOutput', false);
test_sizes = cell2mat(test_sizes);
test_sizes = test_sizes';
test_data = zeros(max(test_sizes), size(testData, 2));
for j = 1:size(testData, 2)
  for i = 1:size(testData{j}, 2)
    test_data(i, j) = testData{j}(i);
  end
end
train_labels = labels(Indices ~= 5);
test_labels = labels(Indices == 5);

save('hmm_data', 'train_data', 'train_labels', 'train_sizes', 'test_data', 'test_labels', 'test_sizes', 'classes');