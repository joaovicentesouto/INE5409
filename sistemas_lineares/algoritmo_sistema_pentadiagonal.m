e = [3];
d = [2; -1];
c = [4; -4; 4];
b = [2; 1];
a = [-1];

f = [7; 1; -5];
n = size(c, 1);

for i = 1:n-1

    escalar = b(i)/c(i);
    b(i) = b(i) - escalar * c(i);
    c(i+1) = c(i+1) - escalar * d(i);
    if i < n-1
       d(i+1) = d(i+1) - escalar * e(i);
    end
    f(i+1) = f(i+1) - escalar * f(i);

    if i < n-1
        escalar = a(i)/c(i);
        a(i) = a(i) - escalar * c(i);
        b(i+1) = b(i+1) - escalar * d(i);
        c(i+2) = c(i+2) - escalar * e(i);
        f(i+2) = f(i+2) - escalar * f(i);
    end

end

% Falta fazer teste de mesa na solução e
% dar uma segunda olhada no algoritmo.

x(n) = f(n)/c(n);
x(n-1) = (f(n-1) - d(n-1)*x(n))/c(n-1);
for i = n-2:-1:1
  soma = d(i)*x(i+1) + e(i)*x(i+2);
  x(i) = (f(i) - soma)/c(i);
end

a
b
c
d
e
f

x
