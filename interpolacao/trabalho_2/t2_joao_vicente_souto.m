% Aluno: João Vicente Souto
% Matrícula: 16105151

% Obs.: Foi colocado pause após cada método para poder ver
% o gráfico e notar que todos geram o mesmo polinomio.

% Pontos e F(x)
x = [55 70 85 100 120 140];
y = [14.08 13.56 13.28 12.27 11.30 10.4];
n = length(x);
xmin = x(1);
xmax = x(n);

% Pontos dados
plot(x,y, 'o');
hold on
pause

x_intervalo = [xmin:1:xmax];
n_intervalo = length(x_intervalo);

% Questão 1:
% Encontrado os coeficientes na mão, resultado com arrendamento:
% coef_mao = [-161.1057 10.807 -0.2584 0.003 -1.6805*10^(-5) 3.66*10^(-8)];
% Matriz das equações P(x) = a0x^0 + a1x^1 + ... + a(n-1)x^(n-1)
for i = 1:n
   for j = 1:n
      A(i,j) = x(i)^(j-1);
   end
end

% Solução do sistema
coef_sistema = A\y';

for i = 1:n_intervalo
    y_sistema(i) = 0;
    for j = 1:n
        y_sistema(i) = y_sistema(i) + coef_sistema(j) * x_intervalo(i)^(j-1);
    end
end

plot(x_intervalo, y_sistema, 'b');
hold on
pause
% FIM 1

% Questão 2: Lagrange
for k = 1:n_intervalo
    y_lagrange(k) = 0;
    for i = 1:n
        cima = 1;
        baixo = 1;
       for j = 1:n
           if i ~= j
               cima = cima * (x_intervalo(k)-x(j));
               baixo = baixo * (x(i) - x(j));
           end
       end
       L(i) = cima/baixo;
       y_lagrange(k) = y_lagrange(k) + y(i)*L(i);
    end
end

plot(x_intervalo, y_lagrange, 'c--');
hold on
pause
% Fim 2

% Questão 3: Diferenças de Newton
A_newton(:, 1) = y; % Primeira coluna igual a y
for j = 2:n
   for i = j:n
       A_newton(i,j) = (A_newton(i,j-1) - A_newton(i-1,j-1)) / (x(i) - x(i-j+1));
   end
end

for k = 1:n_intervalo
    y_newton(k) = A_newton(1,1);
    for i = 2:n
       mult = A_newton(i,i);
       for j = 1:i-1
         mult = mult * (x_intervalo(k) - x(j));
       end
       y_newton(k) = y_newton(k) + mult;
    end
end

plot(x_intervalo, y_newton, 'r:');
hold on
pause
% Fim 3

% Questão 4: Spline do matlab
spl = spline(x, y, x_intervalo);
plot(x_intervalo, spl, '-.')
hold on
pause
% Fim 4

% Questão 5: Comparar os resultados
% Todos os métodos, menos o spline, chegam no mesmo polinomio de grau 6,
% porque ele é único. Já a função spline é gerado um polinomio de grau 3,
% resultando num gráfico um pouco diferente.
% Film 5

% Questão 6:
sistema_105 = 0;
for j = 1:n
    sistema_105 = sistema_105 + coef_sistema(j) * 105^(j-1);
end

lagrange_105 = 0;
for i = 1:n
    cima = 1;
    baixo = 1;
   for j = 1:n
       if i ~= j
           cima = cima * (105-x(j));
           baixo = baixo * (x(i) - x(j));
       end
   end
   L(i) = cima/baixo;
   lagrange_105 = lagrange_105 + y(i)*L(i);
end

newton_105 = A_newton(1,1);
for i = 2:n
   mult = A_newton(i,i);
   for j = 1:i-1
     mult = mult * (105 - x(j));
   end
   newton_105 = newton_105 + mult;
end

spline_105 = spl = spline(x, y, 105);

plot(105, sistema_105, 'c^')
plot(105, lagrange_105, 'mo')
plot(105, newton_105, 'k+')
plot(105, spline_105, 'kx')
hold on
% Todos, menos o spline, geram o mesmo resultado.
pause
