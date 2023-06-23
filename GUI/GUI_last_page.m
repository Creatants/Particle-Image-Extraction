function pushbutton13_Callback(hObject, eventdata, handles)
handles.page = handles.page-1;
set(handles.pushbutton12, 'Enable', 'on');
guidata(hObject,handles) 
axes(handles.axes1);
imshow(handles.cenumimgwithbh);
guidata(hObject,handles);
checkbox5_Callback(hObject, eventdata, handles);
