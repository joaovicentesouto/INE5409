% Definição
f(x) = função que se deseja achar a raiz
intervalo = [a, b] tal que f(a)*f(b) < 0 % Contém, pelo menos, uma raiz.
reta r(x) = f(a) + ((fb - fa)/(b-a))*(x-a)

% Variáveis principais
a = a;
b = b;
xm = a - f(a)*(b-a)/(f(b) - f(a)); % Raiz da reta (a, f(a)), (b, f(b))

% Auxiliares, calcular f(x) toda hora custa muito.
fa = f(a);
fb = f(b);
fxm = f(xm);

erro = 10^-6; % Exemplo
count;

while abs(fxm) > erro

  xm = a - fa*(b-a)/(fb-fa);
  fxm = f(xm);

  if fa*fxm < 0
    % raiz => [a, xm]
    % Perturbação em f(a)
    pa = fb / (fb + fxm)
    fa = pa * fa;
    % Refinando intervalo
    b = xm;
    fb = fxm;
  else
    % raiz => [xm, b]
    % Perturbação em f(b)
    pb = fa / (fa + fxm)
    fb = pb * fb;
    % Refinando intervalo
    a = xm;
    fa = fxm
  end

  count = count + 1;
end
