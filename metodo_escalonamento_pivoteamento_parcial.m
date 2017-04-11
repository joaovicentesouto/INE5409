% A = [4 2 3; 2 -4 -1; -1 1 4];
% b = [7;1;-5];
A = [1 -1 1; 2 3 -1; -3 1 1];
b = [1;4;-1];

A1 = [1 -1 1; 2 3 -1; -3 1 1];
b1 = [1;4;-1];

n = size(A,1);
linhas = [1:n]; % Sequência de linhas usadas

for k = 1:n-1

	% Troca de linhas se baseando no maior valor absoluto
	maior = abs(A(linhas(k), k));
	pivo = k;
	for i = k+1:n
		if maior < abs(A(linhas(i), k))
			pivo = i;
			maior = abs(A(linhas(i), k));
		end
	end
	tmp = linhas(pivo);
	linhas(pivo) = linhas(k);
	linhas(k) = tmp;

	% Transformação para triangular inferior
	for i = k+1:n
		m = A(linhas(i), k) / A(linhas(k), k);
		for j = k:n
			A(linhas(i), j) = A(linhas(i), j) - m * A(linhas(k), j);
		end
		b(linhas(i)) = b(linhas(i)) - m * b(linhas(k));
	end
end

% Solucionando o sistema
x(n) = b(linhas(n))/A(linhas(n), n);
for i = n-1:-1:1
	soma = 0;
	for j = i+1:n
		soma = soma + A(linhas(i), j) * x(j);
	end
	x(i) = (b(linhas(i)) - soma)/A(linhas(i), i);
end

% Resultado das operações
A
b
% Solução
x
% Sequência final das linhas
linhas
% Erro relativo
r = abs(b1 - A1 * x')
