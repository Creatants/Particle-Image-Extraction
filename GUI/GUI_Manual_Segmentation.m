%Manual segmentation

function togglebutton1_Callback(hObject, eventdata, handles)    %Switch button
handles.station =1;
handles.station = get(handles.togglebutton1,'Value');   %when begin,handles.station is 1
guidata(hObject,handles);


% ---Mouse click response on axes1
function figure1_WindowButtonDownFcn(hObject, eventdata, handles)
handles.ButtonDown = 1;
guidata(hObject,handles)   


% --- Mouse movement response on axes1
function figure1_WindowButtonMotionFcn(hObject, eventdata, handles)
if handles.ButtonDown == 1 && handles.station == 1
   handles.pos1 = get(handles.axes1,'CurrentPoint');
   pos = handles.pos1(1,1:2);
   row=floor(pos(2));
   col=floor(pos(1));
   handles.fslimg(row+1,col) = 0;
   handles.fslimg(row,col+1) = 0;
   handles.fslimg(row-1,col) = 0;
   handles.fslimg(row,col-1) = 0;
   handles.fslimg(row+1,col+1) = 0;
   handles.fslimg(row-1,col+1) = 0;
   handles.fslimg(row-1,col-1) = 0;
   handles.fslimg(row+1,col-1) = 0;
   handles.fslimg(row,col) = 0;
   guidata(hObject,handles)  
end


% ---Mouse release response on axes1
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
handles.ButtonDown = 0;
handles.pos1 = [];  %Reset Coordinates
guidata(hObject,handles)  
%Automatically perform watershed operations
handles.fslimg = fsl(handles.fslimg);
if handles.station == 1 && handles.ButtonDown == 1
cla;
end
axes(handles.axes1);
imshow(handles.fslimg);
