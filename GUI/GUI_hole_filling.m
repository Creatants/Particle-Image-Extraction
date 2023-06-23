function pushbutton3_Callback(hObject, eventdata, handles)
se=strel('disk',5);                      %Open operation
Spot_filled=imopen(handles.otsuimg,se);   %Precorrosion
fill_img=imdilate(Spot_filled, se);       %Reflation
imshow(fill_img);
handles.fillimg = fill_img;
guidata(hObject,handles)   %update GUI
