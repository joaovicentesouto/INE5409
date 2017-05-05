% A = [4 2 3; 2 -4 -1; -1 1 4];
% b = [7;1;-5];
A = [1 -1 1; 2 3 -1; -3 1 1];
b = [1;4;-1];

A1 = A;
b1 = b;

n = size(A,1);
linhas = [1:n]; % Sequência de linhas usadas
colunas = [1:n]; % Sequência de colunas usadas

for k = 1:n-1

	% Troca de linhas e colunas se baseando no maior valor absoluto
	maior = abs(A(linhas(k), colunas(k)));
	pivoLinha = k;
	pivoColuna = k;

	for i = k:n
		for j = k:n
			if maior < abs(A(linhas(i), colunas(j)))
				maior = abs(A(linhas(i), colunas(j)));
				pivoLinha = i;
				pivoColuna = j;
			end
		end
	end

	% Troca de linhas
	tmp = linhas(pivoLinha);
	linhas(pivoLinha) = linhas(k);
	linhas(k) = tmp;

	% Troca de Colunas
	tmp = colunas(pivoColuna);
	colunas(pivoColuna) = colunas(k);
	colunas(k) = tmp;

	% Transformação para triangular inferior
	for i = k+1:n
		m = A(linhas(i), colunas(k)) / A(linhas(k), colunas(k));
		for j = k:n
			A(linhas(i), colunas(j)) = A(linhas(i), colunas(j)) - m * A(linhas(k), colunas(j));
		end
		b(linhas(i)) = b(linhas(i)) - m * b(linhas(k));
	end
end

% Solucionando o sistema
x(colunas(n)) = b(linhas(n))/A(linhas(n), colunas(n));
for i = n-1:-1:1
	soma = 0;
	for j = i+1:n
		soma = soma + A(linhas(i), colunas(j)) * x(colunas(j));
	end
	x(colunas(i)) = (b(linhas(i)) - soma)/A(linhas(i), colunas(i));
end

% Resultado das operações
A
b
% Solução
x
% Sequência final das linhas e colunas
linhas
colunas
% Erro relativo
r = abs(b1 - A1 * x')
