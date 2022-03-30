close all;  clear all;  clc; 

x=-pi:0.05:pi;
a=cos(x);
b=sin(x);

figure(1);
subplot(2,1,1);
plot(x,a); 
subplot(2,1,2);
plot(x,b); 

figure(2);
plot(a,b); 
