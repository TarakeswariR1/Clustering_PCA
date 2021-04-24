clear;
k=3;
%Generating random data using normal distribution
data1 = normrnd(0,0.5,[300, 3]); 
data2 = [data1; normrnd(1.5,0.5,[300, 3])];
data = [data2; normrnd(3,2.5,[300,3 ])];
figure;
scatter(data(:,1), data(:,2), "m");
title("Data generated randomly");
disp(size(data));
[centroid, data_points]=kmean(data, k);
labels=labels_name(data, data_points, k);
figure;
hold on;
gscatter(data(:,1), data(:,2), labels);
plot(centroid(:,1), centroid(:,2), "X");
title("K-means Clustering");
Y=spectral_relaxation(data,k);
disp(size(Y));
[centroid, data_points]=kmean(Y, k);
labels=labels_name(data, data_points, k);
figure;
hold on;
gscatter(data(:,1), data(:,2), labels);
plot(centroid(:,1), centroid(:,2), "X");
title("Spectrual relaxation K-means Clustering");

