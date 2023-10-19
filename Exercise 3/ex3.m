% Representation of the signal in the time domain
N1 = 3; rept = 1;
[n, x] = repite_pulso(N1, rept);
subplot(2,1,1);
stem(n,x);
xlabel('n');
ylabel('x_{pulse}[n]');
title('Time Domain')

% Representation of the signal in the frequency domain
n_points = 200;
f = linspace(-0.5,0.5,n_points);
X = zeros(1,length(f));
for k = 1:length(f)
    X(k) = sum(x.*exp(-1j*n*2*pi*f(k)));
end
