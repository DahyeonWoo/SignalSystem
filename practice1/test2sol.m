close all;  clear all;  clc; 

x=-pi:0.05:pi;
a=cos(x);
b=sin(x);

figure(1);
subplot(2,1,1);
plot(x,a);
grid on; % 격자 생성
title('제목');
xlabel('x축');
ylabel('y축');

subplot(2,1,2);
plot(x,b); 
grid on; % 격자 생성
title('제목');
xlabel('x축');
ylabel('y축');

figure(2);
plot(a,b)
grid on; % 격자 생성
hold on; % 전의 그래프 삭제 x
plot(a,b); 
title('')
axis([-2, 2, -2, 2]);

figure(3);
hold on; % 미리 유지가 되게 한다.
plot(x,b); 
plot(x,a); 
grid on; % 격자 생성
xlabel('x축');
ylabel('y축');
legend('cos(x)','sin(x)');
hold off; 