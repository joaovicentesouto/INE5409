A = [4 2 3; 2 -4 -1; -1 1 4];
A_original = A;
b = [7; 1; -5];
n = size(A,1);

% Decomposição LU por crowley mas sobrescrevendo L e U
% na matriz A para economizar espaço.

for k=1:n

  % Matriz L
  for i=k:n
    somaL = 0;
    for z=1:k-1
      somaL = somaL + A(i,z)*A(z,k);
    end
    A(i,k) = A(i,k) - somaL;
  end
  % Matriz U
  for j=k+1:n
    somaU = 0;
    for z=1:k-1
      somaU = somaU + A(k,z)*A(z,j);
    end
    A(k,j) = (A(k,j) - somaU) / A(k,k);
  end

end

% Solucionando o sistema Ly=b
y(1) = b(1)/A(1,1);
for i = 2:n
  soma = 0;
  for j = 1:i-1
    soma = soma + A(i,j)*y(j);
  end
  y(i) = (b(i) - soma)/A(i,i);
end

% Solucionando o sistema Ux=y
x(n) = y(n);
for i = n-1:-1:1
  soma = 0;
  for j = i+1:n
    soma = soma + A(i,j)*x(j);
  end
  x(i) = (y(i) - soma);
end

x
A
A_original
