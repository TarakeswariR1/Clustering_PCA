function [coeff, PC] = Mypca(data)
[M,N] = size(data);
average = mean(data,1);
centered = data - repmat(average,3000,1);
[U,S, V] = svd(data);
coeff=V;
PC = (U * S);
end

