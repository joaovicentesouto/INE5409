A = [4 2 3; 2 -4 -1; -1 1 4];
b = [7; 1; -5];
n = size(A,1);
L = [1 0 0; 1 1 0; 1 1 1];
U = [1 1 1; 0 1 1; 0 0 1];

for k=1:n

  % Matriz L
  for i=k:n
    somaL = 0;
    for z=1:k-1
      somaL = somaL + L(i,z)*U(z,k);
    end
    L(i,k) = A(i,k) - somaL;
  end
  % Matriz U
  for j=k+1:n
    somaU = 0;
    for z=1:k-1
      somaU = somaU + L(k,z)*U(z,j);
    end
    U(k,j) = (A(k,j) - somaU) / L(k,k);
  end

end

% Solucionando o sistema Ly=b
y(1) = b(1)/L(1,1);
for i = 2:n
  soma = 0;
  for j = 1:i-1
    soma = soma + L(i,j)*y(j);
  end
  y(i) = (b(i) - soma)/L(i,i);
end

% Solucionando o sistema Ux=y
x(n) = y(n)/U(n,n);
for i = n-1:-1:1
  soma = 0;
  for j = i+1:n
    soma = soma + U(i,j)*x(j);
  end
  x(i) = (y(i) - soma)/U(i,i);
end

x

L
U
A
LxU = L*U
