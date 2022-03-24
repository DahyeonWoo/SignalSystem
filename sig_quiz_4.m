dt=0.1; t=-7:dt:13;
% (a)
x=4*exp(-t/10).*rectangularPulse((t-4)/3);
xsq=x.^2;
Ex=trapz(t,xsq);
disp(['(a) Ex = ', num2str(Ex)]);
%(b)
T0=10;
dt=0.1; t=-5:dt:5;
x=-3*t; xsq=x.^2;
Px=trapz(t,xsq)/T0;
disp(['(b) Px = ',num2str(Px)]);
