% (a) y[n]-y[n-1]+0.25y[n-2]=0.25x[n-2]
% (b) y[n]-0.8y[n-1]-0.4y[n-2]=0.9x[n-2]

n=0:20; N=length(n); % 시간값 설정
dena=[1 -1 0.25]; numa=[0 0 0.25]; % 차분 방정식(a)의 출력항, 입력항 계수
denb=[1 -0.8 0.64]; numb=[0 0 0.84]; % 차분 방정식(b)의 출력항, 입력항 계수

ha=impz(numa,dena,N); % (a)의 임펄스 응답 h_a(t) 생성
sa=stepz(numa,dena,N); % (a)의 계단 응답 s_a(t) 생성
hb=impz(numb,denb,N); % (a)의 임펄스 응답 h_a(t) 생성
sb=stepz(numb,denb,N); % (a)의 계단 응답 s_a(t) 생성

figure(1);
subplot(2,2,1);
y1=stem(n,ha,'LineStyle','-.');
set(y1,'MarkerFaceColor','blue');
set(y1,'MarkerEdgeColor','cyan');
ylim([0 0.3]);
title('임펄스 응답');

subplot(2,2,2);
y2=stem(n,sa,'LineStyle','-.');
set(y2,'MarkerFaceColor','red');
set(y2,'MarkerEdgeColor','green');
title('계단 응답');

subplot(2,2,3);
stem(n,hb);
xlabel('n');
subplot(2,2,4);
stem(n,sb);
xlabel('n');
