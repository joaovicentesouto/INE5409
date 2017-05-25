% Definição
f(x) = função que se deseja achar a raiz
Uso do cálculo da derivada numéricamente.

% Variáveis principais
x0 = 0; % chute inicial
x1 = 1; % Chute inicial

% Auxiliares, calcular f(x) toda hora custa muito.
f0 = f(x0);
f1 = f(x1);
xk;

erro = 10^-6; % Exemplo
count;

while abs(f1) > erro

  xk = x1 - f1*(x1-x0)/(f1-f0);
  x0 = x1;
  x1 = xk;

  f0 = f(x0); % valores mais atualizados
  f1 = f(x1); % valores mais atualizados

  count = count + 1;
end
