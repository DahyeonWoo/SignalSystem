% R=1, C=1인 경우

close all;                                                     % 모든 생성된 창을 닫음 
clear all;                                                     % 열려있는 작업영역(workspace)을 모두 비움 
clc;                                                           % 명령(command) 창을 비움

dt=0.01; t=0:dt:10;                                            % 시간축 설정 
y1=3*(exp(4-1*t)-1).*(t>4)-3*(exp(1-1*t)-1).*(t>1);            % 라플라스 변환에 의한 출력 생성
% y = 3*heaviside(t - 4)*(exp(4 - t) - 1) - 3*heaviside(t - 1)*(exp(1 - t) - 1)
x=3*(t>1)-3*(t>4);                                             % 입력 신호 생성
h=1*exp(-1*t).*stepfun(t,0);                                   % 임펄스 응답 생성
y2=conv(x,h)*dt;                                               % 컨벌루션에 의한 출력 계산

subplot(2,1,1);                                                % 2행 1열 분할 그림 창의 1번 창  
plot(t,y1);                                                    % 라플라스 변환에 의한 출력 그림
axis([0 10 0 4]); xlabel('t');                                 % 그림 영역 설정 및 x축 라벨 지정
title('라플라스 변환에 의한 출력');                              % 그림 제목
subplot(2,1,2);                                                % 2행 1열 분할 그림 창의 2번 창
plot(t,y2(1:length(t)));                                       % 컨벌루션 계산에 의한 출력 그림
axis([0 10 0 4]); xlabel('t');                                 % 그림 영역 설정 및 x축 라벨 지정 
title('컨벌루션 계산에 의한 출력');                              % 그림 제목