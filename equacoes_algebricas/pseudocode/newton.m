% Definição
f(x) = função que se deseja achar a raiz
f'(x) e f''(x) => Derivadas continuas em [a, b]
f'(x) ~= 0

f(x) aproximadamente f(x™) + f'(x™)*(x-x™) = 0
Logo => x = x™ - f(x™)/f'(x™)

r(x) = f'(x0)*(x-x0) + f(x0); % Reta tangente ao ponto x

% Variáveis principais
x = 1 % Chute inicial o mais perto da raiz

% Auxiliares, calcular f(x) toda hora custa muito.
fx = f(x);
df = f(x1);
xk;

erro = 10^-6; % Exemplo
count;

while abs(fx) > erro

  xk = x - fx/df;
  x = xk;

  fx = f(x);   % valores mais atualizados
  df = f'(x);  % valores mais atualizados

  count = count + 1;
end
