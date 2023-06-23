function pushbutton1_Callback(hObject, eventdata, handles)       %upload original imgdata
[imgfilename imgpathname] = uigetfile({'*.jpg;*.png;*.pgm;*bmp'}, 'Select a pending image');
axes(handles.axes1); % Determine the position of the image display ：axes1
if imgfilename      %Do you really choose
    %imgdata = imread(strcat(imgpathname,'\',imgfilename));
    imgdata = imread([imgpathname '\' imgfilename]);
    %image(handles.axes1,imgdata);       %Display on axes1 canvas
    imshow(imgdata);                     % If you use imshow, there won't be a coordinate axis   
    handles.imgfilename = imgfilename;   %Save the file name and data to the handles structure
    handles.imgdata = imgdata;
end
guidata(hObject,handles)   %Update GUI
