function pushbutton4_Callback(hObject, eventdata, handles)
fsl_img=fsl(handles.fillimg);   %use Watershed
axes(handles.axes1);
imshow(fsl_img);
handles.fslimg = fsl_img;
guidata(hObject,handles)   %update GUI
