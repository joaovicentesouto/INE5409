a = [3; 1];
b = [-2; 2; 2];
c = [3; -2; -1; 5];
d = [2; 7; 5];
e = [1; 1];

f = [6; 3; 9; 6];
n = size(c, 1);

for i = 1:n-1

    k = b(i)/c(i);
    b(i) = b(i) - k * c(i);
    c(i+1) = c(i+1) - k * d(i);
    if i+1 < n
       d(i+1) = d(i+1) - k * e(i);
    end
    f(i+1) = f(i+1) - k * f(i);

    if i+2 <= n
        k = a(i)/c(i);
        a(i) = a(i) - k * c(i);
        b(i+1) = b(i+1) - k * c(i+1);
        c(i+2) = c(i+2) - k * d(i+1);
        if i+2 < n
           d(i+2) = d(i+1) - k * e(i+1);
        end
        f(i+1) = f(i+1) - k * f(i);
    end

end

% Falta fazer teste de mesa na solução e
% dar uma segunda olhada no algoritmo.

x(n) = f(n)/c(n);
x(n-1) = (f(n-1) - d(n-1)*x(n))/c(n-1);
for i = n-2:-1:1
    soma = 0;
    for j = 1:2
       soma = soma + d(i)*x(i+1) + e(i)*x(i+2);
    end
   x(i) = (f(i) - soma)/c(i);
end

a
b
c
d
e
f

x % ??????????????????
