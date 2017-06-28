clear
clc
x = [0.2:0.1:0.8];
y = [3.16 2.38 1.75 1.34 1 0.74 0.56];
% z = a + bx => xe^(bx)

z = log(y);

n = length(x);
m = 1; % grau

for i = 1:m+1
    for j = i:m+1
        a(i,j) = 0;
        for k = 1:n
            a(i,j) = a(i,j) + (x(k)^(j-1) * x(k)^(i-1));
        end
        a(j,i) = a(i,j);
    end
    
    b(i) = 0;
    for k = 1:n
       b(i) = b(i) + (z(k) * x(k)^(i-1)); 
    end
end

a
b
c = a\b'
% tem que achar o a que eh o log de alguma coisa
t = exp(b(1))



% tem que alterar pra printar o grafico
for i = 1:n
   g(i) = 0;
   for k = 1:m+1
      g(i) = g(i) + c(k) * x(i)^(k-1);
   end
end
g


plot(x, y, '*');
hold on
plot(x, g, 'r');
