x = [...] vetor de pontos
y = [...] vetor dos f(x)'s

n = tamanho(x) = quantidade de pontos

x_intervalo = [x(1), ..., x(n)]
n_intervalo = tamanho (x_intervalo)

% Somatório: y(i) * L(i) tal que
% L(i) = multiplicatório: (x - xj)/(xi - xj)

for k = 1 até n_intervalo
  p(k) = 0;

  for i = 1 até n
    cima = 1;
    baixo = 1;
    for j = 1 até n
      if i ~= j
        cima = cima * (x_intervalo(k) - x(j))
        baixo = baixo * (x(i) - x(j))
      end
    end

    L(i) = cima/baixo;
    p(k) = p(k) + y(i)*L(i)
  end
end

p(k) = valor do polinômio de cada ponto(k)
