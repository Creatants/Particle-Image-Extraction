%handles.numceimg=[];             Cell division without labels
%handles.img_group=[];            single cell
%handles.perimeter_group=[];      Cell circumference
%handles.area_group=[];           cell area
function pushbutton5_Callback(hObject, eventdata, handles)
ezt = handles.fslimg;               %Store the preprocessed binary graph in the temporary variable ezt
[~,L,N]=bwboundaries(ezt,'noholes');       %Using four connected region algorithm technology to obtain boundaries, individual cell images, and total numbers respectively
[m,n,~]=size(handles.imgdata);
numceimg_bd = zeros(m,n);            %Edge Only
numceimg = handles.imgdata;            %Original image with edges
for i=1:N
    %Use any to determine if the four borders have element values (element values range from 1 to N based on the connected area) that are not 0 (i.e. white)
    if any(L(1,:)==i)|| any(L(m,:)==i)||any(L(:,1)==i)|| any(L(:,n)==i)
        ezt(L==i) = 0;       %Remove this section of incomplete cells from the binary graph
    end
end
% Obtain complete cell boundaries, individual images, and return values
[B,L,N]=bwboundaries(ezt,'noholes');      
set(handles.edit1,'string',N);          %Write the total back to edit1
 %Extracting Edges
for i=1:N
    for j=1:size(B{i},1)
            numceimg_bd(B{i}(j,1),B{i}(j,2))=1;
            numceimg(B{i}(j,1),B{i}(j,2),1) = 255;
            numceimg(B{i}(j,1),B{i}(j,2),2) = 255;
            numceimg(B{i}(j,1),B{i}(j,2),3) = 0;
    end  
end
axes(handles.axes1);
imshow(numceimg);
handles.B =B;
handles.L =L;
handles.N =N;
handles.numceimg = numceimg;
guidata(hObject,handles)   %update GUI
