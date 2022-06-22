close all;                                   % 모든 생성된 창을 닫음 
clear all;                                   % 열려있는 작업영역(workspace)을 모두 비움 
clc;                                         % 명령(command) 창을 비움

n=-5:10;                                     % 시간축 설정
w=-pi:1/200:pi;                              % 주파수축 설정 
x=sin(pi*n/2);                               % 신호 x[n] 생성
Xf=x*(exp(-j*n'*w));                         % x[n]의 DTFT 계산 

nr=-fliplr(n);                               % 시간축 반전
m=min([n,nr]):max([n,nr]);                   % 신호 반전을 위한 시간축 m 설정
xx=zeros(1,length(m));                       % m축에서의 x[m] 초기화 
xx(n(1)-m(1)+1:n(1)-m(1)+length(n))=x;       % m축 상에 x[m]을 나타냄 
xe=0.5*(xx+fliplr(xx));                      % 우함수 성분 x_e[m] 계산
xo=0.5*(xx-fliplr(xx));                      % 기함수 성분 x_o[n] 계산
Xef=xe*(exp(-j*m'*w));                       % x_e[m]의 DTFT 계산 
Xof=xo*(exp(-j*m'*w));                       % x_o[n]의 DTFT 계산 

subplot(2,2,1);                              % 2행 2열 분할 그림창의 1번 창
plot(w/(2*pi),real(Xf));                    % X(OMEGA)의 실수부를 그림
title('스펙트럼의 실수부');                   % 그림 제목
xlabel('F');                                 % x축 라벨 표시 
subplot(2,2,3);                              % 2행 2열 분할 그림창의 3번 창
plot(w/(2*pi),imag(Xf));                    % X(OMEGA)의 허수부를 그힘 
title('스펙트럼의 허수부');                   % 그림 제목
xlabel('F');                             % x축 라벨 표시
subplot(2,2,2);                              % 2행 2열 분할 그림창의 2번 창
plot(w/(2*pi),real(Xef));                    % X_e(OMEGA)를 그림
title('우함수 성분의 스펙트럼');              % 그림 제목
xlabel('F');                                 % x축 라벨 표시 
subplot(2,2,4);                              % 2행 2열 분할 그림창의 4번 창
plot(w/(2*pi),imag(Xof));                    % X_o(OMEGA)를 그림 
title('기함수 성분의 스펙트럼');              % 그림 제목
xlabel('F');                             % x축 라벨 표시