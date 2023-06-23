%filtering
% ---Defined a button group with four radio buttons, buttons 1, 2, 3, and 4, to apply different filters
function uibuttongroup1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% Image preprocessing
% ---Set the Choice function in the selection box and click different radio buttons to get different responses
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%The above is the parameter description
current_obj = get(eventdata.NewValue,'Tag');  % Get the Tag of the currently selected button
axes(handles.axes1)                 % Determine the position of the image display: axes1
switch current_obj                  %Save results in lvbo_ In IMG
    case 'radiobutton1'             % median filtering
        lvbo_img=handles.imgdata;
        for i=1:3
            lvbo_img(:,:,i)=medlvbo(lvbo_img(:,:,i));
        end
    case 'radiobutton2'             % Mean filtering
        lvbo_img=handles.imgdata;
        for i=1:3
            lvbo_img(:,:,i)=avglvbo(lvbo_img(:,:,i));
        end
    case 'radiobutton3'             % Wiener filtering
        lvbo_img=handles.imgdata;
        for i=1:3
            lvbo_img(:,:,i)=wnlvbo(lvbo_img(:,:,i));
        end
    case 'radiobutton4'             % Sharpening filtering
        lvbo_img=handles.imgdata;
        for i=1:3
            lvbo_img(:,:,i)=rhlvbo(lvbo_img(:,:,i));
        end       
        
end
        imshow(lvbo_img);                %Display filtered images in axse1
        handles.lvboimg = lvbo_img;      %Synchronize to Global variable 
        guidata(hObject,handles)         %update GUI

function radiobutton1_Callback(hObject, eventdata, handles)
function radiobutton2_Callback(hObject, eventdata, handles)
function radiobutton3_Callback(hObject, eventdata, handles)
function radiobutton4_Callback(hObject, eventdata, handles)
