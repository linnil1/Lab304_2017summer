function varargout = FishCut_GUI(varargin)
% FISHCUT_GUI MATLAB code for FishCut_GUI.fig
%      FISHCUT_GUI, by itself, creates a new FISHCUT_GUI or raises the existing
%      singleton*.
%
%      H = FISHCUT_GUI returns the handle to a new FISHCUT_GUI or the handle to
%      the existing singleton*.
%
%      FISHCUT_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FISHCUT_GUI.M with the given input arguments.
%
%      FISHCUT_GUI('Property','Value',...) creates a new FISHCUT_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before FishCut_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to FishCut_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help FishCut_GUI

% Last Modified by GUIDE v2.5 16-Aug-2017 14:17:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @FishCut_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @FishCut_GUI_OutputFcn, ...
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


% --- Executes just before FishCut_GUI is made visible.
function FishCut_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to FishCut_GUI (see VARARGIN)

% Choose default command line output for FishCut_GUI
handles.output = hObject;
handles.step = 0;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes FishCut_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = FishCut_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider_now_Callback(hObject, eventdata, handles)
% hObject    handle to slider_now (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
showAll(handles)
handles.size = get(hObject,'Value');
handles.pos = pointModify(handles.pos, handles.size, handles.img_size);
pointDraw(handles.pos, handles.size);
guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function slider_now_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider_now (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pos_now.
function pos_now_Callback(hObject, eventdata, handles)
% hObject    handle to pos_now (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
showAll(handles)
handles.pos = pointGet(handles.size, handles.img_size);
guidata(hObject, handles);

% --- Executes on button press in ok.
function ok_Callback(hObject, eventdata, handles)
% hObject    handle to ok (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if handles.step == 0
    % init
    handles.path = '/mnt/hgfs/NTU_collaboration/';
    dirs = dir([handles.path 'ori/']);
    if length(dirs) > 2 % first two is . and ..
        handles.oriname = dirs(3).name;
    else
        disp('No more');
        return
    end
    disp(handles.oriname);
    handles.img = imread([handles.path 'ori/' handles.oriname]);
    handles.name = handles.oriname(1:end-4);
    handles.img_size = size(handles.img);
    handles.slider_now.Max = round(min(handles.img_size(1:2)) / 2);
    handles.slider_now.Min = round(min(handles.img_size(1:2)) / 20);
    handles.slightMove = round(min(handles.img_size(1:2)) / 75);
    handles.poss = [];
    
    % head input
    imshow(handles.img);
    handles = stepChange(handles, 'Head', round(max(handles.img_size)/9));
    handles.pos = pointGet(handles.size, handles.img_size);
    handles.step = 1;
    
elseif handles.step == 1
    % save head
    handles.head_size = handles.size;
    handles.head_pos = handles.pos;
    handles.poss(end+1, :) = [handles.pos handles.size];
    
    % tail input
    handles = stepChange(handles, 'Tail',  round(max(handles.img_size)/8));
    handles.pos = pointGet(handles.size, handles.img_size);
    handles.step = 2;
    
elseif handles.step == 2
    % save tail
    handles.tail_size = handles.size;
    handles.tail_pos = handles.pos;
    handles.poss(end+1, :) = [handles.pos handles.size];

    % body init
    m = max(handles.img_size);
    handles.body_size = round([m/9 m/8 m/9]);
    handles.body_pos = [linspace(handles.head_pos(1), handles.tail_pos(1), 5)
                        linspace(handles.head_pos(2), handles.tail_pos(2), 5)]';
    handles.body_pos = handles.body_pos(2:4, :);
    handles.step = 3;
    
    % body show
    handles.pos = handles.body_pos(handles.step - 2, :);
    handles.pos = pointModify(handles.pos, handles.size, handles.img_size);
    handles = stepChange(handles, ['Body' num2str(handles.step - 2)], ...
                         handles.body_size(handles.step - 2));
    pointDraw(handles.pos, handles.size);
    
elseif handles.step >= 3 && handles.step <= 4
    % body save
    handles.body_size(handles.step - 2) = handles.size;
    handles.body_pos(handles.step - 2, :) = handles.pos;
    handles.poss(end + 1, :) = [handles.pos handles.size];
    handles.step = handles.step + 1;

    % body show    
    handles.pos = handles.body_pos(handles.step - 2, :);
    handles.pos = pointModify(handles.pos, handles.size, handles.img_size);
    handles = stepChange(handles, ['Body' num2str(handles.step - 2)], ...
                         handles.body_size(handles.step - 2));
    pointDraw(handles.pos, handles.size);

elseif handles.step == 5
    % body save
    handles.body_size(handles.step - 2) = handles.size;
    handles.body_pos(handles.step - 2, :) = handles.pos;
    handles.poss(end + 1, :) = [handles.pos handles.size];

    % color input
    handles = stepChange(handles, 'Color', round(max(handles.img_size)/8));
    handles.pos = pointGet(handles.size, handles.img_size);
    handles.step = 6;
    
elseif handles.step == 6
    % save color
    handles.color_size = handles.size;
    handles.color_pos = handles.pos;
    handles.poss(end+1, :) = [handles.pos handles.size];
      
    % init background
    allpos = ones(round(handles.img_size(2:-1:1)/10)); % xy coordinate
    for i = 1:size(handles.poss, 1)
        pos = handles.poss(i, :);
        s = pos(3);
        allpos(round((pos(1)-s:pos(1)+s)/10)+1, round((pos(2)-s:pos(2)+s)/10)+1) = 0;
    end
    [all_x, all_y] = find(allpos);
    three_label = kmeans([all_x all_y], 3);
    handles.back_pos = [];
    s = round(max(handles.img_size)/10);
    handles.back_size = repmat([s], 1, 3);

    for i = 1:3
        back_pos = [mean(all_x(three_label == i)) mean(all_y(three_label == i))] * 10;
        for j = 1:length(handles.poss)
            back_pos = noOver(handles.poss(j, 1:2), handles.poss(j, 3), back_pos, s);
        end
        handles.back_pos(i, :) = pointModify(back_pos, handles.back_size(i), handles.img_size);
    end
    handles.step = 7;

    % background show
    handles.pos = handles.back_pos(handles.step - 6, :);
    handles = stepChange(handles, ['Background' num2str(handles.step - 6)], ...
                         handles.back_size(handles.step - 6));
    pointDraw(handles.pos, handles.size);
    
elseif handles.step >= 7 && handles.step <= 8
    % background save
    handles.back_size(handles.step - 6) = handles.size;
    handles.back_pos(handles.step - 6, :) = handles.pos;
    handles.poss(end + 1, :) = [handles.pos handles.size];

    % background show    
    handles.step = handles.step + 1;
    handles.pos = handles.back_pos(handles.step - 6, :);
    handles = stepChange(handles, ['Background' num2str(handles.step - 6)], ...
                         handles.back_size(handles.step - 6));
    pointDraw(handles.pos, handles.size);
    
elseif  handles.step == 9
    % background save
    handles.back_size(handles.step - 6) = handles.size;
    handles.back_pos(handles.step - 6, :) = handles.pos;
    handles.poss(end + 1, :) = [handles.pos handles.size];

    % save all data
    path = [handles.path 'ok/' handles.name];
    pointSave(handles.head_pos, handles.head_size, handles.img, [path '_head.jpg']);
    pointSave(handles.tail_pos, handles.tail_size, handles.img, [path '_tail.jpg']);
    pointSave(handles.color_pos, handles.color_size, handles.img, [path '_color.jpg']);
    for i = 1:3
        pointSave(handles.body_pos(i,:), handles.body_size(i), handles.img, [path '_body' num2str(i) '.jpg']);
        pointSave(handles.back_pos(i,:), handles.back_size(i), handles.img, [path '_back' num2str(i) '.jpg']);
    end
    movefile([handles.path 'ori/' handles.oriname], [handles.path 'ok/' handles.name '_ori.jpg']);
    disp('OK');
    handles.step = 0; % for new one
    ok_Callback(hObject, eventdata, handles);
end
if handles.step > 0 
    guidata(hObject, handles);
end

% functions
function showAll(handles)
    imshow(handles.img);
    for i = 1:size(handles.poss, 1)
        pointDraw(handles.poss(i, 1:2), handles.poss(i, 3))
    end

function handles = stepChange(handles, name, size)
    handles.text_now.String = name;
    handles.size = size;
    handles.slider_now.Value = handles.size;

function pos = pointGet(s, img_size)
    pos = ginput(1);
    pos = pointModify(pos, s, img_size);
    pointDraw(pos, s);

function pos = pointModify(pos, s, imgsize)
    pos = round(pos);
    pos(pos < s+1) = s+1;
    if pos(1) > imgsize(2) - s
        pos(1) = imgsize(2) - s;
    end
    if pos(2) > imgsize(1) - s
        pos(2) = imgsize(1) - s;
    end

function pointDraw(pos, size)
    hold on;
    rectangle('Position', [pos(1)-size pos(2)-size 2*size 2*size], ...
              'EdgeColor','r');
    plot(pos(1), pos(2), 'ro', 'MarkerSize', 20);
    hold off;
    
function pointSave(pos, size, img, name)
    disp(name)
    pos = uint64(pos);
    size = uint64(size);
    imwrite(img(pos(2)-size:pos(2)+size, pos(1)-size:pos(1)+size, :), name);

 % a is fix and b need to move and return b position
function pos = noOver(a_pos, a_size, b_pos, b_size)
    s = a_size + b_size;
    pos = b_pos;
    if abs(a_pos(1) - b_pos(1)) < s && abs(a_pos(2) - b_pos(2)) < s
        if abs(a_pos(1) - b_pos(1)) < s
            if a_pos(1) < b_pos(1)
                pos(1) = a_pos(1)+s;
            else
                pos(1) = a_pos(1)-s;
            end
        end
        if abs(a_pos(2) - b_pos(2)) < s
            if a_pos(2) < b_pos(2)
                pos(2) = a_pos(2)+s;
            else
                pos(2) = a_pos(2)-s;
            end
        end
    end
            
    
% up down left right
    
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in push_down.
function push_down_Callback(hObject, eventdata, handles)
% hObject    handle to push_down (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
showAll(handles)
handles.pos(2) = handles.pos(2) + handles.slightMove;
handles.pos = pointModify(handles.pos, handles.size, handles.img_size);
pointDraw(handles.pos, handles.size);
guidata(hObject, handles);

% --- Executes on button press in push_right.
function push_right_Callback(hObject, eventdata, handles)
% hObject    handle to push_right (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
showAll(handles)
handles.pos(1) = handles.pos(1) + handles.slightMove;
handles.pos = pointModify(handles.pos, handles.size, handles.img_size);
pointDraw(handles.pos, handles.size);
guidata(hObject, handles);


% --- Executes on button press in push_up.
function push_up_Callback(hObject, eventdata, handles)
% hObject    handle to push_up (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
showAll(handles)
handles.pos(2) = handles.pos(2) - handles.slightMove;
handles.pos = pointModify(handles.pos, handles.size, handles.img_size);
pointDraw(handles.pos, handles.size);
guidata(hObject, handles);

% --- Executes on button press in push_left.
function push_left_Callback(hObject, eventdata, handles)
% hObject    handle to push_left (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
showAll(handles)
handles.pos(1) = handles.pos(1) - handles.slightMove;
handles.pos = pointModify(handles.pos, handles.size, handles.img_size);
pointDraw(handles.pos, handles.size);
guidata(hObject, handles);


% --- Executes on button press in push_redo.
function push_redo_Callback(hObject, eventdata, handles)
% hObject    handle to push_redo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.step = 0;
ok_Callback(hObject, eventdata, handles);