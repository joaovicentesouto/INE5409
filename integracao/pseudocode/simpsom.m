a = inicio do intervalo
b = fim do intervalo

n = quant. de subintervalos // tem que ser par
h = (b-a)/n

x = [a:h:b]
y = f(x)

soma_pares = 0
soma_impares = 0;
for i = 1 até (n/2)-1
  soma_pares = soma_pares + y(2*i)
  soma_impares = soma_impares + y(2*i + 1)
end
soma_pares = soma_pares + y(n)

% T = h/3 * (f(a) + 4*soma_pares + 2*soma_impares + f(b))
T = h/3 * (y(1) + 4*soma_pares + 2*soma_impares + y(n+1))
