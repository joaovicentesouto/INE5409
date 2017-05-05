function falsa_posicao_mod
clear
clc
format long
erro = 10^-6;
a = 0;
b = 1;

x=[a:0.1:b];
y=funcao(x);
plot(x,y);
grid
hold on

fa = funcao(a);
fb = funcao(b);
k=0;
fxm = 1;

ca = 0;
cb = 0;

while abs(fxm) > erro
    k = k+1;

    xm = a-(fa.*(b-a))/(fb-fa);  % metodo falsa posicao
    fxm = funcao(xm);

    r = fa + (fb-fa)/(b-a)*(x-a);

    plot(x, r, 'r')
    hold on
    pause

    if fa*fxm < 0
       b = xm;
       fb = fxm;

       pa = fb / (fb - fxm); % conferir se esta certo
       fa = fa*pa;

       cb = cb+1;
    else
       a = xm;
       fa = fxm;

       pb = fa / (fa - fxm);  % conferir se esta certo
       fb = fb*pb;

       ca = ca+1;
    end
end

xm
fxm
k
ca
cb


    function y=funcao(x)
        y=exp(x).*sin(x)-1;
    end

end
