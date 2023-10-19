function [n_ext,x_ext] = repite_pulso(N1,n_times)

    n = -10:10;
    x = zeros(size(n));
    x(abs(n)<=N1) = 1;
    
    x_ext = x;
    for k = 1:n_times
       x_ext = [x x_ext x];
    end
    
    max_n = (length(x_ext)-1)/2;
    n_ext = -max_n:max_n;