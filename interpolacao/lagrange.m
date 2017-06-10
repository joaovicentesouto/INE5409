clc
clear

x = [-1 0 2];
y = [4 1 -1];
n = length(x);


for k = 1:n
    xponto(k) = 0;
    
    for i = 1:n
        cima = 1;
        baixo = 1;
       for j = 1:n
           if i ~= j
               cima = cima * (x(k)-x(j));
               baixo = baixo * (x(i) - x(j));
           end
       end
       L(i) = cima/baixo;
       xponto(k) = xponto(k) + y(i)*L(i);
    end
    
end
xponto

x1 = [-1:0.1:6];
n1 = length(x1)

for k = 1:n1
    p(k) = 0;
    
    for i = 1:n
        cima = 1;
        baixo = 1;
       for j = 1:n
           if i ~= j
               cima = cima * (x1(k)-x(j));
               baixo = baixo * (x(i) - x(j));
           end
       end
       L(i) = cima/baixo;
       p(k) = p(k) + y(i)*L(i);
    end
end

plot(x,y,'o')
hold on
plot(x1,p,'r')