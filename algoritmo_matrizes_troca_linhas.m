A = [4 2 3; 2 -4 -1; -1 1 4];
B = [7;1;-5];
n = size(A,1);
linhas = [1:n]; % Sequência de linhas usadas

for k = 1:n-1

  % Troca de linhas se baseando no maior valor absoluto
  maior = abs(A(linhas(k), k));
  pivo = k;
  for i = k:n
    if maior < abs(A(linhas(k), k))
      maior = abs(A(linhas(k), k));
      pivo = i;
    end
  end
  tmp = linhas(pivo);
  linhas(pivo) = linhas(k);
  linhas(k) = tmp;

  % Transformação para triangular inferior
  for i = k+1:n
    m = A(linhas(i), k)/A(linhas(k), k);
    for j = k:n
      A(linhas(i), j) = A(linhas(i), j) - m*A(linhas(k), j);
    end
    B(linhas(i)) = B(linhas(i)) - m*B(linhas(k));
  end
end

% Solucionando o sistema
X(linhas(n)) = B(linhas(n))/A(linhas(n), n);
for i = n-1:-1:1
  soma = 0;
  for j = i+1:n
    soma = soma + A(linhas(i), j)*X(linhas(j));
  end
  X(linhas(i)) = (B(linhas(i)) - soma)/A(linhas(i), i);
end

A
B
X
