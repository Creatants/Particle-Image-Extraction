function [lvboout_img] = rhlvbo(lvbo_img)
lvbo_img2=im2double(lvbo_img);
% Define Laplace Filter
laplacian_filter = [0 -1 0; -1 4 -1; 0 -1 0];
[m, n] = size(lvbo_img2);
% create result images
lvboout_img = zeros(m, n);
% Applying Laplace Filter
for i = 1 : m
    for j = 1: n
        if i==1 || j==1 || i==m ||j==n      %on the edge of
            lvboout_img(i,j) = lvbo_img2(i,j);
        else
            I = lvbo_img2(i-1 : i+1, j-1 :j+1);
            I2 = sum(sum(I.* laplacian_filter));
            lvboout_img(i, j) = I2;
        end
    end
end
% Enhanced image
lvboout_img = lvbo_img-uint8(lvboout_img);
end
