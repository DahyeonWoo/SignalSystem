clear all
close all
clc

x=-pi:0.05:pi;
a=cos(x);
b=sin(x);

figure(1)
subplot(2,1,1);
plot(x,a);
grid on; % 격자 생성
xlabel('x');
ylabel('a');
title('a=cos(x)');

subplot(2,1,2);
plot(x,b);
grid on;
xlabel('x');
ylabel('b');
title('b=sin(x)');

figure(2)
plot(a,b);
grid on;
xlabel('a');
ylabel('b');
title('graph of circle');
axis([-2, 2, -2, 2]);

figure(3)
hold on; % 전의 그래프 삭제 x
plot(x, a);
plot(x, b);
grid on;
xlabel('x');
ylabel('y');
legend('cos(x)', 'sin(x)');
hold off;