clc; clear all; close all;

n = -5:48;
g0 = g(n); g1 = g(2*n); g2 = g(n/3);
subplot(3,1,1); stem(n,g0,'k','filled'); ylabel('g[n]');
subplot(3,1,2); stem(n,g1,'k','filled'); ylabel('g[2n]');
subplot(3,1,3); stem(n,g2,'k','filled'); ylabel('g[n/3]');

function y = usD(n)
    y = double(n>-0);
    I = find(round(n) ~= n);
    y(I) = NaN;
end

function y = g(n)
    y = 10*(0.8).^n.*sin(3*pi*n/16).*usD(n);
    I = find(round(n) ~= n);
    y(I) = NaN;
end