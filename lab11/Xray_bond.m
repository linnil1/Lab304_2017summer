function varargout = Xray_bond(varargin)
% XRAY_BOND MATLAB code for Xray_bond.fig
%      XRAY_BOND, by itself, creates a new XRAY_BOND or raises the existing
%      singleton*.
%
%      H = XRAY_BOND returns the handle to a new XRAY_BOND or the handle to
%      the existing singleton*.
%
%      XRAY_BOND('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in XRAY_BOND.M with the given input arguments.
%
%      XRAY_BOND('Property','Value',...) creates a new XRAY_BOND or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Xray_bond_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Xray_bond_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Xray_bond

% Last Modified by GUIDE v2.5 30-Jul-2017 13:13:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Xray_bond_OpeningFcn, ...
                   'gui_OutputFcn',  @Xray_bond_OutputFcn, ...
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


% --- Executes just before Xray_bond is made visible.
function Xray_bond_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Xray_bond (see VARARGIN)

% Choose default command line output for Xray_bond
handles.output = hObject;

imgs = enhancement_techniques();
for i = 1:8
    axes(handles.(['axes' num2str(i)]));
    imshow(imgs(:, :, i));
    if i ~= 1
        title(['(' char('a' + i - 2) ')']);
    else
        title('Original image');
    end
end
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Xray_bond wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Xray_bond_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
