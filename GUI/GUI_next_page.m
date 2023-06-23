function pushbutton12_Callback(hObject, eventdata, handles)
handles.page = handles.page+1;
set(handles.pushbutton13, 'Enable', 'on');
guidata(hObject,handles)   %update GUI
axes(handles.axes1);
imshow(handles.cenumimgwithbh);
guidata(hObject,handles); 
checkbox5_Callback(hObject, eventdata, handles)
