% Representation of the signal in the time domain
N1 = 3;
n = -10:10;
x_pulse = zeros(size(n));
x_pulse(abs(n)<=N1) = 1;
subplot(2,1,1);
stem(n,x_pulse);
xlabel('n');
ylabel('x_{pulse}[n]');
title('Time Domain')

% Representation of the signal in the frequency domain
n_points = 200;
f = linspace(-0.5,0.5,n_points);
X_pulse = zeros(size(f));
for k = 1:length(f)
    X_pulse(k) = sum(x_pulse.*exp(-1j*n*2*pi*f(k)));
end
subplot(2,1,2)
plot(f, real(X_pulse)); 
xlabel('f');
ylabel('x_{pulse}(f)');
title('Frequency domain')