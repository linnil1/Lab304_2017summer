function varargout = lab08_2(varargin)
% LAB08_2 MATLAB code for lab08_2.fig
%      LAB08_2, by itself, creates a new LAB08_2 or raises the existing
%      singleton*.
%
%      H = LAB08_2 returns the handle to a new LAB08_2 or the handle to
%      the existing singleton*.
%
%      LAB08_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB08_2.M with the given input arguments.
%
%      LAB08_2('Property','Value',...) creates a new LAB08_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab08_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab08_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab08_2

% Last Modified by GUIDE v2.5 18-Jul-2017 12:19:29

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab08_2_OpeningFcn, ...
                   'gui_OutputFcn',  @lab08_2_OutputFcn, ...
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
    

function imgDraw(handles)
    imshow(handles.img1, 'Parent', handles.axes1);
    imshow(handles.img2, 'Parent', handles.axes2);
    if ~isempty(handles.img1) && ~isempty(handles.img2)
        handles.img3 = imlincomb(1 - handles.lin, handles.img1, handles.lin, handles.img2);
        imshow(handles.img3, 'Parent', handles.axes3);
    end


% --- Executes just before lab08_2 is made visible.
function lab08_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab08_2 (see VARARGIN)

% Choose default command line output for lab08_2
handles.output = hObject;

handles.img1 = [];% imread('cameraman.tif');
handles.img2 = [];% imread('rice.png');
handles.lin = .5;
imgDraw(handles);

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lab08_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab08_2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in img1Load.
function img1Load_Callback(hObject, eventdata, handles)
% hObject    handle to img1Load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.img1 = imresize(imread(getImage()), [500 500]);
imgDraw(handles);
guidata(hObject, handles);


% --- Executes on button press in img2Load.
function img2Load_Callback(hObject, eventdata, handles)
% hObject    handle to img2Load (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.img2 = imresize(imread(getImage()), [500 500])
imgDraw(handles);
guidata(hObject, handles);


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.lin = get(hObject,'Value');
handles.img3 = imlincomb(1 - handles.lin, handles.img1, handles.lin, handles.img2);
imshow(handles.img3, 'Parent', handles.axes3);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
