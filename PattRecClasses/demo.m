x = -10:0.1:10;
y = 0.75 * gaussmf(x,[1 0]);
plot(x,y)
hold on
y = 0.25 * gaussmf(x,[2 0]);
plot(x,y)
title('Gaussian Distribution of Outputs')
xlabel('Xt')
ylabel('P[Xt]')
grid