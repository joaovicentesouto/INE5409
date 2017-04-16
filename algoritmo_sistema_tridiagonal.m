% Exemplo: |r1 d1  0|   |b1|
%          |t1 r2 d2| = |b2|
%          | 0 t3 r3|   |b3|
% Zera a diagonal t(i) e resolve o sistema.

d = [-1; -1; 1; 1];
r = [1; 1; -1; 1; 2];
t = [1; 1; -1; -1];
b = [0; 1; 2; -1; -2];
n = size(r,1);

for i = 1:n-1
  k = t(i)/r(i);
  %t(i) = t(i) - k * r(i);  Não é preciso zerar realmente, economizando operações.
  r(i+1) = r(i+1) - k * d(i);
  b(i+1) = b(i+1) - k * b(i);
end

x(n) = b(n)/r(n);
for i = n-1:-1:1
  x(i) = (b(i) - d(i)*x(i+1))/r(i);
end

x

% solucao = [5 5 9 6 2]
