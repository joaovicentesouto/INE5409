% Escalonamento de uma matriz nxn usando gauss:
% Fixando um K para a linha e coluna pivo temos:
% Sistema Ax = b

A = matriz n x n
b = vetor 1 x n
x = vetor 1 x n

l = vetor com a ordem das linhas trocas
l = vetor com a ordem das colunas trocas

for k = 1 até n-1

  % Acha a linha com maior módulo
  maior_em_modulo = abs(A(l(k),c(k))
  linha_pivo = k
  coluna_pivo = k

  for i = k até n
    for j = k até n
    if maior_em_modulo < abs(A(l(i),c(j)))
      maior_em_modulo = abs(A(l(i),c(j)))
      linha_pivo = i
      coluna_pivo = j
    end
  end
  % Troca linhas
  temp = l(linha_pivo)
  l(linha_pivo) = l(k)
  l(k) = temp
  % Troca colunas
  temp = c(coluna_pivo)
  c(coluna_pivo) = c(k)
  c(k) = temp

  for i = k+1 até n
    escalar = A(l(i),c(k)) / A(l(k),c(k))
    for j = k até n
      A(l(i),c(j)) = A(l(i),c(j)) - escalar * A(l(k),c(j))
    end
    b(l(i)) = b(l(i)) - escalar * b(l(i))
  end

end

% Achando vetor solução x
x(c(n)) = b(l(n)) / A(l(n),c(n))
for i = n-1 até 1
  soma = 0
  for j = i+1 até n
    soma = soma + A(l(i),c(j)) * x(c(j))
  end
  x(c(i)) = (b(l(i)) - soma) / A(l(i),c(i))
end
