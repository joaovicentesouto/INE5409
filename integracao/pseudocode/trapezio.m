a = inicio do intervalo
b = fim do intervalo

n = quant. de subintervalos
h = (b-a)/n

x = [a:h:b]
y = f(x)

soma = 0
for i = 2 até n
  soma = soma + y(i)
end

% T = h/2 * (f(a) + 2*soma(f(xm)) + f(b))
T = h/2 * (y(1) + 2*soma + y(n+1))
