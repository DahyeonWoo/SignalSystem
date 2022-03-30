close all;  clear all;  clc; 

xi=-pi;xf=pi;xt=0.05;
x=xi:xt:xf;

figure(1);
a=cos(x);
subplot(2,1,1);
plot(x,a); 
b=sin(x);
subplot(2,1,2);
plot(x,b); 

figure(2);
plot(a,b); 

