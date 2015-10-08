function [s, a, d, f] = FeatureExtract(s)

% pen up (removing zeros)
%idx = s(3,:) == 1;
%s = s(:,idx);
idx = find(s(3,:));
s = s(:,idx(1):idx(end));
s = RemovePenUp(s);

% removing duplicate adjacent
diffs = [diff(s(1,:)); diff(s(2,:))];
idx = ~(diffs(1,:) == 0 & diffs(2,:) == 0 & s(3,1:end-1) == 1); %LOLHACK
s = s(:,idx);

% scaling character
min_y = min(s(2,:));
max_y = max(s(2,:));
height = max_y - min_y;
s(1,:) = s(1,:) / height;
s(2,:) = s(2,:) / height;

% moving character
min_x = min(s(1,:));
min_y = min(s(2,:));
s(1,:) = s(1,:) - min_x;
s(2,:) = s(2,:) - min_y;

% feature itself
dx = diff(s(1,:));
dy = diff(s(2,:));
a = atan2(dy, dx);
d = sqrt(dx .* dx + dy .* dy);

% quantization
a_n = 8;
d_n = 6;
a = quantiz(a, linspace(-pi, pi, a_n));
d = quantiz(d, linspace(0, 1.5, d_n));

% creating levels for each jump
f = zeros(1, length(d));
idx = find(s(3,:) == 0);
for i=1:2:length(idx)
    i1 = idx(i);
    f(i1) = d(i1);
end

curr = 1;
for i=1:length(f)
    if f(i) ~= curr && f(i) ~= 0
        curr = f(i);
    else
        f(i) = curr;
    end
end
d = f;

% creating 1d discrete feature
f = (d-1) * a_n + a;

end

