tmin=-4; tmax=20;
dt=0.1;
t=tmin:dt:tmax;

g0 = g(t);
g1 = 3*g(t+1);
g2 = g(3*t)/2;
g3 = -2*g((t-1)/2);
gmax = max([max(g0), max(g1), max(g2), max(g3)]);
gmin = min([min(g0), min(g1), min(g2), min(g3)]);
subplot(2,2,1); p = plot(t,g0,'k'); set(p,'LineWidth',2);
xlabel('t'); ylabel('g(t)'); title('Original Function, g(t)');
axis([tmin,tmax,gmin,gmax]); grid;
subplot(2,2,2); p=plot(t,g1,'k'); set(p,'LineWidth',2);
xlabel('t'); ylabel('3g(t+1)'); title('First Change');
axis([tmin,tmax,gmin,gmax]); grid;
subplot(2,2,3); p=plot(t,g2,'k'); set(p,'LineWidth',2);
xlabel('t'); ylabel('g(3t)/2'); title('Second Change');
axis([tmin,tmax,gmin,gmax]); grid;
subplot(2,2,4); p=plot(t,g3,'k'); set(p,'LineWidth',2);
xlabel('t'); ylabel('-2g((t-1)/2)'); title('Third Change');
axis([tmin,tmax,gmin,gmax]); grid;

function y = g(t)
    y1=-4-2*t; y2=-4+3*t; y3=16-2*t;
    y = y1.*(-2<t & t<=0) + y2.*(0<t & t<=4) + y3.*(4<t & t<=8);
end