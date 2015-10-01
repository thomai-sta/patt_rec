function ret_s = RemovePenUp(s)
% removes all the instances when pen is up except the first and last

curr = 1;
idx = zeros(1, length(s));
k = 1;
for i = 1:length(s)
    if s(3,i) == 0 && curr == 1
        idx(k) = i;
        k = k + 1;
    elseif s(3,i) == 1 && curr == 0
        idx(k) = i-1;
        k = k + 1;
    end
    curr = s(3,i);
end

if s(3,end) == 0 && curr == 0
    idx(k) = length(s);
    k = k + 1;
end

idx = [1, idx(1:k-1), length(s)];
ret_s = zeros(size(s));
k = 1;
for i = 1:2:length(idx)
    l = idx(i+1) - idx(i);
    ret_s(:,k:k+l) = s(:,idx(i):idx(i+1));
    k = k + l + 1;
end

ret_s = ret_s(:,1:k-1);
end

