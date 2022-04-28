% Projram to demonstrate discrete-time convolution
nx = -5:15; % Set a discrete-time vetor for the excitation set(p,'LineWidth',2,'MarkderSize',4);
x = tri((nx-3)/3); % Generate the excitation vector

nh = 0:20; % Set a discrete-time vector for the impulse response
% Generate the impulse response vector
h = ((4/5).^nh).*usD(nh);

% Compute the beginning and ending discrete times for the system
% response vector from the discrete-time vectors for the excitation and the
% impulse response

nymin = nx(1) + nh(1); 
nymax = nx(length(nx)) + length(nh);
ny = nymin:nymax-1;

% Generate the system response vector by convolving the excitation with the
% impulse response
y = conv(x,h);

% Graph the input response
subplot(3,1,1); p = stem(nx,x,'k','filled');
set(p,'LineWidth',2,'MarkerSize',4);
axis([nymin,nymax,0,3]);
xlabel('n'); ylabel('x[n]');

% Graph the impulse response
subplot(3,1,2); p=stem(nh,h,'k','filled');
set(p,'LineWidth',2,'MarkerSize',4);
axis([nymin,nymax,0,3]);
xlabel('n'); ylabel('h[n]');

% Graph the system response
subplot(3,1,3); p = stem(ny,y,'k','filled');
set(p,'LineWidth',2,'MarkerSize',4);
axis([nymin,nymax,0,3]);
xlabel('n'); ylabel('y[n]');

function y = usD(n)
    y = double(n>-0);
    I = find(round(n) ~= n);
    y(I) = NaN;
end

function y = tri(n)
    y = (n+1).*(-1<=n & n<0) + (-n+1).*(0<=n & n<1);
end