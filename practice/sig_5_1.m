clear all
close all
clc

x = 0:0.2:3;
y = exp(x);

hold on
plot(x, y);
stem(x, y, 'LineWidth', 1);
title('y = exp(x)')
xlabel('x')
ylabel('y')
hold off