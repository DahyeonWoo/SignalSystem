close all;  clear all;  clc; 

x=-pi:0.05:pi;
a=cos(x);
b=sin(x);

figure(1);
grid on; % 격자 생성
hold on; % 전의 그래프 삭제 x
subplot(2,1,1);
plot(x,a);
title('제목');
xlabel('x축');
ylabel('y축');

subplot(2,1,2);
grid on; % 격자 생성
hold on; % 전의 그래프 삭제 x
plot(x,b); 
title('제목');
xlabel('x축');
ylabel('y축');

figure(2);
grid on; % 격자 생성
hold on; % 전의 그래프 삭제 x
plot(a,b); 

figure(3);
plot(x,b); 
plot(x,a); 
grid on; % 격자 생성
hold on; % 전의 그래프 삭제 x