% --- Chromosome extraction
function pushbutton8_Callback(hObject, eventdata, handles)
Chromosome_right = 1;      %Perform chromosome statistics
B = handles.B;
N = handles.N;
L= handles.L;
img_group = handles.imggroup;
perimeter_group=handles.perimetergroup;
area_group = handles.areagroup;
for i=1:N
    image = img_group{i};
    [m,n,~] = size(image);
    % Extract red and green channels
    red_channel = image(:, :, 1);
    green_channel = image(:, :, 2);
    blue_channel = image(:,:,3);
    % Extracting red and green chromosomes using threshold segmentation
    red_threshold = 35;
    green_threshold = 35;
    blue_threshold = 150;
    red_mask=zeros(m,n);
    green_mask = zeros(m,n);
    for p=1:m
        for j=1:n
            if (red_channel(p,j) > red_threshold) & (blue_channel(p,j)<blue_threshold)
                red_mask(p,j) = red_channel(p,j);
            end
            if (green_channel(p,j) > green_threshold) & (blue_channel(p,j)<blue_threshold)
                green_mask(p,j)= green_channel(p,j);
            end
        end
    end
    % Morphological processing of red and green chromosome masks to remove noise and fill in areas
    red_mask = bwareaopen(red_mask, 3);
    red_mask = imfill(red_mask, 'holes');
    green_mask = bwareaopen(green_mask, 2);
    green_mask = imfill(green_mask, 'holes');
    % Mark and count red and green chromosomes
    labeled_red = bwlabel(red_mask,8);
    num_red_chromosomes =max(max(labeled_red));
    labeled_green = bwlabel(green_mask,8);
    num_green_chromosomes = max(max(labeled_green));
    %Result writing
    red_num(i) = num2str(num_red_chromosomes);
    green_num(i) = num2str(num_green_chromosomes);
end
handles.rednum = red_num;
handles.greennum = green_num;
handles.Chromosomeright = Chromosome_right;
checkbox5_Callback(hObject, eventdata, handles);
guidata(hObject,handles); 
