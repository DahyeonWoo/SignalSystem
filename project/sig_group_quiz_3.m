%% 0. 파일 데이터 로드
close all;clear; clc; 

path = './data';   
filename = 'eventdata.txt';

data = load(filename);      % 'eventdata.txt' 파일을 읽어 data 행렬로 저장.
L = size(data,1);           % data의 사이즈를 얻는다.
SAMPLE_RATE = 32;

tic % 프로그램 동작 소요시간 측정 시작

%% 1. G단위 신호 스케일링(단위 정량화)

G_saturation = 400; % 가속도 센서 측정 범위 설정 값. 스케일 설정. 
N_resolution = 10; % ADC의 분해능 설정 값. 범위는 0~1023
G_divisor=2.^(N_resolution+1)/G_saturation; % 단위 중력 가속도 크기

% x,y,z 각 방향으로의 가속도 raw data 저장
raw_x = data(:,1);
raw_y = data(:,2);
raw_z = data(:,3);

% 가속도 raw 데이터 출력
figure(1); 
hold on;
plot(raw_x);
plot(raw_y);
plot(raw_z);
title('raw signal');      
legend('x','y','z');            % 범례 표시

% G단위로 신호를 스케일링
scale_x = raw_x./G_divisor;
scale_y = raw_y./G_divisor;
scale_z = raw_z./G_divisor;

% 스케일링 처리한 가속도 데이터 출력
figure(2); 
hold on;
plot(scale_x);
plot(scale_y);
plot(scale_z);
title('scaling, nomalized signal');
legend('x','y','z');                    

% 오버플로우의 방지를 위해 0~1 사이의 값으로 조정. 100으로 나눔.
decimal_x = scale_x./100;
decimal_y = scale_y./100;
decimal_z = scale_z./100;

% 오버플로우 방지 처리한 가속도 데이터 출력
figure(3); 
hold on;
plot(decimal_x);
plot(decimal_y);
plot(decimal_z);
title('scaling, nomalized decimal signal');
legend('x','y','z');

%% 2. 가속도 모멘텀 산출
% 가속도 모멘텀 데이터 얻은 뒤 0을 기준으로 normalization.
m = sqrt(decimal_x.^2 + decimal_y.^2 + decimal_z.^2); % 가속도 모멘텀
average = mean(m,'all'); % 가속도 모멘텀의 평균값
Momentum = m-average;  % 모멘텀에서 평균값을 뺀다. -> normaliztion

% normalization까지 완료된 가속도 모멘텀 출력
figure(4);
plot(Momentum);
legend('Momentum');

%% 3. 모멘텀 신호 전처리(노이즈 제거)

cf = 0.5;    % Cut-off frequencty = 0.5Hz
order = 5;   % 필터 차수

% 모멘텀 신호의 노이즈 제거 위해 FIR lowpass filter 적용
d = designfilt('lowpassfir', 'FilterOrder', order, 'CutoffFrequency', cf, 'Samplerate', SAMPLE_RATE);
momentum_filter = filter(d, Momentum);

% 필터링된 데이터 출력
figure(5);
plot(momentum_filter);
legend('FIR filter');

%% 4. 모멘텀 신호 양자화

quantization_level = 0.005; % 양자화 시 나누는 단계. Level factor는 데이터가 최소 5단계 이상으로 분리될 수 있게 해야 한다.
quantization_bias = 1; % BIAS factor는 데이터의 최소값이 0보다 크게 만든다. 양자화 시 [0.9, 0]의 값들을 0으로 만들어주기 위함.
quantized_momentum = floor((momentum_filter + quantization_bias) / quantization_level) * quantization_level; % 가우스 함수(floor) 이용, 모멘텀 양자화

% 양자화를 적용한 데이터 출력 : 모든 신호는 특정 level의 값만을 갖는다.
figure(6);
plot(quantized_momentum);
legend('Quantization')

%% 5. 피크/밸리(Peak/Valley) 검출

% peak값 혹은 valley값의 길이는 양자화된 데이터와 같게 하되 peak값 혹은 valley값이 아닐 경우에 점이 그래프 상에 찍혀서는 안된다.

% 양자화된 모멘텀 배열과 차원의 영배열 생성 -> peak와 valley 배열 정의
% 양자화 된 모멘텀 만큼의 길이로 초기화
peak = zeros(size(quantized_momentum)) - 1;
valley = zeros(size(quantized_momentum)) - 1;
state = 0;      % 상태 변수 선언 및 초기화

% 신호가 올라가는 상태일 경우 state=1, 신호가 내려가는 상태 일 경우 state = 0
for i=2:L
    if(quantized_momentum(i-1) > quantized_momentum(i) && state == 1)
        peak(i-1) = quantized_momentum(i-1);
        state = 0;
    elseif(quantized_momentum(i-1) <quantized_momentum(i) && state == 0)
        valley(i-1) = quantized_momentum(i-1);
        state = 1;
    end
end

% ylim을 이용하여 특정 범위의 그래프만 나오게 설정가능하다.
% peak값 혹은 valley값이 아닐 경우 ylim밖으로 설정하게 되면 처리가 가능하다.
figure(7); hold on;
scatter(1:L,peak,'filled');
scatter(1:L,valley,'filled');
legend('Peak','Valley');
ylim([0.9 1.04]);

%% 6. 걸음 수 검출

% 걸음 수 검출 알고리즘이란?
% 웨어러블 디바이스 환경에서 3축 가속도계 센서의 x, y, z축 가속도 신호를 통해 사용자의 걸음 수를 계산하는 알고리즘

