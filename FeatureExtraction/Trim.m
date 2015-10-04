function ret_s = Trim(s)
% cuts head and tail where nothing happens (3. row is 0)

is = find(s(3, :));
% ret_s = s(:, is(1):is(end));
ret_s = s(1:2, is);
end

