Pn(x) = Polinômio de grau n que se deseja encontrar as raízes
xk = x0 - R/R1 => R = f(x0) e R1 = f'(x0)

% Variáveis
a = [an, an-1, ... a1, a0] % n+1 coeficientes do Pn(x)
n = grau+1 de Pn(x), quantidade de coef...
x = 1; % Chute inicial
b(n) = 1; % Maior que o erro

erro = 10^-6; % Exemplo
count

while (abs(b(n)) > erro)

    b(1) = a(1);
    c(1) = b(1);
    for i = 2:n-1
        b(i) = b(i-1)*x + a(i);
        c(i) = c(i-1)*x + b(i);
    end
    b(n) = b(n-1)*x + a(n);

    x = x - b(n)/c(n-1); % x1 = x0 - R/R1

    count = count + 1;

end
