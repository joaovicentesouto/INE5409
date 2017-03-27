A = [4 2 3; 2 -4 -1; -1 1 4];
B = [7;1;-5];
n = size(A,1);

for k = 1:n-1
  % Transformação para triangular inferior
  for i = k+1:n
    m = A(i,k)/A(k,k);
    for j = k:n
      A(i,j) = A(i,j) - m*A(k,j);
    end
    B(i) = B(i) - m*B(k);
  end
end

% Solucionando o sistema
X(n) = B(n)/A(n,n);
for i = n-1:-1:1
  soma = 0;
  for j = i+1:n
    soma = soma + A(i,j)*X(j);
  end
  X(i) = (B(i) - soma)/A(i,i);
end

% Respotas
A
B
X
