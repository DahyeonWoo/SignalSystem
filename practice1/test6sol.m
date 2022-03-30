close all;  clear all;  clc; 

x=0:0.2:3;
y=exp(x);

hold on;
plot(x,y); %연속
stem(x,y,'LineWidth',1); %이산 %LineWidth로 선굵기를 조절
title('y=exp(x)');
xlabel('x');
xlabel('y');
hold off;