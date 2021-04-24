function [transformed_data] = spectral_relaxation(X,k)
% transforms the input data matrix using SVD into a form that k-means 
% can more easily cluster

[U,S,V] = svd(X);
truncated_u=U(:,1:k);
truncated_v=V(1:k,:);
transformed_data= (X * truncated_v');
end