%A = [3 -1 -1; 1 3 1; 2 -2 4];
%b = [1; 5; 4];

A = [5 2 0; 2 4 -2; 1 3 4];
b = [2; 6; -1];

x1 = [0; 0; 0];
x2 = x1;

n = size(A,1);
erro = 1;
cont = 0;

while erro > 1e-16
    for i=1:n
        soma = 0;
        for j=1:n
           if i~=j
            soma = soma + A(i,j)*x1(j);
           end
        end
        x2(i)=(b(i) - soma)/A(i,i);
    end
cont = cont + 1;
erro = norm(abs(x1 - x2));
x1 = x2;
end
x1;
x2
cont
