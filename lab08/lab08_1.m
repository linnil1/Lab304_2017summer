function varargout = lab08_1(varargin)
% LAB08_1 MATLAB code for lab08_1.fig
%      LAB08_1, by itself, creates a new LAB08_1 or raises the existing
%      singleton*.
%
%      H = LAB08_1 returns the handle to a new LAB08_1 or the handle to
%      the existing singleton*.
%
%      LAB08_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB08_1.M with the given input arguments.
%
%      LAB08_1('Property','Value',...) creates a new LAB08_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab08_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab08_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab08_1

% Last Modified by GUIDE v2.5 18-Jul-2017 11:40:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab08_1_OpeningFcn, ...
                   'gui_OutputFcn',  @lab08_1_OutputFcn, ...
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


% --- Executes just before lab08_1 is made visible.
function lab08_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab08_1 (see VARARGIN)

% Choose default command line output for lab08_1
handles.output = hObject;
% handles = imgInit(handles, '02Lena.png');
disp(handles);
% Update handles structure
guidata(hObject, handles);
% UIWAIT makes lab08_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


function handles = imgInit(handles, filepath)
    handles.img = imread(filepath);
    handles.nowimg = handles.img;
    handles.imageSize.String = sprintf('%s\n%s', ...
        "Image Size:", num2str(size(handles.img)));
    imgDraw(handles);
    
    
function imgDraw(handles)
    imshow(handles.nowimg, 'Parent', handles.axes1);
    axes(handles.axes2);
    imhist(handles.nowimg);
 
 
% --- Outputs from this function are returned to the command line.
function varargout = lab08_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on slider movement.
function brightNum_Callback(hObject, eventdata, handles)
% hObject    handle to brightNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.nowimg = handles.img * get(hObject, 'Value');
imgDraw(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function brightNum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to brightNum (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' }, 'Select Image');

handles = imgInit(handles, [pathname filename]);
guidata(hObject, handles);