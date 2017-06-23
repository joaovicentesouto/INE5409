
format long
clc

a = 0;
b = 1;
n = 4; % particoes
h = (b-a)/n;

x = [a:h:b];
% f(x) = x^3
y = x.^3;

T = 0;
for i = 2:n
   T = T + y(i);
end

T = h/2 * (y(1) + y(n+1) + 2*T)

% Tn = h/2 * (f(a) + f(b) + 2 * somatorio[i=2:n](f(xi)))