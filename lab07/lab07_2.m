function varargout = lab07_2(varargin)
% LAB07_2 MATLAB code for lab07_2.fig
%      LAB07_2, by itself, creates a new LAB07_2 or raises the existing
%      singleton*.
%
%      H = LAB07_2 returns the handle to a new LAB07_2 or the handle to
%      the existing singleton*.
%
%      LAB07_2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB07_2.M with the given input arguments.
%
%      LAB07_2('Property','Value',...) creates a new LAB07_2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab07_2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab07_2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab07_2

% Last Modified by GUIDE v2.5 17-Jul-2017 22:36:56

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab07_2_OpeningFcn, ...
                   'gui_OutputFcn',  @lab07_2_OutputFcn, ...
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


% --- Executes just before lab07_2 is made visible.
function lab07_2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab07_2 (see VARARGIN)

% Choose default command line output for lab07_2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lab07_2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab07_2_OutputFcn(hObject, eventdata, handles) 
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
handles.m = 1;
handles.n = 1;
handles.yAt = 0; 
handles.yValueAtx = 0; 
handles.xFrom = 0;
handles.xTo = 10;

ansDraw(handles);
guidata(hObject, handles);


function ansDraw(handles)
    disp(handles);
    syms x y(x);
    symans = dsolve(diff(y, x) + handles.m * y - handles.n, ...
        y(handles.yAt) == handles.yValueAtx);
    fplot(symans, [handles.xFrom handles.xTo]);
    title('$${dy \over dx} + my = n$$', 'Interpreter', 'latex');


function mValue_Callback(hObject, eventdata, handles)
% hObject    handle to mValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mValue as text
%        str2double(get(hObject,'String')) returns contents of mValue as a double
handles.m = str2double(get(hObject, 'String'));
ansDraw(handles);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function mValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function nValue_Callback(hObject, eventdata, handles)
% hObject    handle to nValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nValue as text
%        str2double(get(hObject,'String')) returns contents of nValue as a double
handles.n = str2double(get(hObject, 'String'));
ansDraw(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function nValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yAtx_Callback(hObject, eventdata, handles)
% hObject    handle to yAtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yAtx as text
%        str2double(get(hObject,'String')) returns contents of yAtx as a double
handles.yAt = str2double(get(hObject, 'String'));
ansDraw(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function yAtx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yAtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yValueAtx_Callback(hObject, eventdata, handles)
% hObject    handle to yValueAtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of yValueAtx as text
%        str2double(get(hObject,'String')) returns contents of yValueAtx as a double
handles.yValueAtx = str2double(get(hObject, 'String'));
ansDraw(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function yValueAtx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yValueAtx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xmin_Callback(hObject, eventdata, handles)
% hObject    handle to xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xmin as text
%        str2double(get(hObject,'String')) returns contents of xmin as a double
handles.xFrom = str2double(get(hObject, 'String'));
ansDraw(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function xmin_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xmin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xMax_Callback(hObject, eventdata, handles)
% hObject    handle to xMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xMax as text
%        str2double(get(hObject,'String')) returns contents of xMax as a double
handles.xTo = str2double(get(hObject, 'String'));
ansDraw(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function xMax_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xMax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
