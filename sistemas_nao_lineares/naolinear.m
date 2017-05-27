function naolinear

% derivada de forma analítica

clear
clc

    %function y1 = f1(x)
    %    y1 = exp(x(1)) + x(2) -1;
    %end
    %function y2 = f2(x)
    %    y2 = x(1)^2+x(2)^2-4;
    %end

    function y1 = f1(x)
        y1 = x(1)^2 + x(2) - 37;
    end
    function y2 = f2(x)
        y2 = x(1) + x(2)^2 - 5;
    end
    function y3 = f3(x)
        y3 = x(1) +x(2) + x(3) - 3;
    end

x = [-1 -1 -1];
k = 0;
erro = 10^-4;
d = [1 1];

while max(abs(d)) > erro
    k = k+1;
    J(1,1) = 2*x(1);
    J(1,2) = 1;
    J(1,3) = 0;
    J(2,1) = 1;
    J(2,2) = 2*x(2);
    J(2,3) = 0;
    J(3,1) = 1;
    J(3,2) = 1;
    J(3,3) = 1;
    F(1) = -f1(x);
    F(2) = -f2(x);
    F(3) = -f3(x);
    J
    F

    d = J\F' %gauss(J,F)
    x = x + d'
    pause

end

k
x
d
F

end