THRESHOLD_ACTIVE = 1;               % 걸음이라고 판단되는 피크값의 최소값
THRESHOLD_SWING = 0.02;             % 현재 피크, 이전 밸리의 최소 차이값
THRESHOLD_INTERVAL_LONG_TIME = 2;   % 현재 피크와 이전 피크 최대 시간차   
THRESHOLD_INTERVAL_SHORT_TIME = 0.25; % 현재 피크와 이전 피크 최소 시간차
THRESHOLD_INTERVAL_LONG_SAMPLE = floor(SAMPLE_RATE * THRESHOLD_INTERVAL_LONG_TIME);    % LONG TIME * SAMPLE RATE의 반올림 정수값
THRESHOLD_INTERVAL_SHORT_SAMPLE = floor(SAMPLE_RATE * THRESHOLD_INTERVAL_SHORT_TIME);  % SHORT TIME * SAMPLE RATE의 반올림 정수값

step_signal = zeros(size(quantized_momentum));  % 임펄스 형태 걷기 신호 정의 및 초기화

% 현재 피크, 이전 피크 변수 정의 
for i=1:L
    if(peak(i) ~= -1)               % i 시점에서 peak 값이 -1이 아니라면 반복
        pre_peak_value = peak(i);   % 시간 흐름에 따라 현재(i시점)의 peak 값은 이전(i-1시점)의 피크 값이 된다. 
        pre_peak_position = i;      % 시점 이동
        break;
    end
end
% 현재 밸리, 이전 밸리 변수 정의 
for i=1:L
    if(valley(i) ~= -1)                 % i 시점에서 valley 값이 -1이 아니라면 반복
        pre_valley_value = valley(i);   % 시간 흐름에 따라 현재(i시점)의 valley 값은 이전(i-1시점)의 피크 값이 된다. 
        pre_valley_position = i;        % 시점 이동
        break;
    end
end
% peak/valley 데이터 얻기 위해 시작점 인덱스 설정
if(pre_peak_position < pre_valley_position)
    start_idx = pre_valley_position + 1;     % 시작지점을 valley지점 +1로 잡아줌
else
    start_idx = pre_peak_position + 1;       % 시작지점을 peak지점 +1로 잡아줌
end

% 양자화된 모멘텀 데이터로부터 걸음 발생 정의. 걸음 발생의 조건은 아래와 같다.
% 1. 이전 peak와 현재 peak 모두 ACTIVE 문턱값을 넘어야 한다.
% 2. 현재 peak와 이전 valley의 차이는 SWING 문턱값을 넘어야 한다.
% 3. peak와 peak 사이 시구간이 LONG_SAMPLE보다 작고, SHORT_SAMPLE보다는 커야 한다.
for i=start_idx:L 
    if(peak(i) ~= -1)
        now_peak_value = peak(i);   % 현재 peak의 값과 위치를 변수에 저장
        now_peak_position = i; 
        interval_time = now_peak_position - pre_peak_position;   % peak to peak 시구간 정의.
        % 조건 1
        if((pre_peak_value>=THRESHOLD_ACTIVE && now_peak_value>THRESHOLD_ACTIVE) || (pre_peak_value>THRESHOLD_ACTIVE && now_peak_value>=THRESHOLD_ACTIVE)) 
            % 조건 2
            if((now_peak_value-pre_valley_value) > THRESHOLD_SWING) 
                % 조건 3
                if((THRESHOLD_INTERVAL_LONG_SAMPLE > interval_time) && (interval_time > THRESHOLD_INTERVAL_SHORT_SAMPLE))
                    step_signal(i) = 1;     % 모든 조건 만족 시 해당 시점 i에서 걸음 발생(step_signal =1), 만족 못할 시 걸음 발생하지 않음
                end
            end
        end
        pre_peak_value = now_peak_value;        % 현재 peak 값과 위치를 이전 peak의 값과 위치로 한다. 
        pre_peak_position = now_peak_position;
    end
    if(valley(i) ~= -1)
        pre_valley_value = valley(i);           % 현재 valley 값과 위치를 이전 valley의 값과 위치로 한다. 
        pre_valley_position = i;                % 현재 peak/valley는 다음 반복에서 이전 peak/valley이기 때문.
    end
end

% 임펄스 함수 형식으로 기록된 걸음 발생 점을 출력.
figure(8); 
hold on;
stem(1:1424, step_signal);
legend('Step');
ylim([0.0 1.0]);

% 양자화된 모멘텀(선)과 걸음이 발생한 경우의 피크값(점)을 출력.
% 모든 피크값 중 걸음이 발생했다고 판단되는(sifting된) 피크값만 점으로 출력된다.
figure(9); 
hold on;
plot(quantized_momentum);   % figure 6에 출력되는 양자화된 모멘텀
scatter(1:L,(step_signal .* quantized_momentum),'filled'); % step_signal 임펄스 함수로 모멘텀 신호 sifting
ylim([0.94 1.04]);

%% 7.인식률 산출

Nr=71;                                  % 실제 측정 횟수 : 71회
Na=sum(double(step_signal == 1));       % 알고리즘 추정횟수 : 67회, 발걸음수는 step_signal 발생점을 모두 더하는 것으로 알 수 있음.
R=((Nr-abs(Nr-Na))/Nr)*100;             % 알고리즘 인식률 : R= 94.3662%

toc % 프로그램 동작 소요시간 측정 끝
fprintf('인식률 : %.1f', R);             
disp('%');