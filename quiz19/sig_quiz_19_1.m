close all;                                        % 모든 생성된 창을 닫음 
clear all;                                        % 열려있는 작업영역(workspace)을 모두 비움 
clc;                                              % 명령(command) 창을 비움

R=1; C=0.1;                                         % 회로 정수 값 설정
syms s t                                          % 변수를 기호로 지정
x=3*heaviside(t-1)-3*heaviside(t-4);              % x(t) 생성
X=laplace(x);                                     % x(t)의 라플라스 변환 X(s) 구함
H=1/(R*C*(s+1/(R*C)));                            % RC회로 전달 함수 구함
Y=X*H;                                            % 출력의 라플라스 변환 Y(s) 계산
y=ilaplace(Y)                                     % Y(s)의 역 라플라스 변환 수행