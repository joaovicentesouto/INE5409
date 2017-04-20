format long
clc
clear

%A = [3 -1 -1; 1 3 1; 2 -2 4];
%b = [1; 5; 4];

A = [3 4 3; 1 5 -1; 6 3 5];
b = [10; 7; 15];

x = [0; 0; 0];
previous = x;
n = size(A,1);
erro = 1;
diminuindo = erro+1;
cont = 0;

converge = 'Converge absolutamente.';
for i=1:n
    pivo = abs(A(i,i));
    soma = 0;
    for j=1:n
       if i~=j
        soma = soma + abs(A(i,j));
       end
    end
    if pivo < soma
      converge = 'Não converge absolutamente.';
    end
end
converge

w = 0.858
while erro > 1e-10 && erro < diminuindo
    previous = x;
    for i=1:n
        soma = 0;
        for j=1:n
           if i~=j
            soma = soma + A(i,j)*x(j);
           end
        end
        x(i) = (b(i) - soma)/A(i,i);

        x(i) = (1-w)*previous(i) + w*x(i);
    end
    cont = cont + 1;
    if erro == 1
      diminuindo = norm(previous - x)+1
    else
      diminuindo = erro
    end
    erro = norm(previous - x)
end
x
cont
