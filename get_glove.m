% GloVe com gradiente descendente:
% Dim = Núm. de dimensões no vetor X.
% dx = Matriz de distâncias.

function X = get_glove(Dim, dx)
tic;
lr = 0.0001;  % learn_rate = Taxa de importância para o gradiente.
n_iter = 500; % Núm. de iterações.

dx = dx.*(1-eye(size(dx,1)))+eps; % Torna as diagnais iguais a zero (evita distância negativa).
dx = log(dx);
dx = dx.*(1-eye(size(dx,1)));

N = size(dx,1); % Núm. de símbolos.
X = randn(N,Dim); % Inicialização aleatória dos símbolos.

global delta;  % Define o delta para a diferença finita.
delta = 0.00001;
global max_dx; % Define o máximo da matriz de distâncias dx.
max_dx = max(dx(:));

for ite = 1:n_iter % Cada iteração.
    for k = 1:N    % Cada símbolo k.
        
        grad = -lr*gradiente(X(k,:), X, dx(k,:));                 
        X(k,:) = X(k,:) + grad;
    end
    
    % Calcula o custo em cada iteração.
    J_sum = 0;
    for k = 1:N        
        J_sum = J_sum + custo(X(k,:),X,dx(k,:));                
    end
    J(ite) = J_sum;
    
    % Caso não haja variação no custo, parar.
    if ite > 1
        if J(ite) == J(ite-1)
            break;
        end
    end
end

toc;
% Plota a curva da derivada, normalizada entre 0 e 1.
plot(J/max(J),'b'); grid on;
disp(J(end)/max(J));
end

% Função de custo, X = Observação com n dimensões.
% X = word vec 1, Y = word vec 2, X(end) = bias 1, Y(end) = bias 2.
% dx = ponto X(i,j).
function res = custo(X,Y,dx)
global max_dx; % Máximo de X(i,j).
a = (X*Y' - dx).^2;
b = (dx./max_dx).^(3/4); % Função de peso.
c = a.*b;
res = sum(c);
end

% Calcula o gradiente.
% X = word vec 1
% Y = word vec 2.
% dx = ponto X(i,j).
function res = gradiente(X, Y, dx)
global max_dx;
a = (X*Y' - dx);
b = (dx/max_dx).^(3/4);
c = a.*b;
d = zeros(size(Y,1),size(Y,2));

for i = 1:size(Y,2)
    d(:,i) = Y(:,i).*c';
end

res = sum(d,1);
end