function pushbutton2_Callback(hObject, eventdata, handles)
otsu_yuan=handles.lvboimg(:,:,3);
otsu_gray=im2double(otsu_yuan);
otsu_img=OTSU(otsu_gray);
axes(handles.axes1);
imshow(otsu_img);
handles.otsuimg = otsu_img;
guidata(hObject,handles)   %Update GUI
