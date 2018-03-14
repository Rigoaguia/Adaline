
% Função: Erro quadrado médio

function [e] = eqm(x1,x2,x3,x4,w,p,d,b)

e = 0;
u = zeros(1,p);

for i=1:p
    u(1,i) = w(1,1)*x1(1,i) + w(1,2)*x2(1,i) + w(1,3)*x3(1,i) + w(1,4)*x4(1,i) + b;
    e = e + (d(1,i) - u(1,i))^2;   
end

e = e/p;

end



