close all;                                   % 모든 생성된 창을 닫음 
clear all;                                   % 열려있는 작업영역(workspace)을 모두 비움 
clc;                                         % 명령(command) 창을 비움

x=[1 1 2 1 0 -1 -2 -1];                      % 신호 x[n]
h=[1 1 2 3 2 3 2 1];                         % 신호 h[n]
Nx=length(x); Nh=length(h);                  % 신호의 길이
N=Nx+Nh-1;                                   % 컨벌루션 결과 신호의 길이
xa=[x zeros(1,N-Nx)];                        % 신호 x[n]에 영 채우기
ha=[h zeros(1,N-Nh)];                        % 신호 h[n]에 영 채우기
yl=conv(x,h);                                % 직접 선형 컨벌루션 계산
yc=ifft(fft(xa).*fft(ha));                   % 원형 컨벌루션으로 선형 컨벌루션 계산

n=0:N-1;                                     % 시간축 설정 
subplot(2,1,1);                              % 2행 1열 배열 그림창의 1번 창
stem(n,yl);                                  % 직접 원형 컨벌루션 결과 그림  
title('직접 컨벌루션 결과');                  % 그림 제목
xlabel('n'); grid on;                        % x축 라벨 및 그리드 표시 
subplot(2,1,2);                              % 2행 1열 배열 그림창의 2번 창
stem(n,yc);                                  % 원형 컨벌루션을 이용한 계산 결과 그림
title('원형 컨벌루션 이용 결과');             % 그림 제목
xlabel('n'); grid on;                        % x축 라벨 및 그리드 표시  