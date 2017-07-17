function varargout = lab07_1(varargin)
% LAB07_1 MATLAB code for lab07_1.fig
%      LAB07_1, by itself, creates a new LAB07_1 or raises the existing
%      singleton*.
%
%      H = LAB07_1 returns the handle to a new LAB07_1 or the handle to
%      the existing singleton*.
%
%      LAB07_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in LAB07_1.M with the given input arguments.
%
%      LAB07_1('Property','Value',...) creates a new LAB07_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before lab07_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to lab07_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help lab07_1

% Last Modified by GUIDE v2.5 17-Jul-2017 19:42:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab07_1_OpeningFcn, ...
                   'gui_OutputFcn',  @lab07_1_OutputFcn, ...
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


% --- Executes just before lab07_1 is made visible.
function lab07_1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to lab07_1 (see VARARGIN)

% Choose default command line output for lab07_1
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes lab07_1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = lab07_1_OutputFcn(hObject, eventdata, handles) 
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
handles.feq1 = 2;
handles.feq2 = 7;
handles.amp1 = 1;
handles.amp2 = 1;
handles.isadd = false;
fDraw(handles);
guidata(hObject, handles);
% Hint: place code in OpeningFcn to populate axes1

function fDraw(handles)
    x = linspace(0, 2);
    plot(x, sin(x .* handles.feq1 .* pi) .* handles.amp1, 'r', ...
        'linewidth', 1, ...
        'DisplayName', ['sin(' num2str(handles.feq1) '\pix)']);
    hold on;
    plot(x, cos(x .* handles.feq2 .* pi) .* handles.amp2, 'g', ...
         'linewidth', 1, ...
         'DisplayName', ['cos(' num2str(handles.feq2) '\pix)']);  
    if handles.isadd
        plot(x, sin(x .* handles.feq1 .* pi) .* handles.amp1 + ...
                cos(x .* handles.feq2 .* pi) .* handles.amp2, ...
             'b', 'linewidth', 1, 'DisplayName', 'superposition');
    end
    hold off;
    legend('show');
    title('sin(x) and cos(x) with various frequencies');

    

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.feq1 = get(hObject, 'Value');
fDraw(handles);
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


% --- Executes on slider movement.
function f2slider_Callback(hObject, eventdata, handles)
% hObject    handle to f2slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.feq2 = get(hObject, 'Value');
fDraw(handles);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function f2slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f2slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
disp(hObject)
end

% --- Executes during object creation, after setting all properties.
function f1mintext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f1maxtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function f1maxtext_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f1maxtext (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function f1amp_Callback(hObject, eventdata, handles)
% hObject    handle to f1amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of f1amp as text
%        str2double(get(hObject,'String')) returns contents of f1amp as a double
handles.amp1 = str2double(get(hObject, 'String'));
fDraw(handles);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function f1amp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to f1amp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
handles.amp2 = str2double(get(hObject, 'String'));
fDraw(handles);
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in superpos_check.
function superpos_check_Callback(hObject, eventdata, handles)
% hObject    handle to superpos_check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of superpos_check
handles.isadd = get(hObject,'Value');
fDraw(handles);
guidata(hObject, handles);
