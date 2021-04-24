load("USPS.mat");
principle_component=[10,50, 100, 200, 256];
n=numel(principle_component);
disp(size(principle_component))
[coeff, PC]=Mypca(A);
err=zeros(1,4);
for i=1:size(principle_component, 2)
   p=principle_component(i);
   reconstructed_image =  A * coeff(:,1:p);
   xa=reconstructed_image * coeff(:,1:p)';
   diff = A - xa;
   err(i) = norm(diff,'fro')^2;
   img1 = reshape(xa(1,:), 16, 16);
   img2 = reshape(xa(2,:), 16, 16);
   subplot(2, n ,n+i);
   title("Recontructed images");
   imshow(img1');
   subplot(2, n, i);
   sgtitle('Reconstructed images with Principle Component 10, 50, 100, 200, 256'); 
   imshow(img2');
   disp("Reconstructed error")
   fprintf("%f %d\n",err(i), p);
   
end

figure;
plot(principle_component, err, 'm');
title("Reconstructed error");