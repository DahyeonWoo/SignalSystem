close all;                                    % 모든 생성된 창을 닫음 
clear all;                                    % 열려있는 작업영역(workspace)을 모두 비움 
clc;                                          % 명령(command) 창을 비움

n=-20:19;                                     % 범위 설정
x=x1D(n).*x2D(n);                             % 식 실행
stem(n,x);                                    % 그림
xlabel('n');                                  % xlabel
ylabel('x[n]');                               % ylabel

function y=x1D(n)
    y=5*cos(2*pi*n/8);
    I=round(n)~=n;
    y(I)=NaN;
end

function y=x2D(n)
    y=-8*exp(-(n/6).^2);
    I=round(n)~=n;
    y(I)=NaN;
end