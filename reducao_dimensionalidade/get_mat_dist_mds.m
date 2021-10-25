function D = get_mat_dist_mds(X)
tic;

[N,Dim] = size(X);
if Dim > N
   X = X'; 
   [N,~] = size(X);
end
D = zeros(N,N);

for i = 1:N
    mat_temp = repmat(X(i,:),N,1) - X;
    mat_temp = sqrt(diag(mat_temp*mat_temp'));   
    D(i,:) = mat_temp;    
end
imagesc(D);
toc;
end
