% Escalonamento de uma matriz nxn usando gauss:
% Fixando um K para a linha e coluna pivo temos:
% Sistema Ax = b

A = matriz n x n
b = vetor 1 x n
x = vetor 1 x n

for k = 1 até n-1
  for i = k+1 até n
    escalar = A(i,k)/A(k,k)
    for j = k até n
      A(i,j) = A(i,j) - escalar*A(k,j)
    end
    b(i) = b(i) - escalar * b(k)
  end
end

% Achando vetor solução x
x(n) = b(n)/A(n,n)
for i = n-1 até 1
  soma = 0
  for j = i+1 até n
    soma = soma + A(i,j)*x(j)
  end
  x(i) = (b(i) - soma) / A(i,i)
end
