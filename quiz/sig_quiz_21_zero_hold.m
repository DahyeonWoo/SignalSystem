function zero_hold(fs, ti, tf, t, xt, w)     % 영차 홀드를 이용한 샘플링된 신호의 복원 

n=ti:1/fs:tf;                                % 샘플링 주파수에 따른 샘플 개수 설정
xn=cos(2*pi*n);                              % 샘플링된 신호 x[n] 계산

subplot(2,2,w(1));                           % 2행 2열 분할 그림창의 w(1)번 창 지정
plot(t,xt,'k:')                              % 원래의 연속 신호 x(t) 그림
axis([ti tf -1.5 1.5])                       % x축과 y축의 그림 영역 설정
hold on                                      % 현재 창 유지해 연속해서 그림
stem(n,xn)                                   % 샘플링된 이산 신호 x[n] 그림
title('샘플링된 이산 신호');                  % 그림 제목 
xlabel('t');                                 % x축 라벨 표시 
subplot(2,2,w(2));                           % 2행 2열 분할 그림 창의 w(2)번 창 지정
plot(t,xt,'k:')                              % 원래의 연속 신호 x(t) 그림
axis([ti tf -1.5 1.5])                       % x축과 y축의 그림 영역 설정
hold on                                      % 현재 창 유지해 연속해서 그림
stairs(n,xn)                                 % 영차 홀드에 의한 복원 신호 x_r(t) 그림
title('영차 홀드에 의한 복원 신호');           % 그림 제목
xlabel('t');                                 % x축 라벨 표시

end

