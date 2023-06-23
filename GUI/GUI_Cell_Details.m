%Display cell details in pages
function checkbox5_Callback(hObject, eventdata, handles)
check_station = get(hObject,'Value');   %Check when selected_ Station is 1
Chromosome_right = handles.Chromosomeright;
if check_station == 1
    set(handles.uipanel1, 'Visible', 'Off');
    set(handles.uipanel2, 'Visible', 'Off');
    set(handles.uipanel3, 'Visible', 'On');
    if handles.page==1
        set(handles.pushbutton13, 'Enable', 'off');
        axes(handles.axes1);
        imshow(handles.cenumimgwithbh);
    end
B = handles.B;
N = handles.N;
L= handles.L;
page=handles.page;
set(handles.text16,'String', page);        %Change the current page number
img_group = handles.imggroup;
perimeter_group=handles.perimetergroup;
area_group = handles.areagroup;
red_num=handles.rednum;
green_num=handles.greennum;
pagesum = ceil(N/8);                        %Calculate total pages
    if handles.page==pagesum
        set(handles.pushbutton12, 'Enable', 'off');
        axes(handles.axes1);
        imshow(handles.cenumimgwithbh);
    end
set(handles.text18,'String', num2str(pagesum));        %Change total pages
handles.pagesum = pagesum;  
%Clear the previous image and text information before each call
for i=2:9
    no_arr = 'NO. ';
    No_num =  ['text' num2str(20+(i-2))];
    set(handles.(No_num),'String', no_arr);        %update NO.
    zc_arr = '周长：暂未统计';
    set(handles.(['text' num2str(28+(i-2)*4)]),'String', zc_arr);    %Update Perimeter
    mj_arr = '面积：暂未统计';
    set(handles.(['text' num2str(29+(i-2)*4)]),'String', mj_arr);      %Update Area
    red_arr ='红染色体：暂未统计';
    set(handles.(['text' num2str(30+(i-2)*4)]),'String', red_arr);    %update number of red chromosomes
    green_arr ='绿染色体：暂未统计';
    set(handles.(['text' num2str(31+(i-2)*4)]),'String', green_arr);      %update number of green chromosomes
    axes_num = ['axes', num2str(i)];
    cla(handles.(axes_num));
end
%Paging display images
for i=8*(page-1)+1:min(N,8*page) 
        tmp=mod(i-8*(page-1),9);
        no_arr = ['NO. ', num2str(i)];
        No_num =  ['text' num2str(20+(tmp-1))];
        set(handles.(No_num),'String', no_arr);        %update NO.
        zc_arr = ['周长：', num2str(perimeter_group{i})];
        set(handles.(['text' num2str(28+(tmp-1)*4)]),'String', zc_arr);    %Update Perimeter
        mj_arr = ['面积：', num2str(area_group{i})];
        set(handles.(['text' num2str(29+(tmp-1)*4)]),'String', mj_arr);      %Update Area
        if Chromosome_right==1
            red_arr = ['红染色体：', num2str(red_num(i))];
            set(handles.(['text' num2str(30+(tmp-1)*4)]),'String', red_arr);    %update number of red chromosomes
            green_arr = ['绿染色体：', num2str(green_num(i))];
            set(handles.(['text' num2str(31+(tmp-1)*4)]),'String', green_arr);      %update number of green chromosomes
        end
        axes_num = ['axes', num2str(1+tmp)];
        axes(handles.(axes_num));
        imshow(img_group{i});    
end
axes(handles.axes1);
imshow(handles.cenumimgwithbh);
guidata(hObject,handles)   %update GUI
else
    handles.page=1;
    set(handles.uipanel1, 'Visible', 'On');
    set(handles.uipanel2, 'Visible', 'On');
    set(handles.uipanel3, 'Visible', 'Off');
    guidata(hObject,handles)  
end
