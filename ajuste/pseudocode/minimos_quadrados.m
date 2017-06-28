x = [...] pontos
y = [...] f(x) dos pontos
n = tamanho (x) = quant. de pontos
m = 2; % grau do polinomio geralmente 2 ou 1

% Construindo o sistema
for i = 1 até m+1
  for j = i até m+1
    A(i,j) = 0;
    for k = 1 até n
      A(i,j) = A(i,j) + (x(k)^(j-1) * x(k)^(i-1))
    end
    A(j,i) = A(i,j)

    b(i) = 0
    for k = 1 até n
      b(i) = b(i) + (y(k) * x(k)^(i-1))
    end
end

% Resolvendo o sistema e encontrando os coeficientes
% o polinomio de ajuste
c = A\b'

% Gerando os valores do polinomio no intervalo
for i = 1 até n
  g(i) = 0
  for k = 1 até m+1
    g(i) = g(i) + c(k) * x(i)^(k-1)
  end
end
