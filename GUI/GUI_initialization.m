function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 04-Jun-2023 16:48:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- GUI Initialization operation related
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)
% Choose default command line output for GUI
% Some Global variable stored inhandles
handles.output = hObject;
handles.imgfilename=[];
handles.imgdata=[];       %Original image
handles.imgoutput=[];
handles.lvboimg=[];
handles.otsuimg=[];
handles.fillimg=[];
handles.fslimg=[];
handles.station=0;       %Is manual segmentation selected
handles.ButtonDown=0;    %Mouse click
handles.pos1 = [];     
handles.pos=[];          %mouse position
handles.startpoint=[];
handles.endpoint=[];     %Starting point coordinates
handles.B = [];          %Contour return value
handles.L =[];           %Single cell region image return value
handles.N =[];           %Number of cells return value
handles.numceimg=[];     %Cell division without labels
handles.cenumimgwithbh =[]; %Labeled cell division
handles.imggroup=[];    %single cell
handles.perimetergroup=[]; %Cell circumference
handles.areagroup=[];     %cell area
handles.pagesum=[];          %Total number of pages per cell panel
handles.page=1;         %Which page is the single cell panel 
handles.Chromosomeright=0;  %When it is 0, chromosome statistics are not performed, and vice versa
handles.rednum=[];    %Number of red chromosomes
handles.greennum=[];     %Number of green chromosomes
%Panel initialization settings
set(handles.uipanel3, 'Visible', 'Off');
% Update handles structure  Update the GIU
guidata(hObject, handles);
% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);



% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
