x = [...] pontos
y = [...] f(x) dos pontos
n = tamanho (x) = quant. de pontos
m = 2;
% Funcao base phi = e^(ix)

% Construindo o sistema
for i = 1 até m+1
  for j = i até m+1
    A(i,j) = 0;
    for k = 1 até n
      A(i,j) = A(i,j) + (e^((j-1)*x(k)) * e^((i-1)*x(k)))
    end
    A(j,i) = A(i,j)

    b(i) = 0
    for k - 1 até n
      b(i) = b(i) + (y(k) * e^((i-1)*x(k)))
    end
end

% Resolvendo o sistema e encontrando os coeficientes
% o polinomio de ajuste
c = A\b'

% Gerando os valores do polinomio no intervalo
for i = 1 até n
  g(i) = 0
  for k = 1 até m+1
    g(i) = g(i) + c(k) * e^((k-1)*x(i))
  end
end
