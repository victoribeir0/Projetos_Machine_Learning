% Multidimensional Scaling (MDS):
% Dim = Núm. de dimensões no vetor X.
% dx = Matriz de distâncias.

function X = get_mds_3(Dim, dx)
tic;
lr = 0.001;  % learn_rate = Taxa de importância para o gradiente.
n_iter = 200; % Núm. de iterações.

N = size(dx,1);
X = rand(N,Dim);       % Inicialização aleatória da observação inicial.
J_sum = 0;
d_prev = zeros(N,N);

for ite = 1:n_iter
    
    % Atualiza os vetores.
    for k = 1:N        
        mat_temp = repmat(X(k,:),N,1);
        X_n = -lr*gradiente(mat_temp, X, dx(k,:), k);        
        X(k,:) = X(k,:) + X_n;
    end
        
    % Calcula o custo.
    for k = 1:N        
        mat_temp = repmat(X(k,:),N,1);
        d_prev = (diag(sqrt((mat_temp-X)*(mat_temp-X)')) - dx(k,:)').^2;
        J_sum = J_sum + sum(d_prev);        
    end   
    
    J(ite) = J_sum;
    J_sum = 0;
        
    % Caso o gradiente não mude, para o laço.
    if ite > 1
        if J(ite) == J(ite-1) || J(ite) > J(ite-1)
            break;
        end
    end  
    
    clc
    fprintf('Iteração: %d/%d', ite, n_iter);
end

% Plota a curva da derivada, normalizada entre 0 e 1.
plot(J/max(J),'b'); grid on; title('Custo'); xlabel('Iterações'); 

fprintf('\n');
toc;
disp(J(end)/max(J));
end

% Gradiente, X1, X2 = Observações com n dimensões. delta = Intervalo para diferença finita.
function res = gradiente(X, Y, dx, k)
d_prev = sqrt((X-Y)*(X-Y)');
d_prev = diag(d_prev); % distâncias euclidianas de X(k,:) para todos os outros.
a = d_prev - dx';
b = X-Y;
c = zeros(size(X,1),size(X,2));

for i = 1:size(X,2)
    c(:,i) = 2*a.*(b(:,i)./d_prev);
end
c(k,:) = [];

res = sum(c,1);
end
