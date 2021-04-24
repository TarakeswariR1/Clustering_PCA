function [labels] = labels_name(data, data_points, k)
%Class Assignment using the output of Kmeans
labels = zeros(size(data, 1),1);
 for i = 1:size(data, 1)
      for j = 1:k
         if (data_points(i,j) == 1)
                labels(i) = j;
         end
      end
 end
end

