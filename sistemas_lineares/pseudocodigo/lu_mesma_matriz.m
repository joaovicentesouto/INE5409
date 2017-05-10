A = matriz n x n
b = vetor 1 x n
x = vetor 1 x n
L e U na mesma matriz A

for j = 2 até n
  A(1,j) = A(1,j)/A(1,1)
end

for k = 2 até n

  for i = k até n
    soma = 0
    for r = 1 até k-1
      soma = soma + A(i,r)*A(r,k)
    end
    A(i,k) = A(i,k) - soma
  end

  for j = k+1 até n
    soma = 0
    for r = 1 até k-1
      soma = soma + A(k,r)*A(r,j)
    end
    A(k,j) = (A(k,j) - soma) / A(k,k)
  end

end

% Ly = b
y(1) = b(1) / L(1,1)
for i = 2 até n
  soma = 0
  for j = 1 até i-1
    soma = soma + A(i,j)*y(j)
  end
  A(i) = (b(i) - soma) / A(i,i)
end

% Ux = y    diagonal de U sempre == 1
x(n) = y(n)
for i = n-1 até 1
  soma = 0
  for j = i+1 até n
    soma = soma + A(i,j)*x(j)
  end
  x(i) = y(i) - soma
end
