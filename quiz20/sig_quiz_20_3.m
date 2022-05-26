clc; clear all; close all;

figure(1);
w=0:100:20e4;
H=freqs(1e9,[1 4e4 1e9],w);
subplot(2,1,1);
plot((w/(2*pi))/1e3, abs(H));
subplot(2,1,2);
plot((w/(2*pi))/1e3, angle(H));

% bod plots
% log scailing
figure(2);
f=logspace(-1,5,2000);
w=2*pi*f;
H=freqs(1e9,[1 4e4 1e9],w);
subplot(2,1,1);
plot((w/(2*pi))/1e3, abs(H));
semilogx(f,20*log(abs(H))); % x축만 log
subplot(2,1,2);
semilogx(f,angle(H));

