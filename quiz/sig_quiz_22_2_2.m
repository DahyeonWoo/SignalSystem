close all;                                   % 모든 생성된 창을 닫음 
clear all;                                   % 열려있는 작업영역(workspace)을 모두 비움 
clc;                                         % 명령(command) 창을 비움

n=-5:10;                                    % 시간축 설정
w=-pi:1/200:pi;                              % 주파수축 설정 
x=sin(pi*n/2);                               % 신호 x[n] 생성
y=sin(pi*n/2).*exp(j*pi*n/4);               % 신호 y[n] 생성
Xf=x*(exp(-j*n'*w));                         % x[n]의 DTFT X(OMEGA) 계산 
Yf=y*(exp(-j*n'*w));                         % y[n]의 DTFT X(OMEGA) 계산 

subplot(2,2,1);                              % 2행 2열 분할 그림창의 1번 창
plot(w/(2*pi),abs(Xf));                      % x[n]의 진폭 스펙트럼을 그림
title('x[n]의 진폭 스펙트럼');                % 그림 제목
xlabel('F');                                 % x축 라벨 표시 
subplot(2,2,2);                              % 2행 2열 분할 그림창의 2번 창
plot(w/(2*pi),angle(Xf));                    % x[n]의 위상 스펙트럼을 그힘 
title('x[n]의 위상 스펙트럼');                % 그림 제목
xlabel('F');                                 % x축 라벨 표시 
subplot(2,2,3);                              % 2행 2열 분할 그림창의 3번 창
plot(w/(2*pi),abs(Yf));                      % y[n]의 진폭 스펙트럼을 그림
title('y[n]의 진폭 스펙트럼');                % 그림 제목
xlabel('F');                                 % x축 라벨 표시 
subplot(2,2,4);                              % 2행 2열 분할 그림창의 4번 창
plot(w/(2*pi),angle(Yf));                    % y[n]의 위상 스펙트럼을 그힘 
title('y[n]의 위상 스펙트럼');                % 그림 제목
xlabel('F');                                 % x축 라벨 표시 