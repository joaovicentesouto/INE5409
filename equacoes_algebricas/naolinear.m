function naolinear

clear
clc

    function y1 = f1(x)
        y1 = exp(x(1)) + x(2) -1;
    end
    function y2 = f2(x)
        y2 = x(1)^2+x(2)^2-4;
    end

x = [1 -1];
k = 0;
erro = 10^-4;
d = [1 1];

while max(abs(d)) > erro
    k = k+1;
    J(1,1) = exp(x(1));
    J(1,2) = 1;
    J(2,1) = 2*x(1);
    J(2,2) = 2*x(2);
    F(1) = -f1(x);
    F(2) = -f2(x);
    J;
    F;
    
    d = J\F'; %gauss(J,F)
    x = x + d';
    
end

k
x
d
F

end