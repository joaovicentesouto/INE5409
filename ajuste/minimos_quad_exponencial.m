clear
clc
x = [0.2:0.1:0.8];
y = [3.16 2.38 1.75 1.34 1 0.74 0.56];
% func de base = e^(-0x) e e^(-1x) pq os pts s"ao decrescente
n = length(x);
m = 1; % grau

for i = 1:m+1
    for j = i:m+1
        a(i,j) = 0;
        for k = 1:n
            a(i,j) = a(i,j) + (exp(-(j-1)*x(k)) * exp(-(i-1)*x(k)));
        end
        a(j,i) = a(i,j);
    end
    
    b(i) = 0;
    for k = 1:n
       b(i) = b(i) + (y(k) * exp(-(i-1)*x(k))); 
    end
end

a
b
cond(a)
c = a\b'

for i = 1:n
   g(i) = 0;
   for k = 1:m+1
      g(i) = g(i) + c(k) * exp(-(k-1)*x(i));
   end
end
g


plot(x, y, '*');
hold on
plot(x, g, 'r');
