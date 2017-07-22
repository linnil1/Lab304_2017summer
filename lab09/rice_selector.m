function varargout = rice_selector(varargin)
% RICE_SELECTOR MATLAB code for rice_selector.fig
%      RICE_SELECTOR, by itself, creates a new RICE_SELECTOR or raises the existing
%      singleton*.
%
%      H = RICE_SELECTOR returns the handle to a new RICE_SELECTOR or the handle to
%      the existing singleton*.
%
%      RICE_SELECTOR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RICE_SELECTOR.M with the given input arguments.
%
%      RICE_SELECTOR('Property','Value',...) creates a new RICE_SELECTOR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before rice_selector_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to rice_selector_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help rice_selector

% Last Modified by GUIDE v2.5 23-Jul-2017 01:18:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @rice_selector_OpeningFcn, ...
                   'gui_OutputFcn',  @rice_selector_OutputFcn, ...
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
    
% copy from rice_cleaner.m
function rice_size = riceSelect(img, allrice)
    colorimg = repmat(img, 1, 1, 3);
    xy = round(ginput(1));
    if xy
        labelxy = allrice(xy(2), xy(1), :);
        ind = find(labelxy, 1);
        [x, y] = find(allrice(:,:,ind));
        colorind = sub2ind(size(colorimg), x, y, ones(length(x), 1));
        colorimg(colorind) = 255;
        colorimg(colorind + numel(img)) = 0;
        colorimg(colorind + numel(img) * 2) = 0;
        imshow(colorimg);
        title('Image');
        rice_size = sum(length(x));
    else
        rice_size = 0;
    end


% --- Executes just before rice_selector is made visible.
function rice_selector_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to rice_selector (see VARARGIN)

% Choose default command line output for rice_selector
handles.output = hObject;

[handles.img, handles.allrice, handles.area] = rice_cleaner('09rice.png');
riceInit(handles)
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes rice_selector wait for user response (see UIRESUME)
% uiwait(handles.figure1);

function riceInit(handles)
    axes(handles.axes1);
    imshow(handles.img);
    title('Image');
    axes(handles.axes2);
    histogram(handles.axes2, handles.area, 20);
    title('Grain Size Histogram');
    disp(handles);
    handles.ricestext.String = sprintf('Objects: %d\nAveraged area: %.2f', ...
                                       length(handles.area), mean(handles.area));


% --- Outputs from this function are returned to the command line.
function varargout = rice_selector_OutputFcn(hObject, eventdata, handles) 
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

[handles.img, handles.allrice, handles.area] = rice_cleaner(getImage());
riceInit(handles)
% Update handles structure
guidata(hObject, handles);

% --- Executes on button press in riceSelect.
function riceSelect_Callback(hObject, eventdata, handles)
% hObject    handle to riceSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
rice_size = riceSelect(handles.img, handles.allrice);
if rice_size ~= 0
    handles.ricetext.String = sprintf('Select Object Area: %d', rice_size);
else
    handles.ricetext.String = '';
end
