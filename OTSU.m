function [binary_image] = OTSU(otsu_gray)
% Calculate grayscale histogram
counts = imhist(otsu_gray);
[m,n,~]=size(otsu_gray);
sum_xs = m*n;  
% Initialize inter class variance
I = zeros(256, 1);
for t = 1:256
    % Calculate the probability and average grayscale of the foreground
    P1 = sum(counts(t+1:256)) / sum_xs;
    avg1 = sum((t:255)' .* counts(t+1:256)) / sum(counts(t+1:256));
    % Calculate the probability and average grayscale of the background
    P2 = sum(counts(1:t)) / sum_xs;
    avg2 = sum((0:t-1)' .* counts(1:t)) / sum(counts(1:t)); %Sum of grayscale values x frequency/total frequency
    % Calculate inter class variance
    I(t) = P1 * P2 * (avg2 - avg1)^2;
end
% Select the threshold to maximize inter class variance
[~,threshold] = max(I);
disp(threshold);
% Perform image segmentation
binary_image = double(imbinarize(otsu_gray,threshold/256));
end
