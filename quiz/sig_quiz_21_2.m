close all;                                % ��� ������ â�� ���� 
clear all;                                % �����ִ� �۾�����(workspace)�� ��� ��� 
clc;                                      % ���(command) â�� ���

fs=[5,20];                                % ���ø� ���ļ� ����
ti=-2; tf=2; dt=0.001;                    % �ð� �Ķ���� ����
t=ti:dt:tf;                               % �ð��� ����
xt=cos(2*pi*t);                           % ������ ���� ��ȣ  ����
first_hold(fs(1),ti,tf,t,xt,[1 3])        % f_s=5�� ���� x[n] �� x_r(t) �׸� 
first_hold(fs(2),ti,tf,t,xt,[2 4]);       % f_s=20�� ���� x[n] �� x_r(t) �׸� 