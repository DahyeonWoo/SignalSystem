clc; clear all; close all;

n = 0:36 ;
x = cos(2*pi*n/36);

p = stem(n,cumsum(x),'k','filled');
set(p,'LineWidth',2,'MarkerSize',4);
xlabel('\itn','FontName','Times','FontSize',24);
ylabel('x[{\itn}]','FontName','Times','FontSize',24);