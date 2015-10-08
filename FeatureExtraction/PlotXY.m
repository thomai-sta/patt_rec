function PlotXY(raw_s)

[~, a, d, f] = FeatureExtract(raw_s);

figure;

subplot(311);
plot(1:length(a), a);
title('Angle');

subplot(312);
plot(1:length(d), d);
title('Distance');

subplot(313);
plot(1:length(f), f);
title('Feature');

end

