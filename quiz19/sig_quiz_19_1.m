close all;                                        % ��� ������ â�� ���� 
clear all;                                        % �����ִ� �۾�����(workspace)�� ��� ��� 
clc;                                              % ���(command) â�� ���

R=1; C=0.1;                                         % ȸ�� ���� �� ����
syms s t                                          % ������ ��ȣ�� ����
x=3*heaviside(t-1)-3*heaviside(t-4);              % x(t) ����
X=laplace(x);                                     % x(t)�� ���ö� ��ȯ X(s) ����
H=1/(R*C*(s+1/(R*C)));                            % RCȸ�� ���� �Լ� ����
Y=X*H;                                            % ����� ���ö� ��ȯ Y(s) ���
y=ilaplace(Y)                                     % Y(s)�� �� ���ö� ��ȯ ����