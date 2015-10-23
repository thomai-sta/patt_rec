% This scripts I got from the almighty interwebz. It works in a weird way,
% bare with me. It takes all *.mat files in a current directory creates
% using createOneFile script and merges all the data from those files into
% 1 file. The current directory must not contain any other *.mat files, but
% the ones that are supposed to be merged. The script will save all the
% data into a new file alldata.mat, remember that script can't be ran
% again until that file is deleted.
fn = dir('*.mat');
% take each file
for i=1:length(fn)
    fnam = fn(i).name;
    vals = load(fnam);
    vn = fieldnames(vals);

    % take each var/file(i)
    for j=1:length(vn)
        if i == 1
            data.(vn{j}) = vals.(vn{j});
        else
            data.(vn{j}) = [data.(vn{j}); vals.(vn{j})];
        end
    end
end
save('alldata','data');
clear;
