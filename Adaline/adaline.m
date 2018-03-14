clear all
close all
clc

x1 = [0.4329, 0.3024, 0.1349, 0.3374, 1.1434];
x2 = [-1.3719, 0.2286, -0.6445, -1.7163, -0.0485];
x3 = [0.7022, 0.8630, 1.0530, 0.3670, 0.6637];
x4 = [-0.8535, 2.7909, 0.5687, -0.6283, 1.2606];
xb = [1,1,1,1,1]; % bias
w = rand(1,4); % pesos dos x
b = rand(1); % peso do bias
p = 5; % qt de amostras
d = [1, -1, -1, -1, 1]; % o esperado para as amostras acima

% tx de aprendizado
tx = 0.0025;
%precisão
pr = 0.000001;
% nº de epocas
epoca = 0;
e = Inf;
u = zeros(1,p);
%Fase de treinamento

while (abs(e) > pr)
    
    e_ant = eqm(x1,x2,x3,x4,w,p,d,b);
    
    for i=1:p
        u(1,i) = w(1,1)*x1(1,i) + w(1,2)*x2(1,i) + w(1,3)*x3(1,i) + w(1,4)*x4(1,i) + b; % potencial de ativação
        w(1,1) = w(1,1) + (tx*(d(1,i) - u(1,i))*x1(1,i)); % ajuste do w1
        w(1,2) = w(1,2) + (tx*(d(1,i) - u(1,i))*x2(1,i)); % ajuste do w2
        w(1,3) = w(1,3) + (tx*(d(1,i) - u(1,i))*x3(1,i)); % ajuste do w3
        w(1,4) = w(1,4) + (tx*(d(1,i) - u(1,i))*x4(1,i)); % ajuste do w4
        b = b + (tx*(d(1,i) - u(1,i))*xb(1,i));      % ajuste do bias
    end
    epoca = epoca + 1;
    e_atual = eqm(x1,x2,x3,x4,w,p,d,b);
    
    e =  e_atual - e_ant;
    
end

% fase de operação 

for j=1:p
     u(1,j) = w(1,1)*x1(1,j) + w(1,2)*x2(1,j) + w(1,3)*x3(1,j) + w(1,4)*x4(1,j) + b;
     y(1,j) = sinal(u(1,j));
     
end
y
epoca


% % fase de operação 
% x11 = [1.3749, 0.7221, 0.4403, -0.5231];
% x22 = [-0.5071, -0.7587, -0.8072, 0.3548];
% x33 = [0.4464, 0.7681, 0.5154, 0.2538];
% x44 = [1.3009, -0.5592, -0.3129, 1.576];
% % valores esperados d = [1,1,1-1] 
% 
% for j=1:4
%      u(1,j) = w(1,1)*x11(1,j) + w(1,2)*x22(1,j) + w(1,3)*x33(1,j) + w(1,4)*x44(1,j) + b;
%      y(1,j) = sinal(u(1,j));
%      
% end





