N=512;                                               % 데이터 개수 설정(2N0)
ti=-8; tf=8; dt=(tf-ti)/N; t=ti:dt:tf-dt;            % 시간축 설정    
df=1/(N*dt);                                         % 주파수 해상도 설정 
f=df*[-N/2:N/2-1];                                   % 주파수축 설정
R=1; C=1;                                          % 회로 소자 값 지정
% R=1; C=0.1;                                        % 회로 소자 값 지정

x=stepfun(t,-1)-stepfun(t,1);                        % 사각 펄스 신호 생성
xa=[x(-ti/dt+1:length(t)) x(1:-ti/dt)];              % 입력 신호 재정렬
Xf=fftshift(fft(xa)*dt);                             % 입력 신호의 푸리에 변환 수행
Hf=1./(R*C*(j*2*pi*f+1/(R*C)));                      % 회로 주파수 응답 계산
Yf=Xf.*Hf;                                           % 출력 스펙트럼 계산
wd=64;                                               % 스펙트럼 그릴 구간 폭 설정
ff=f(N/2+1-wd:N/2+1+wd);                             % 스펙트럼 그릴 주파수축 설정  
Xft=Xf(N/2+1-wd:N/2+1+wd);                           % 주파수 축에 맞게 입력 스펙트럼 자름
Hft=Hf(N/2+1-wd:N/2+1+wd);                           % 주파수 축에 맞게 회로 주파수 응답 자름
Yft=Yf(N/2+1-wd:N/2+1+wd);                           % 주파수 축에 맞게 출력 스펙트럼 자름

y=ifft(fftshift(Yf))/dt;                             % 역 푸리에 변환에 의한 출력 계산
y=[y(-ti/dt+1:length(t)) y(1:-ti/dt)];               % 출력 신호 재정렬
tt=t((-2-ti)/dt+1:(6-ti)/dt);                        % 출력 파형 시간축 생성
yt=y((-2-ti)/dt+1:(6-ti)/dt);                        % 시간축에 맞게 출력 자름 

figure(1)                                            % 그림창 1 열기
subplot(2,1,1);                                      % 2행 1열 분할 그림창의 1번 창
plot(ff,abs(Xft));                                   % 입력의 진폭 스펙트럼을 그림
title('진폭 스펙트럼');                                 % 그림 제목
xlabel('f'); grid on;                                % x축 라벨 및 그리드 표시  
subplot(2,1,2);                                      % 2행 1열 분할 그림창의 2번 창
plot(ff,angle(Xft));                                 % 입력의 위상 스펙트럼을 그림 
title('위상 스펙트럼');                                 % 그림 제목
xlabel('f'); grid on;                                % x축 라벨 및 그리드 표시

figure(2)                                            % 그림창 2 열기  
subplot(2,1,1);                                      % 2행 1열 분할 그림창의 1번 창
plot(ff,abs(Hft));                                   % 진폭 주파수 응답 곡선 그림
title('진폭 응답');                                    % 그림 제목
xlabel('f'); grid on;                                % x축 라벨 및 그리드 표시  
subplot(2,1,2);                                      % 2행 1열 분할 그림창의 2번 창
plot(ff,angle(Hft));                                 % 위상 주파수 응답 곡선 그림 
title('위상 응답');                                    % 그림 제목
xlabel('f'); grid on;                                % x축 라벨 및 그리드 표시

figure(3)                                            % 그림창 3 열기
subplot(2,1,1);                                      % 2행 1열 분할 그림창의 1번 창
plot(ff,abs(Yft));                                   % 출력의 진폭 스펙트럼을 그림
title('진폭 스펙트럼');                                 % 그림 제목
xlabel('f'); grid on;                                % x축 라벨 및 그리드 표시  
subplot(2,1,2);                                      % 2행 1열 분할 그림창의 3번 창
plot(ff,angle(Yft));                                 % 출력의 위상 스펙트럼을 그림 
title('위상 스펙트럼');                                 % 그림 제목
xlabel('f'); grid on;                                % x축 라벨 및 그리드 표시

figure(4)                                            % 그림창 4 열기
plot(tt,yt);                                         % 출력 파형 그림