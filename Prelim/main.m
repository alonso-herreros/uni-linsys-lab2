n_points = 100;
t = linspace(-3,3,n_points);
y = cos(2*pi*t);
figure(1)
plot(t,y)
xlabel('time'), ylabel('y(t)')

n_points = 200;
T1 = 3;
f = linspace(-5,5,n_points);
x_hat = 2.*T1.*sinc(2.*T1.*f);  
figure(2)
plot(f,x_hat);
xlabel('f'),
ylabel('x(f)')