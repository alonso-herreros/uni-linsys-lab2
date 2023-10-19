n_points = 200;
T1 = 3;

% Explore different values for delta_t
delta_t = 0.1;
t = -5:delta_t:5;
x = zeros(size(t));
x(find(abs(t)<=T1)) = 1;

f = linspace(-5,5,n_points);
for k = 1:length(f)    
    X_num(k) = sum(x.*exp(-j*2*pi*f(k)*t)*delta_t);
end

% X_num contains the numerical evaluation of the Fourier analysis integral