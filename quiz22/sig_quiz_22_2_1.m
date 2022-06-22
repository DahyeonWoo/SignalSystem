close all;                                   % ��� ������ â�� ���� 
clear all;                                   % �����ִ� �۾�����(workspace)�� ��� ��� 
clc;                                         % ���(command) â�� ���

n=-5:10;                                     % �ð��� ����
w=-pi:1/200:pi;                              % ���ļ��� ���� 
x=sin(pi*n/2);                               % ��ȣ x[n] ����
Xf=x*(exp(-j*n'*w));                         % x[n]�� DTFT ��� 

nr=-fliplr(n);                               % �ð��� ����
m=min([n,nr]):max([n,nr]);                   % ��ȣ ������ ���� �ð��� m ����
xx=zeros(1,length(m));                       % m�࿡���� x[m] �ʱ�ȭ 
xx(n(1)-m(1)+1:n(1)-m(1)+length(n))=x;       % m�� �� x[m]�� ��Ÿ�� 
xe=0.5*(xx+fliplr(xx));                      % ���Լ� ���� x_e[m] ���
xo=0.5*(xx-fliplr(xx));                      % ���Լ� ���� x_o[n] ���
Xef=xe*(exp(-j*m'*w));                       % x_e[m]�� DTFT ��� 
Xof=xo*(exp(-j*m'*w));                       % x_o[n]�� DTFT ��� 

subplot(2,2,1);                              % 2�� 2�� ���� �׸�â�� 1�� â
plot(w/(2*pi),real(Xf));                    % X(OMEGA)�� �Ǽ��θ� �׸�
title('����Ʈ���� �Ǽ���');                   % �׸� ����
xlabel('F');                                 % x�� �� ǥ�� 
subplot(2,2,3);                              % 2�� 2�� ���� �׸�â�� 3�� â
plot(w/(2*pi),imag(Xf));                    % X(OMEGA)�� ����θ� ���� 
title('����Ʈ���� �����');                   % �׸� ����
xlabel('F');                             % x�� �� ǥ��
subplot(2,2,2);                              % 2�� 2�� ���� �׸�â�� 2�� â
plot(w/(2*pi),real(Xef));                    % X_e(OMEGA)�� �׸�
title('���Լ� ������ ����Ʈ��');              % �׸� ����
xlabel('F');                                 % x�� �� ǥ�� 
subplot(2,2,4);                              % 2�� 2�� ���� �׸�â�� 4�� â
plot(w/(2*pi),imag(Xof));                    % X_o(OMEGA)�� �׸� 
title('���Լ� ������ ����Ʈ��');              % �׸� ����
xlabel('F');                             % x�� �� ǥ��