close all;                                   % 모든 생성된 창을 닫음 
clear all;                                   % 열려있는 작업영역(workspace)을 모두 비움 
clc;                                         % 명령(command) 창을 비움

x=[1 1 2 1 0 -1 -2 -1];                      % 신호 x[n]
h=[1 1 2 3 2 3 2 1];                         % 신호 h[n]
N=length(x);                                 % 신호의 길이(주기)  
yl=[conv(x,h) 0];                            % 선형 컨벌루션 계산
yc=yl(1:N)+yl(N+1:2*N);                      % 시간 영역 원형 컨벌루션 계산
yp=ifft(fft(x).*fft(h));                     % DFT를 이용한 원형 컨벌루션 계산 

n=0:N-1;                                     % 시간축 설정 
subplot(2,2,1);                              % 2행 2열 배열 그림창의 1번 창
stem(n,x);                                   % 신호 x[n]을 그림  
title('신호 x[n]');                          % 그림 제목
xlabel('n'); grid on;                        % x축 라벨 및 그리드 표시 
subplot(2,2,2);                              % 2행 2열 배열 그림창의 2번 창
stem(n,h);                                   % 신호 h[n]을 그림 
title('신호 h[n]');                          % 그림 제목
xlabel('n'); grid on;                        % x축 라벨 및 그리드 표시
subplot(2,2,3);                              % 2행 2열 배열 그림창의 3번 창
stem(n,yc);                                  % 직접 원형 컨벌루션 결과 그림  
title('시간 영역 원형 컨벌루션');              % 그림 제목
xlabel('n'); grid on;                        % x축 라벨 및 그리드 표시 
subplot(2,2,4);                              % 2행 2열 배열 그림창의 4번 창
stem(n,yp);                                  % DFT에 의한 원형 컨벌루션 결과 그림
title('주파수 영역 원형 컨벌루션');            % 그림 제목
xlabel('n'); grid on;                        % x축 라벨 및 그리드 표시  