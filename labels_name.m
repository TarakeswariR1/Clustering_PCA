function [labels] = labels_name(data, data_points, k)
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here
labels = zeros(size(data, 1),1);
 for i = 1:size(data, 1)
      for j = 1:k
         if (data_points(i,j) == 1)
                labels(i) = j;
         end
      end
 end
end

