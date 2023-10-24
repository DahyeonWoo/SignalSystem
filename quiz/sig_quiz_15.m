
subplot(3,1,1);
N=10; % 고조파의 차수를 선택함
t=-3:0.01:3; % 파형 그림 시간축 설정
c0=0.5; % 직류 성분의 푸리에 계수
w0=pi; % 기본 주파수 설정
xr=c0*ones(1,length(t)); % 합성 신호 x_r(t)의 직류 성분
for k=1:N
    xr=xr+sinc(k/2)*cos(k*w0*t); % N차까지 고조파들을 더해 합성 신호 x_r(t) 생성
end
plot(t,xr,'r'); % 합성 신호 x_r(t)의 파형을 그림
title('합성 신호 x_r(t) (N=10)'); % 그림 제목
xlabel('t'); % x축 라벨 표시

subplot(3,1,2);
N=20; % 고조파의 차수를 선택함
t=-3:0.01:3; % 파형 그림 시간축 설정
c0=0.5; % 직류 성분의 푸리에 계수
w0=pi; % 기본 주파수 설정
xr=c0*ones(1,length(t)); % 합성 신호 x_r(t)의 직류 성분
for k=1:N
    xr=xr+sinc(k/2)*cos(k*w0*t); % N차까지 고조파들을 더해 합성 신호 x_r(t) 생성
end
plot(t,xr,'g'); % 합성 신호 x_r(t)의 파형을 그림
title('합성 신호 x_r(t) (N=20)'); % 그림 제목
xlabel('t'); % x축 라벨 표시

subplot(3,1,3);
N=40; % 고조파의 차수를 선택함
t=-3:0.01:3; % 파형 그림 시간축 설정
c0=0.5; % 직류 성분의 푸리에 계수
w0=pi; % 기본 주파수 설정
xr=c0*ones(1,length(t)); % 합성 신호 x_r(t)의 직류 성분
for k=1:N
    xr=xr+sinc(k/2)*cos(k*w0*t); % N차까지 고조파들을 더해 합성 신호 x_r(t) 생성
end
plot(t,xr,'b'); % 합성 신호 x_r(t)의 파형을 그림
title('합성 신호 x_r(t) (N=40)'); % 그림 제목
xlabel('t'); % x축 라벨 표시