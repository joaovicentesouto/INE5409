A = [1 -1 1; 2 3 -1; -3 1 1];
b = [1; 4; -1];
n = size(A,1);

x1 = [0; 0; 0];
x2 = x1;
erro = 1;
count = 0;

while (erro > 0.00001 && count < 10)

  for i = 1:n
    soma = 0;
    for j = 1:n
      if j ~= i
        soma = soma + A(i,j) * x1(j);
      end
    end
    x2(i) = (b(i) - soma)/A(i,i);
  end

  erro = abs(norm(x1-x2));
  x1 = x2;
  count = count + 1;

end

x2
b
count
