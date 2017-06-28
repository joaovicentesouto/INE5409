x = [...] pontos
y = [...] f(x) dos pontos
n = tamanho (x) = quant. de pontos

% Primeira coluna == y
for i = 1 até n
  A(i, 1) = y(i)
end

for j = 2 até n
  for i = j até n
    A(i,j) = (A(i,j-1) - A(i-1,j-1)) / (x(i) - x(i-j+1))
  end
end

% A(k,k) = coeficientes primários = a0 + a1*(x-x0) + ... + an*(x-x0)*...*(x-x(n-1))

x_intervalo = [x(1),...x(n)]
n_intervalo = tamaho (x_intervalo)

for k = 1 até n_intervalo
  soma = A(1,1);
  for i = 2 até n
    mult = A(i,i)
    for j = 1 até i-1
      mult = mult * (x_intervalo(k) - x(j))
    end
    soma = soma + mult
  end

  y_intervalo(k) = soma;
end
