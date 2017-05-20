% Definição
Pn(x) = Polinômio de grau n do qual queremos encontrar as raízes
a = [an, an-1, ... , a1, a0] => Coeficientes do polinômio
x = x - R/R1
R = Pn(x)
R1 = P'n(x)


% Variáveis principais
x = 1; % Chute inicial
n = grau+1 de Pn(x) % +1 por causa da constante

% Auxiliares, calcular f(x) toda hora custa muito.
b(n) = 1; % Qualquer valor > erro

erro = 10^-6; % Exemplo
count;

while abs(b(n)) > erro % b(n) = R

  b(1) = a(1);
  c(1) = b(1);
  for i = 2 até n-1
    b(i) = b(i-1)*x + a(i);
    c(i) = c(i-1)*x + b(i);
  end
  b(n) = b(n-1)*x + a(n);

  x = x - b(n)/c(n-1); % x1 = x0 - R/R1

  count = count + 1;
end
