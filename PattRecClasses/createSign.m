function createSign(name, N)
% Open up character drawing window N times, saves N observations in
% a cell array and saves the cell array in a file with name <name> and
% the variable inside has the name <name>
s = cell(N,1);
for i=1:N
    s{i} = DrawCharacter;
end

S.(name) = s;
save(name, '-struct', 'S', name);

end

