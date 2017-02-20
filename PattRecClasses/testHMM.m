clear all
close all
clc

load('hmm_data');
load('hmm');

predictions = predict(hmm, test_data, test_sizes);

test_labels(predictions ~= test_labels')
predictions(predictions ~= test_labels')