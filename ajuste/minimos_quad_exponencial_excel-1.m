clear
clc
x = [0.1 1.5 3.3 4.5 5];
y = [1.77 2.17 2.48 2.99 3.15];
% z = ln(y) e z = ln(a) + bx  => a*e^(bx) = y

z = log(y);
n = length(x);
m = 1; % grau

xmin = x(1);
xmax = x(n);
x_func = [xmin:0.1:xmax];
n_func = length(x_func);


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
t = exp(c(1))



% 
for i = 1:n_func
   g(i) = t*exp(c(2)*x_func(i)); 
end
g;


plot(x, y, '*');
hold on
plot(x_func, g, 'r');
