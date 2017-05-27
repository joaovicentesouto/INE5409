function naolinear

% derivada de forma numérica

clear
clc
format long

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

%x = [1 -1];
x = [-1 -1 -1];
k = 0;
erro = 10^-3;
d = [1 1 1];
h = 0.1;

while max(abs(d)) > erro
    k = k+1;

    F(1) = f1(x);
    F(2) = f2(x);
    F(3) = f3(x);

    J(1,1) = (f1([x(1)+h x(2) x(3)]) - F(1))/h;
    J(1,2) = (f1([x(1) x(2)+h x(3)]) - F(1))/h;
    J(1,3) = (f1([x(1) x(2) x(3)+h]) - F(1))/h;

    J(2,1) = (f2([x(1)+h x(2) x(3)]) - F(2))/h;
    J(2,2) = (f2([x(1) x(2)+h x(3)]) - F(2))/h;
    J(2,3) = (f2([x(1) x(2) x(3)+h]) - F(2))/h;

    J(3,1) = (f3([x(1)+h x(2) x(3)]) - F(3))/h;
    J(3,2) = (f3([x(1) x(2)+h x(3)]) - F(3))/h;
    J(3,3) = (f3([x(1) x(2) x(3)+h]) - F(3))/h;

    J
    F

    d = J\-F'; %gauss(J,F)
    x = x + d';

    d
    x
    pause

end

k
x
d
-F

end
