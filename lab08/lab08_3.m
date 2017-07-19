function varargout = lab08_3(varargin)
% LAB08_3 MATLAB code for lab08_3.fig
%      LAB08_3, by itself, creates a new LAB08_3 or raises the existing
%      singleton*.
%
%      H = LAB08_3 returns the handle to a new LAB08_3 or the handle to
%      the existing singleton*.
%
%      LAB08_3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB08_3.M with the given input arguments.
%
%      LAB08_3('Property','Value',...) creates a new LAB08_3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab08_3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab08_3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab08_3

% Last Modified by GUIDE v2.5 20-Jul-2017 00:31:08

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab08_3_OpeningFcn, ...
                   'gui_OutputFcn',  @lab08_3_OutputFcn, ...
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

function img_path = getImage()
    [filename, pathname] = uigetfile({'*.jpg;*.tif;*.png;*.gif','All Image Files';...
          '*.*','All Files' }, 'Select Image');
    img_path = [pathname filename];

% --- Executes just before lab08_3 is made visible.
function lab08_3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab08_3 (see VARARGIN)

% Choose default command line output for lab08_3
handles.output = hObject;
handles.ang = 0;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lab08_3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab08_3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in imageLoad.
function imageLoad_Callback(hObject, eventdata, handles)
% hObject    handle to imageLoad (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.img = imread(getImage());
handles.imgrot = imgRot(handles.img, handles.ang);
imshow(handles.img,    'Parent', handles.axes1);
imshow(handles.imgrot, 'Parent', handles.axes2);
guidata(hObject, handles);

% --- Executes on button press in imageSave.
function imageSave_Callback(hObject, eventdata, handles)
% hObject    handle to imageSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uiputfile('rotated_image.jpg','Save file name');
img_path = [pathname filename];
imwrite(handles.imgrot, img_path);

function angleValue_Callback(hObject, eventdata, handles)
% hObject    handle to angleValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of angleValue as text
%        str2double(get(hObject,'String')) returns contents of angleValue as a double
handles.ang = str2double(get(hObject,'String'));
handles.imgrot = imgRot(handles.img, handles.ang);
imshow(handles.imgrot, 'Parent', handles.axes2);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function angleValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to angleValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
