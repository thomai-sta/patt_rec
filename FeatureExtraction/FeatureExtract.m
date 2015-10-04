function [s, a, d] = FeatureExtract(s)

% pen up (removing zeros)
idx = s(3,:) == 1;
s = s(:,idx);

% removing duplicate adjacent
diffs = [diff(s(1,:)); diff(s(2,:))];
idx = ~(diffs(1,:) == 0 & diffs(2,:) == 0);
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
a = atan(dy ./ dx);
d = sqrt(dx .* dx + dy .* dy);

% quantization
a_n = 50;
d_n = 50;
a = quantiz(a, linspace(-pi/2, pi/2, a_n));
d = quantiz(d, linspace(0, 1, d_n));

% histc(a, 0:a_n)
% histc(d, 0:d_n)

end

