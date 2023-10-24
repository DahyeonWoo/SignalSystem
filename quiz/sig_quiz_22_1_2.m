close all;                                      % 모든 생성된 창을 닫음 
clear all;                                      % 열려있는 작업영역(workspace)을 모두 비움 
clc;                                            % 명령(command) 창을 비움

N=1024;                                         % 한 주기의 신호의 샘플 개수
df=1/N;                                         % 주파수 해상도 설정
f=df*[-N/2+1:N/2];                              % 주파수축 생성
x=[0 1 2 1 2 3 2 1 0 -1 -1 -1 0 -1 0 1 2 1];    % x[n] 생성
xa=zeros(1,N);                                  % 데이터 집합에 0 첨가
xa(1:10)=x(9:18); xa(N-7:N)=x(1:8);             % 데이터 재정렬
Xf=fft(xa); Xfr=fftshift(Xf);                   % fft 실행 및 재정렬

figure(1)                                       % 그림창 1 지정
subplot(2,1,1);                                 % 2행 1열 분할 그림 창의 1번 창  
plot(f,abs(Xfr));                               % 진폭 스펙트럼 그림
title('\bf{진폭 스펙트럼}');                     % 그림 제목
xlabel('\bf{\Omega}'); grid on;                 % x축 라벨 및 그리드 표시
subplot(2,1,2);                                 % 2행 1열 분할 그림 창의 2번 창  
plot(f,angle(Xfr))                              % 위상 스펙트럼 그림
title('\bf{위상 스펙트럼}');                     % 그림 제목
xlabel('\bf{\Omega}'); grid on;                 % x축 라벨 및 그리드 표시

yn=ifft(Xf);                                    % 역 변환 수행
y=[yn(N-9:N) yn(1:11)];                         % 데이터 재정렬 
n=-10:10;                                       % 시간축 생성

figure(2)                                       % 그림 창 2 지정
stem(n,y);                                      % 비주기 신호 y[n] 을 그림
title('비주기 신호 y[n]');                       % 그림 제목
xlabel('n'); grid on;                           % x축 라벨 및 그리드 표시 