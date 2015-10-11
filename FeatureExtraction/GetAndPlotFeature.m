function GetAndPlotFeature(raw_sequence)

angles_n = 8;
distances_n = 6;

[clean_sequence, angle, distance, feature] = FeatureExtract(raw_sequence, angles_n, distances_n);

% Plot Initial Character
figure;
scatter(raw_sequence(1, raw_sequence(3, :) == 1), raw_sequence(2, raw_sequence(3, :) == 1))
title('Initial Character')
axis([0 1 0 1])


% Plot Clean Character
figure;
scatter(clean_sequence(1, :), clean_sequence(2, :))
title('Translated and Scaled Character')
axis([0 1 0 1])


% Plot features
figure;
subplot(311);
plot(1:length(angle), angle);
axis([0 length(feature) 0 angles_n])
grid
title('Angle');

% distance
subplot(312);
plot(1:length(distance), distance);
axis([0 length(feature) 0 distances_n])
grid
title('Distance');

subplot(313);
plot(1:length(feature), feature);
grid
title('Feature');

end

