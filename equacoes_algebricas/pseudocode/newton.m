% Definição
f(x) = função que se deseja achar a raiz
f'(x) e f''(x) => Derivadas continuas em [a, b]
f'(x) != 0

f(x) aproximadamente f(x") + f'(x")*(x-x") = 0
Logo => x = x" - f(x")/f'(x")

r(x) = f'(x0)*(x-x0) + f(x0); % Reta tangente ao ponto x

% Variáveis principais
x0 = 1 % Chute inicial o mais perto da raiz
xk;

erro = 10^-6; % Exemplo
count;

while abs(f(x0)) > erro

  xk = x0 - f(x0)/f'(x0);
  x0 = xk;

  count = count + 1;
end
