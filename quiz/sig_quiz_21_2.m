close all;                                % 모든 생성된 창을 닫음 
clear all;                                % 열려있는 작업영역(workspace)을 모두 비움 
clc;                                      % 명령(command) 창을 비움

fs=[5,20];                                % 샘플링 주파수 설정
ti=-2; tf=2; dt=0.001;                    % 시간 파라미터 설정
t=ti:dt:tf;                               % 시간축 설정
xt=cos(2*pi*t);                           % 원래의 연속 신호  생성
first_hold(fs(1),ti,tf,t,xt,[1 3])        % f_s=5일 때의 x[n] 및 x_r(t) 그림 
first_hold(fs(2),ti,tf,t,xt,[2 4]);       % f_s=20일 때의 x[n] 및 x_r(t) 그림 