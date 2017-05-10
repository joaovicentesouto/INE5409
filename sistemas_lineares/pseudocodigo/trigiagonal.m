Diagonais guardadas em 3 vetores + a o vetor b
Zera-se o vetor abaixo de r e resolve o sistema:

Matriz n x n
Logo:
r = vetor 1 x n
d = vetor 1 x n-1 superior a r
t = vetor 1 x n-1 inferior a r

for i = 1 até n-1
  escalar = t(i)/r(i);
  r(i+1) = r(i+1) - escalar * d(i);
  b(i+1) = b(i+1) - escalar * b(i);
end

x(n) = b(n)/r(n);
for i = n-1:-1:1
  x(i) = (b(i) - d(i)*x(i+1)) / r(i);
end
