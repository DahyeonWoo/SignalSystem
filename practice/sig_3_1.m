close all;
clear all;
clc;

x = 0:0.01:4*pi;
w1 = [1:2:10]';
w2 = [1:2:100]';
w3 = [1:2:1000]';
y1 = FourierSeries(x, w1);
y2 = FourierSeries(x, w2);
y3 = FourierSeries(x, w3);

figure(1)
subplot(3,1,1)
plot(x, y1)
title('y1')
xlabel('x')

subplot(3,1,2)
plot(x, y2)
title('y2')
xlabel('x')

subplot(3,1,3)
plot(x, y3)
title('y3')
xlabel('x')

function y = FourierSeries(x, w)
    wt = 1./w;
    y = sum(wt.*sin(w.*x));
end