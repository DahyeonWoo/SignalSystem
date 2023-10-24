function zero_hold(fs, ti, tf, t, xt, w)     % ���� Ȧ�带 �̿��� ���ø��� ��ȣ�� ���� 

n=ti:1/fs:tf;                                % ���ø� ���ļ��� ���� ���� ���� ����
xn=cos(2*pi*n);                              % ���ø��� ��ȣ x[n] ���

subplot(2,2,w(1));                           % 2�� 2�� ���� �׸�â�� w(1)�� â ����
plot(t,xt,'k:')                              % ������ ���� ��ȣ x(t) �׸�
axis([ti tf -1.5 1.5])                       % x��� y���� �׸� ���� ����
hold on                                      % ���� â ������ �����ؼ� �׸�
stem(n,xn)                                   % ���ø��� �̻� ��ȣ x[n] �׸�
title('���ø��� �̻� ��ȣ');                  % �׸� ���� 
xlabel('t');                                 % x�� �� ǥ�� 
subplot(2,2,w(2));                           % 2�� 2�� ���� �׸� â�� w(2)�� â ����
plot(t,xt,'k:')                              % ������ ���� ��ȣ x(t) �׸�
axis([ti tf -1.5 1.5])                       % x��� y���� �׸� ���� ����
hold on                                      % ���� â ������ �����ؼ� �׸�
stairs(n,xn)                                 % ���� Ȧ�忡 ���� ���� ��ȣ x_r(t) �׸�
title('���� Ȧ�忡 ���� ���� ��ȣ');           % �׸� ����
xlabel('t');                                 % x�� �� ǥ��

end
