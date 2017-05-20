% Definição
f(x) = função que se deseja achar a raiz
intervalo = [a, b] / f(a)*f(b) < 0 % Contém, pelo menos, uma raiz.

% Variáveis principais
a = a;
b = b;
xm = (a+b)/2; % Ponto médio

% Auxiliares, calcular f(x) toda hora custa muito.
fa = f(a);
fb = f(b);
fxm = f(xm);

erro = 10^-6; % Exemplo
count = 0;

while abs(fxm) > erro

  xm = (a+b)/2;
  fxm = f(xm);

  if fa*fxm < 0
    % raiz => [a, xm] => Refinando intervalo
    b = xm;
    fb = fxm; % Desnecessário
  else
    % raiz => [xm, b] => Refinando intervalo
    a = xm;
    fa = fxm;
  end

  count = count+1;
end

xm = raiz aproximada de f(x) / f(xm) = 0.0...0...
