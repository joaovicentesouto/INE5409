function newton

    clear
    clc
    format long

    %function y = f(x)
    %    y = exp(x).*sin(x)-1;
    %end

    %function z = g(x)
    %    z = exp(x).*sin(x) + exp(x).*cos(x);
    %end

    function y = f(x)
        y = 5*x^5 - 4*x^4 + x^3 - x + 1;
    end

    function z = g(x)
        z = 25*x^4 - 16*x^3 + 3*x^2 - 1;
    end

    erro = 10^-6;
    %x = [0:0.1:2];
    %y = f(x);

    %plot(x,y);
    grid
    hold on

    x0 = 1;

    iteracoes = 0;

    while (abs(f(x0)) > erro)

        df = g(x0);
        fx = f(x0);

        iteracoes
        xk = x0 - (fx / df)
        x0=xk;

        %r = df*(x-x0) + fx;
        %plot(x, r, 'r')
        grid
        hold on

        iteracoes = iteracoes + 1;

    end

x0
fx
iteracoes

end
