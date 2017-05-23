function naolinear

clear
clc
format long

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
h = 0.01;

while max(abs(d)) > erro
    k = k+1;
    
    F(1) = f1(x);
    F(2) = f2(x);
    
    % JA(1,1) = exp(x(1));  Algebricamente
    J(1,1) = (f1([x(1)+h x(2)]) - F(1))/h;
    
    % JA(1,2) = 1;          Algebricamente
    J(1,2) = (f1([x(1) x(2)+h]) - F(1))/h;
    
    % JA(2,1) = 2*x(1);     Algebricamente
    J(2,1) = (f2([x(1)+h x(2)]) - F(2))/h;
    
    % JA(2,2) = 2*x(2);     Algebricamente
    J(2,2) = (f2([x(1) x(2)+h]) - F(2))/h;
    
    J;
    F;
    
    d = J\-F'; %gauss(J,F)
    x = x + d';
    
end

k
x
d
-F

end