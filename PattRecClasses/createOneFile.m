% This is just a script that takes all the *.mat files in the directory data/
% created using the function createSign and puts all the data in one file
% called data.mat
save 'data';
files = dir('data/*.mat');
for i=1:length(files)
    name = files(i).name;
    s = load(['data/' name]);
    varname = textscan(name, '%s', 'delimiter', '.');
    varname = varname{1}(1);
    varname = varname{1};
    save('data', '-struct', 's', varname, '-append');
end
clear;