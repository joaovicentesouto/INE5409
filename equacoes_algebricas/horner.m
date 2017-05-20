function horner

    clear
    clc
    format long


    erro = 10^-6;
    a = [1 0 2 -1];
    n = length(a);

    x = -1+1i;
    b(n) = 1;

    iteracoes = 0;

    while (abs(b(n)) > erro)

        b(1) = a(1);
        c(1) = b(1);
        for i = 2:n-1
            b(i) = b(i-1)*x + a(i);
            c(i) = c(i-1)*x + b(i);
        end
        b(n) = b(n-1)*x + a(n);

        x = x - b(n)/c(n-1); % x1 = x0 - R/R1

        iteracoes = iteracoes + 1;

    end

    x
    b(n)
    iteracoes
    roots(a)

end
