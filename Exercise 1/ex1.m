n_points = 200;
f = linspace(-5,5,n_points);

% x = e^(-at) => x_hat = 1/(a+j 2pi f)
a = [1; 0.2; 2]; % a>0
xh_1 = 1./(a(1) + 1j*2*pi.*f);
xh_2 = 1./(a(2) + 1j*2*pi.*f);
xh_3 = 1./(a(3) + 1j*2*pi.*f);

subplot(2,1,1)
plot(f, real(xh_1), f, real(xh_2), f, real(xh_3))
xlabel('Frequency'), ylabel('Re[xh(f)]')
subplot(2,1,2)
plot(f, imag(xh_1), f, imag(xh_2), f, imag(xh_3))
xlabel('Frequency'), ylabel('Im[xh(f)]')


% Attempt at creating a video
fig = figure(2);
f = linspace(-5,5,n_points);
X = 1./(1 + 1j*2*pi.*f);   % Generate the initial X data

sp1 = subplot(2,1,1);
title('x(t) = e^{-at}')
p1 = plot(f, real(X)) ;   % Generate the initial plot (and retrieve the handle of the graphic object)
ylim([-3,5]) ;             % Set the Y axes limits (once and for all)
xlabel('Frequency'), ylabel('Re[xh(f)]')

subplot(2,1,2)
p2 = plot(f, imag(X));
ylim([-3,5]) ;
xlabel('Frequency'), ylabel('Im[xh(f)]')

writerObj = VideoWriter('test.avi'); % initialize the VideoWriter object
open(writerObj) ;
for a = 0.001:0.05:5
    X = 1./(a + 1j*2*pi.*f);        % calculate new Y values

    % update the plot data (this does not generate a "new" plot), nor resize the axes
    set(get(sp1, "Title"), 'String', sprintf('x(t) = e^{-at}, a = %.2f', a));
    set(p1, 'YData', real(X)) ;
    set(p2, 'YData', imag(X)) ;

    writeVideo(writerObj,getframe(fig))  % add the frame to the movie
end
close(writerObj);