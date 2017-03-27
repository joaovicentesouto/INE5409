A = [4 2 3; 2 -4 -1; -1 1 4];
B = [7;1;-5];
n = size(A,1);
linhas = [1:n]; % Sequência de linhas usadas
colunas = [1:n]; % Sequência de colunas usadas

for k = 1:n-1

  % Troca de linhas e colunas se baseando no maior valor absoluto
  maiorLinha = abs(A(linhas(k), colunas(k)));
  maiorColuna = abs(A(linhas(k), colunas(k)));
  pivoLinha = k;
  pivoColuna = k;
  for i = k:n
    if maiorLinha < abs(A(linhas(k), colunas(k)))
      maiorLinha = abs(A(linhas(k), colunas(k)));
      pivoLinha = i;
    end
    if maiorColuna < abs(A(linhas(k), colunas(k)))
      maiorColuna = abs(A(linhas(k), colunas(k)));
      pivoColuna = i;
    end
  end

  if maiorLinha > maiorColuna
    pivo = pivoLinha;
  else
    pivo = pivoColuna;
  end
  tmp = linhas(pivo);
  linhas(pivo) = linhas(k);
  linhas(k) = tmp;

  % Transformação para triangular inferior
  for i = k+1:n
    m = A(linhas(i), colunas(k))/A(linhas(k), colunas(k));
    for j = k:n
      A(linhas(i), colunas(j)) = A(linhas(i), colunas(j)) - m*A(linhas(k), colunas(j));
    end
    B(linhas(i)) = B(linhas(i)) - m*B(linhas(k));
  end
end

% Solucionando o sistema
X(linhas(n)) = B(linhas(n))/A(linhas(n), colunas(n));
for i = n-1:-1:1
  soma = 0;
  for j = i+1:n
    soma = soma + A(linhas(i), colunas(j))*X(linhas(j));
  end
  X(linhas(i)) = (B(linhas(i)) - soma)/A(linhas(i), colunas(i));
end

A
B
X
