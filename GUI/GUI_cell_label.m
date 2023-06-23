%Label contour images
function checkbox6_Callback(hObject, eventdata, handles)
%handles.numceimg=[];             Cell division without labels
%handles.B =[];     Contour return value
%handles.cenumimgwithbh =[];      Labeled cell division
check_station = get(hObject,'Value');   %Check when selected_ Station is 1
if check_station ==1
    B = handles.B;
    N = handles.N;
    %label
    for i=1:N
        med_row=floor(mean(B{i}(:,1)));
        med_col=floor(mean(B{i}(:,2)));
        text(med_col, med_row, num2str(i), 'Color', 'y');
    end
    axes(handles.axes1);
    frame = getframe(handles.axes1);  % Obtain the frame of the axes region
    imwrite(frame.cdata, 'cenumimg_withbh.png');
    handles.cenumimgwithbh = imread('cenumimg_withbh.png');
    guidata(hObject,handles)   %update GUI
    axes(handles.axes1);
    imshow(handles.cenumimgwithbh);
    %handles.numceimg = numce_img;
    guidata(hObject,handles)   %update GUI
end
