function [outputArg] = fsl(I)
D = -bwdist(~I);
mask = imextendedmin(D,2);
D2 = imimposemin(D,mask);
Ld2 = watershed(D2);        %watershed
I2 = I;
I2(Ld2 == 0) = 0;   %Split based on horizontal lines
outputArg = I2;
end
