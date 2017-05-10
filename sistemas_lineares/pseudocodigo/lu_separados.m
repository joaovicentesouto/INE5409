A = matriz n x n
b = vetor 1 x n
x = vetor 1 x n
L = matriz n x n inferior
U = matriz n x n superior com a todos U(i,j) = 1 se i==j

for k = 1 até n

  for i = k até n
    soma = 0
    for r = 1 até k-1
      soma = soma + L(i,r)*U(r,k)
    end
    L(i,k) = A(i,k) - soma
  end

  for j = k+1 até n
    soma = 0
    for r = 1 até k-1
      soma = soma + L(k,r)*U(r,j)
    end
    U(k,j) = (A(k,j) - soma) / L(k,k)
  end

end

% Ly = b
y(1) = b(1) / L(1,1)
for i = 2 até n
  soma = 0
  for j = 1 até i-1
    soma = soma + L(i,j)*y(j)
  end
  y(i) = (b(i) - soma) / L(i,i)
end

% Ux = y    diagonal de U sempre == 1
x(n) = y(n)
for i = n-1 até 1
  soma = 0
  for j = i+1 até n
    soma = soma + U(i,j)*x(j)
  end
  x(i) = y(i) - soma
end
