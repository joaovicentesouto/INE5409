x = [...] vetor de pontos
y = [...] vetor dos f(x)'s

n = tamanho(x) = quantidade de pontos

% Montando o sistema

for i = 1 até n
  for j = 1 até n
    A(i,j) = x(i)^(j-1);
  end
end

% Achando os coeficientes
% Usando Gauss ou outro método para achar os coef.
c = A\y'

% Para um intervalo [a, ..., b]
x_intervalo = [x(1), ..., x(n)];
n_intervalo = tamanho (x_intervalo)

% Achando o valor do polinômio em cada ponto
for i = 1 até n_intervalo
  p(i) = 0;
  for j = 1 até n % quantidade de coeficientes
    p(i) = p(i) + c(j) * x_intervalo(i)^(j-1);
  end
end

% Em um ponto qualquer
y_ponto_qlqr = 0;
for j = 1 até n
  y_ponto_qlqr = y_ponto_qlqr + c(j) * ponto_qlqr^(j-1);
end
