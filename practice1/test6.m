close all;  clear all;  clc; 

x=0:3:0.2

subplot(1,1,1);
f(x);
subplot(1,1,2);
f(x);

function y=f(x)
    y=exp(x)
end