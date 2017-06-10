clc
clear
format long

x = [-1 0 2];
y = [4 1 -1];
n = length(x);
xmin = -1;
xmax = 2;

% matriz de x's
for i = 1:n
   for j = 1:n
      A(i,j) = x(i)^(j-1); 
   end
end

A
y

% cx^0 + bx^1 + ax^2 = y
c = A\y'

x1 = [xmin:0.1:xmax]
n1 = length(x1);
% Achando o valor do polinomio nos pontos
for i = 1:n1
    p(i) = 0;
    for j = 1:n
        p(i) = p(i) + c(j)*x1(i)^(j-1);
    end
end
p

plot(x,y, 'o')
hold on
plot(x1,p, 'r')
