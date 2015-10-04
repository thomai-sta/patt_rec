function PlotXY(raw_s)

[~, a, d] = FeatureExtract(raw_s);

xx = 1:length(a);

figure;
subplot(211);
plot(xx, a);
title('Angle');
subplot(212);
plot(xx, d);
title('Distance');


end

