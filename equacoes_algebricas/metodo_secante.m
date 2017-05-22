function secante

    clear
    clc
    format long

    %function y = f(x)
    %    y = exp(x).*sin(x)-1;
    %end

    function y = f(x)
        y = exp(x)-2.*cos(x);
    end

    erro = 10^-3;
    a = 0;
    b = 2;
    x = [a:0.1:b];
    y = f(x);

    plot(x,y);
    grid
    hold on

    x0 = a;
    x1 = b;
    f0 = f(x0);
    f1 = f(x1);

    r = f0+((f1-f0)/(x1-x0))*(x-x0);
    plot(x, r, 'r')
    pause

    iteracoes = 0;

    while (abs(f1) > erro)

        xk = x1 - f1*(x1-x0)/(f1-f0);
        x0 = x1;
        x1 = xk;

        f0 = f(x0);
        f1 = f(x1);

        r = f0+((f1-f0)/(x1-x0))*(x-x0);
        plot(x, r, 'r')
        pause

        iteracoes = iteracoes + 1;

    end

x0
x1
x0-x1
f0
f1
iteracoes

end
