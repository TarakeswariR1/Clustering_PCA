function [centroid,data_points] = kmean(X,k)

N=size(X, 1);
M=size(X, 2);
%initialize centriod with random numbers
centroid=rand(k, M);
Max_iteration=5;

for l=1:Max_iteration
    %For each data point the cluster that will be assigned is stored in
    %this variable
    cluster_assignement=zeros(N, k);
    for i=1:N
        %20 IS IDEL
        minimum_distance=15;
        centroid_assignment=-1;
        for j=1:k 
            %if the distances between the previous centroid and current
            %centroid doesnt change we assign a particular data point to
            %Jth cluster, or else we iterate more and find the closest
            %centroid for that data point.
               if norm(X(i)-centroid(j)) < minimum_distance 
                   %Using the K means objective to find the distance, here
                   %I used euclidean distances
                    minimum_distance = norm(X(i)-centroid(j)); 
                    centroid_assignment = j; 
               end
        end
        %We assign 1 if the particular data point belongs to jth cluster.
        %This is a membership matrix
        cluster_assignement(i,centroid_assignment) = 1;
    end
    %Given membership now calculate the centroid 
    for j=1:k
            centroid_mem1 = zeros(1,M);
            centroid_mem2= 0; 
            for i=1:N 
                %The membership function will multiple all the data points
                %where its 1
                centroid_mem1=centroid_mem1+cluster_assignement(i,j)*X(i); 
                centroid_mem2 = centroid_mem2 + cluster_assignement(i,j); 
            end
            centroid(j,:) = centroid_mem1/centroid_mem2; 
     end 
     data_points=cluster_assignement;
end

