close all;                                      % 모든 생성된 창을 닫음 
clear all;                                      % 열려있는 작업영역(workspace)을 모두 비움 
clc;                                            % 명령(command) 창을 비움

N=18;                                           % 한 주기의 신호의 샘플 개수
x=[0 1 2 1 2 3 2 1 0 -1 -1 -1 0 -1 0 1 2 1];    % x[n] 생성
w0=2*pi/N;                                      % 기본 주파수 설정
n=-N/2+1:N/2;                                   % 시간 구간 설정
WN=exp(-j*w0*n);                                % 복소 정현파 e^(j*k*OMEGA_0*n) 생성
for m=1:N                                          
   Xk(m)=sum(x.*WN.^(m-1))/N;                   % 푸리에 계수 X_k 계산
end
k=0:N-1;                                        % 주파수축(고조파 차수) 생성 
Xk                                              % 푸리에 계수 X_k 계산 결과 포시  

subplot(2,1,1);                                 % 2행 1열 분할 그림 창의 1번 창  
stem(k,abs(Xk))                                 % 진폭 스펙트럼을 그림
title('진폭 스펙트럼');                          % 그림 제목
xlabel('k'); grid on;                           % x축 라벨 및 그리드 표시
subplot(2,1,2);                                 % 2행 1열 분할 그림 창의 2번 창  
 stem(k,angle(Xk))                              % 위상 스펙트럼을 그림
title('위상 스펙트럼');                          % 그림 제목
xlabel('k'); grid on;                           % x축 라벨 및 그리드 표시