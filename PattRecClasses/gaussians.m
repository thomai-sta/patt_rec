x = -10:0.1:10;
% y = 0.75 * gaussmf(x,[1 0]);
y = 0.75 * normpdf(x, 0, 1);
plot(x, y)
hold on
y = 0.25 * normpdf(x, 0, 2);
plot(x, y)
title('Gaussian Distribution of Outputs', 'FontSize', 20)
xlabel('Xt', 'FontSize', 20)
ylabel('P[Xt]', 'FontSize', 20)
grid