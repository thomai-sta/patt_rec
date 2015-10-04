function PlotXY(raw_s)

s = FeatureExtract(raw_s);

xx = 1:length(s);

figure;
subplot(211);
plot(xx, s(1,:));
subplot(212);
plot(xx, s(2,:));

end

