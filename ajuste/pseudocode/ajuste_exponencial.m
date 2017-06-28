x = [...] pontos
y = [...] f(x) dos pontos
n = tamanho (x) = quant. de pontos
m = 1; % grau

% Ideia:
% z = ln(a) + bx = ln(y) => a*e^(bx) = y
z = log(y)

% Construindo o sistema
for i = 1 até m+1
  for j = i até m+1
    A(i,j) = 0;
    for k = 1 até n
      A(i,j) = A(i,j) + (x(k)^(j-1) * x(k)^(i-1))
    end
    A(j,i) = A(i,j)

    b(i) = 0
    for k - 1 até n
      b(i) = b(i) + (z(k) * x(k)^(i-1))
    end
end

% Resolvendo o sistema e encontrando os coeficientes
% o polinomio de ajuste
c = A\b'

% Olhando pra funcão
a_ = e^(c(1))
b_ = c(2)

% Gerando os valores do polinomio no intervalo
for i = 1 até n
  g(i) = 0
  for k = 1 até m+1
    g(i) = a_ * e^(b_ * x(i))
  end
end
