clear all
close all
clc

load('hmm_data.mat');
load('hmm.mat');

raw = DrawCharacter;

[~, ~, ~, feature] = FeatureExtract(raw, angles_n, distances_n);

prediction = predict(hmm, feature', length(feature));

disp(classes(prediction))