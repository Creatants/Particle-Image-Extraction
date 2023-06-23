function [lvboout_img] = avglvbo(lvbo_img)
%（3*3）
[m,n,~] = size(lvbo_img);
lvboout_img=zeros(m,n);
med = zeros(1,9);
for i=1:m
    for j=1:n
        if i==1 || j==1 || i==m ||j==n      %on the edge of
            lvboout_img(i,j) = lvbo_img(i,j);
        else                                %not on the edge of
            med(1)=lvbo_img(i-1,j-1);    %upper left
            med(2)=lvbo_img(i-1,j);      %upper
            med(3)=lvbo_img(i-1,j+1);    %upper right
            med(4)=lvbo_img(i,j-1);      %left
            med(5)=lvbo_img(i,j);        %middle
            med(6)=lvbo_img(i,j+1);      %right
            med(7)=lvbo_img(i+1,j-1);    %lower left
            med(8)=lvbo_img(i+1,j);      %lower
            med(9)=lvbo_img(i+1,j+1);    %lower right
            lvboout_img(i,j) = mean(med);   %Averaging
        end
    end
end
end
