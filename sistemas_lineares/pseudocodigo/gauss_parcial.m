% Escalonamento de uma matriz nxn usando gauss:
% Fixando um K para a linha e coluna pivo temos:
% Sistema Ax = b

A = matriz n x n
b = vetor 1 x n
x = vetor 1 x n

l = vetor com a ordem das linhas trocas

for k = 1 até n-1

  % Acha a linha com maior módulo
  maior_em_modulo = abs(A(l(k),k))
  pivo = k
  for i = k+1 até n
    if maior_em_modulo < abs(A(l(i),k))
      maior_em_modulo = abs(A(l(i),k))
      pivo = i
    end
  end
  % Troca linhas
  temp = l(pivo)
  l(pivo) = l(k)
  l(k) = temp

  for i = k+1 até n
    escalar = A(l(i),k) / A(l(k),k)
    for j = k até n
      A(l(i),j) = A(l(i),j) - escalar * A(l(k),j)
    end
    b(l(i)) = b(l(i)) - escalar * b(l(i))
  end

end

% Achando vetor solução x
x(n) = b(l(n)) / A(l(n),n)
for i = n-1 até 1
  soma = 0
  for j = i+1 até n
    soma = soma + A(l(i),j) * x(j)
  end
  x(i) = (b(l(i)) - soma) / A(l(i),i)
end
