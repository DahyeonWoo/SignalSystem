close all;                                   % ��� ������ â�� ���� 
clear all;                                   % �����ִ� �۾�����(workspace)�� ��� ��� 
clc;                                         % ���(command) â�� ���

n=-5:10;                                    % �ð��� ����
w=-pi:1/200:pi;                              % ���ļ��� ���� 
x=sin(pi*n/2);                               % ��ȣ x[n] ����
y=sin(pi*n/2).*exp(j*pi*n/4);               % ��ȣ y[n] ����
Xf=x*(exp(-j*n'*w));                         % x[n]�� DTFT X(OMEGA) ��� 
Yf=y*(exp(-j*n'*w));                         % y[n]�� DTFT X(OMEGA) ��� 

subplot(2,2,1);                              % 2�� 2�� ���� �׸�â�� 1�� â
plot(w/(2*pi),abs(Xf));                      % x[n]�� ���� ����Ʈ���� �׸�
title('x[n]�� ���� ����Ʈ��');                % �׸� ����
xlabel('F');                                 % x�� �� ǥ�� 
subplot(2,2,2);                              % 2�� 2�� ���� �׸�â�� 2�� â
plot(w/(2*pi),angle(Xf));                    % x[n]�� ���� ����Ʈ���� ���� 
title('x[n]�� ���� ����Ʈ��');                % �׸� ����
xlabel('F');                                 % x�� �� ǥ�� 
subplot(2,2,3);                              % 2�� 2�� ���� �׸�â�� 3�� â
plot(w/(2*pi),abs(Yf));                      % y[n]�� ���� ����Ʈ���� �׸�
title('y[n]�� ���� ����Ʈ��');                % �׸� ����
xlabel('F');                                 % x�� �� ǥ�� 
subplot(2,2,4);                              % 2�� 2�� ���� �׸�â�� 4�� â
plot(w/(2*pi),angle(Yf));                    % y[n]�� ���� ����Ʈ���� ���� 
title('y[n]�� ���� ����Ʈ��');                % �׸� ����
xlabel('F');                                 % x�� �� ǥ�� 