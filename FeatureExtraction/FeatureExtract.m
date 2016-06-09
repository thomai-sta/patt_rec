function [sequence, angles, distances, feature] = FeatureExtract(init_sequence, angles_n, distances_n)

% Remove all zeros, for when the pen is up
pen_position = init_sequence(3, :);
dif = [diff(pen_position) 0];
pen_position(dif < 0) = 2;
pen_position = pen_position(pen_position ~= 0);
stroke = 1;
for i = 1:length(pen_position)
  if (pen_position(i) == 2)
    pen_position(i) = stroke;
    stroke = stroke + 1;
  else
    pen_position(i) = stroke;
  end
end

sequence = init_sequence(1:2, init_sequence(3, :) == 1);

% Removing duplicate adjacent values
diffs = [diff(sequence(1,:)); diff(sequence(2,:))];
idx = ~(diffs(1, :) == 0 & diffs(2, :) == 0);
sequence = sequence(:, idx);
pen_position = pen_position(idx);

% Scale character
% min_y = min(sequence(2, :));
% max_y = max(sequence(2, :));

min_x = min(sequence(1, :));
max_x = max(sequence(1, :));

% height = (max_y - min_y);
width = (max_x - min_x);
sequence(1, :) = sequence(1, :) / width;
sequence(2, :) = sequence(2, :) / width;

% Translate character
min_x = min(sequence(1, :));
min_y = min(sequence(2, :));
sequence(1, :) = sequence(1, :) - min_x;
sequence(2, :) = sequence(2, :) - min_y;

% Get angles and distances
dx = diff(sequence(1,:));
dy = diff(sequence(2,:));
angles = atan2(dy, dx);
distances = sqrt(dx .* dx + dy .* dy);

% Quantization
angles = quantiz(angles, linspace(-pi, pi, angles_n + 1));
distances = quantiz(distances, linspace(0, 3, distances_n));

% Creating levels for each jump
pen_position = [pen_position(2: end) pen_position(end)];
stroke = pen_position(1);
curr = distances(1);
for i = 2:length(distances)
  if (pen_position(i) == stroke)
    distances(i) = curr;
  else
    curr = distances(i);
    stroke = pen_position(i);
  end
end


% Map everything to a 1D feature
feature = (distances-1) * angles_n + angles;

end

