% Cell feature extraction (average circumference, area)
function pushbutton7_Callback(hObject, eventdata, handles)
%handles.imggroup=[];     single cell
%handles.perimetergroup=[];  Cell circumference
%handles.areagroup=[];       cell area
B = handles.B;
N = handles.N;
L= handles.L;
img_group = handles.imggroup;
perimeter_group=handles.perimetergroup;
area_group = handles.areagroup;
sum_area=0;
sum_perimeter = 0;
%Obtain individual cells
for i=1:N
    %Center point
    med_row=floor(mean(B{i}(:,1)));
    med_col=floor(mean(B{i}(:,2)));
    %Extracting images of individual cells
    item_img=handles.imgdata(med_row - 45:med_row +44,med_col - 45:med_col + 44,:);
    item_img_index=L(med_row - 45:med_row +44,med_col - 45:med_col + 44,:);
    index=find(item_img_index~=i);
    r=item_img(:,:,1);
    g=item_img(:,:,2);
    b=item_img(:,:,3);
    r(index)=255;
    g(index)=255;
    b(index)=255;
    item_img=cat(3,r,g,b);
    img_group{i}=item_img;
    %Perimeter of each cell
    item_perimeter=size(B{i},1);
    perimeter_group{i}=item_perimeter;
    sum_perimeter = sum_perimeter+item_perimeter;
    %Area per cell
    item_area=length(find(L==i));
    area_group{i}=item_area;
    sum_area = sum_area+item_area;
end
ave_perimeter = sum_perimeter/N;
ave_area = sum_area/N;
set(handles.edit2,'string',ave_perimeter);          %Write the average circumference back to edit2
set(handles.edit3,'string',ave_area);          %Write the average area back to edit3
handles.imggroup=img_group;  
handles.perimetergroup=perimeter_group;
handles.areagroup=area_group;
guidata(hObject,handles)   %update GUI
