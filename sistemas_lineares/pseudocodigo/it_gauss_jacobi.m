A = matriz n x n
b = vetor 1 x n
x = vetor 1 x n

x0 = chute inicial
x1 = aproximação

erro = maior diferença em módulo de x1 e x0

while erro > 10^-6

  for i = 1 até n
    soma = 0
    for j = 1 até n
      if i ~= j
        soma = soma + A(i,j)*x0(j)
      end
    end
    x1(i) = (b(i) - soma) / A(i,i)
  end

  erro = abs(x1(1) - x0(1))
  for i = 2 até n
    if abs(x1(i) - x0(i)) > erro
      erro = abs(x1(1) - x0(1))
    end
  end

  x0 = x1
end
