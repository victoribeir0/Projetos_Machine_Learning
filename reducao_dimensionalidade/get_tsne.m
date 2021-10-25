% t-SNE, gradiente descendente com momento:
% learn_rate = Taxa de importância para o gradiente.
% n_iter = Núm. iterações.    |    Dim = Dimensões a serem usadas. 
% dx = Matriz de distâncias (NxN).
% n_momento = Núm. de gradientes anteriores a serem usados no momento.

% X = Matriz com os vetores otimizados (NxDim).
% J = Função de custo.

function [X_final,J] = get_tsne(Dim, px)
lr = 2;  % learn_rate = Taxa de importância para o gradiente.
n_iter = 500; % Núm. de iterações.
n_momento = 10;

% Normalização, é importante, mas depende muito dos dados.
px = 1e-3*((px-min(px(:)))/(max(px(:))-min(px(:))));
px(px==0) = eps; % Evita que haja elementos com probabilidade zero.

N = size(px,1);      % Núm. de vetores.

% Inicialização aleatória da observação inicial.
X = 1e-3*randn(N,Dim);

m = 1;
s = 1:n_momento;
g = 1;
momento = zeros(N,Dim,n_momento+1);
tic;

qx = get_qx(X);  % Calcula o q(i,j).
qx(qx==0) = eps; % Evita que haja elementos com probabilidade zero.

for ite = 1:n_iter 
    X_final = X;
    
    for k = 1:N % Para todos os vetores.          
        d_prev = repmat(X(k,:),N,1) - X;
        d_prev = sqrt(diag(d_prev*d_prev')).^2;                
        mat_temp = repmat(X(k,:),N,1);
        grad = -lr*gradiente(mat_temp, X, px(k,:), qx(k,:), d_prev, k);                    
              
        momento(k,:,m) = X(k,:) + grad;
        
        if ite > n_momento
            m_coef = 0.99;                        
            for c = abs(-n_momento:-1)
                % Decaimento exponencial (os mais próximos tem pesos maiores).
                momento(k,:,c) = (1-m_coef)^s(g) * momento(k,:,c);
                g = g+1;
            end  
            g = 1;
            % Soma dos gradientes anteriores (em decaimento exponencial).
            m_sum = sum(momento(k,:,1:end-1),3);
            X(k,:) = X(k,:) + m_coef*grad + m_sum;            
        else
            X(k,:) = X(k,:) + grad;            
        end        
    end   
    
    m = m+1;
    
    if ~mod(ite,n_momento+1)
        m = 1;
    end
    
    qx = get_qx(X); % Calcula o q(i,j).
    qx(qx==0) = eps;
    
    % Calcula o custo em cada iteração.    
    J(ite) = sum(sum(px.*log(px./qx)));
    
    % Caso o custo atual seja menor que o anterior, atuliza o X_final.
    if ite > 1
        if abs(J(ite)) < abs(J(ite-1))
            X_final = X;
        end
    end
              
    % Testa se o custo está parado, se estiver, para o laço for.
    if ite > 2
        if J(ite) == J(ite-1) || abs(J(ite)) < 0.0001 || abs(J(ite)) > 2*abs(J(ite-1))
            break;
        end
    end
    
    clc;
    fprintf('Iteração: %d/%d', ite, n_iter);           
end

fprintf('\n');
toc;

% Plota a curva da derivada, normalizada entre 0 e 1.
J = abs(J);
plot(J/max(J),'b'); grid on; title('Custo'); xlabel('Iterações'); 
hold on;

qx = get_qx(X_final); % Calcula o q(i,j).
qx(qx==0) = eps;
c_f = sum(sum(px.*log(px./qx)));
plot(ite, abs(c_f)/max(J),'ro'); 
disp(abs(J(ite)/max(J)));

end

% Determnia o gradiente
% X, Y = Observações com n dimensões;
function res = gradiente(X, Y, px, qx, d_prev, k)
d_prev = (1+d_prev.^2).^-1;
d_prev(k) = 0;

a = X-Y;
b = (px-qx)';
b = b.*d_prev;
res = zeros(size(a,1),size(a,2));

for i = 1:size(a,2)
    res(:,i) = 4*(a(:,i).*b);
end

res = sum(res,1);
end

% Determina o denominador do q(i,j).
function res = get_dij(X)
N = size(X,1);
res = 0;

for i = 1:N  
    % Determina o denominador do q(i,j) para cada vetor X(i,:).
    mat_temp = repmat(X(i,:),N,1) - X;
    mat_temp = sqrt(diag(mat_temp*mat_temp'));
    mat_temp = (1+mat_temp.^2).^-1;
    mat_temp(i) = 0;
    res = res + sum(mat_temp);
end    
end

% Determina o q(i,j).
function qx = get_qx(X)
N = size(X,1);
p2 = get_dij(X);
qx = zeros(N);

for i = 1:N    
    % Determina o calculo do q(i,j) para cada vetor X(i,:).
    mat_temp = repmat(X(i,:),N,1) - X;
    mat_temp = sqrt(diag(mat_temp*mat_temp'));
    mat_temp = (1+mat_temp.^2).^-1;
    mat_temp(i) = 0;
    mat_temp = mat_temp./p2;
    qx(i,:) = mat_temp;    
end
end
