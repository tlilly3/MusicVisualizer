function varargout = greaterthanwmp(varargin)
% GREATERTHANWMP MATLAB code for greaterthanwmp.fig
%      GREATERTHANWMP, by itself, creates a new GREATERTHANWMP or raises the existing
%      singleton*.
%
%      H = GREATERTHANWMP returns the handle to a new GREATERTHANWMP or the handle to
%      the existing singleton*.
%
%      GREATERTHANWMP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GREATERTHANWMP.M with the given input arguments.
%
%      GREATERTHANWMP('Property','Value',...) creates a new GREATERTHANWMP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before greaterthanwmp_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to greaterthanwmp_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help greaterthanwmp

% Last Modified by GUIDE v2.5 03-Dec-2014 22:40:32

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @greaterthanwmp_OpeningFcn, ...
                   'gui_OutputFcn',  @greaterthanwmp_OutputFcn, ...
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


% --- Executes just before greaterthanwmp is made visible.
function greaterthanwmp_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to greaterthanwmp (see VARARGIN)

% Choose default command line output for greaterthanwmp
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes greaterthanwmp wait for user response (see UIRESUME)
% uiwait(handles.figure1);
global c;
global type;
global lap;
global init;
global stopPlot;
global song;
song = 'er.mp3';
stopPlot = false;
init = false;
lap = false;
type = 3;
c = 'jet';


% --- Outputs from this function are returned to the command line.
function varargout = greaterthanwmp_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



% --- Executes on button press in playButton.
function playButton_Callback(hObject, eventdata, handles)
    global c;
    global type;
    global hh;
    global lap;
    global init;
    global stopPlot;
    global song;
% hObject    handle to playButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
if init && ~lap
    lap = true;
    pause(hh);
elseif lap
    lap = false;
    set(handles.playButton,'string','Pause');
    resume(hh);
else
    init = true;
set(handles.playButton,'string','Pause')
[data, Fs] = audioread(song);
hh = audioplayer(data(:,:),Fs);
%sec = length(freq)/Fs*10;
play(hh);
s = 0:44100/10:length(data);
for i = 1:length(s)-1
    tic;
    [freq,db]=my_fft(data(s(i)+1:s(i+1),1),Fs);
    if(type == 2)
        bar(freq,db)
        axis([0 15000 0 0.2])
        colormap(c)
    else
        plotAud(c,freq,db)
        
    end
    time = toc;
    wait = 0.09655 - time;
    pause(wait)
    while(lap)
        set(handles.playButton,'string','Play');
        pause(0.1)
    end
    if stopPlot
        stopPlot = false;
        break;
    end
end
set(handles.playButton,'string','Play');
init = false;
cla
end




% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global type;
str = get(hObject, 'String');
val = get(hObject,'Value');
switch str{val}
    case '2D'
        type = 2;
    case '3D'
        type = 3;
end



% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
    global c;
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
str = get(hObject, 'String');
val = get(hObject,'Value');
map = str{val};
switch map
    case 'Jet'
        c = map;
    case 'HSV'
        c = map;
    case 'Hot'
        c = map;
    case 'Cool'
        c = map;
    case 'Spring'
        c = map;
    case 'Summer'
        c = map;
    case 'Autumn'
        c = map;
    case 'Winter'
        c = map;
    case 'Bone'
        c = map;
    case 'Lines'
        c = map;
    case 'Pink'
        c = map;
    case 'Copper'
        c = map;
    case 'Gray'
        c = map;  
end



% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in stopButton.
function stopButton_Callback(hObject, eventdata, handles)
% hObject    handle to stopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global hh;
global init;
global lap;
global stopPlot;
stop(hh);
init = false;
lap = false;
stopPlot = true;


% --- Executes on selection change in songList.
function songList_Callback(hObject, eventdata, handles)
% hObject    handle to songList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global song;
% Hints: contents = cellstr(get(hObject,'String')) returns songList contents as cell array
%        contents{get(hObject,'Value')} returns selected item from songList
str = get(hObject, 'String');
val = get(hObject,'Value');
map = str{val};
switch map
    case 'Elanor Rigby'
        song = 'er.mp3';
    case 'Spring'
        song = 'spring.mp3';
    case '3005'
        song = '3005.mp3';
    case 'Animals'
        song = 'animals.mp3';
    case 'Pompeii'
        song = 'pomp.mp3';
    case 'Save a Life'
        song = 'save.mp3';
    case 'Mad World'
        song = 'madworld.mp3';
    case 'Latch'
        song = 'latch.mp3';
    case 'Pursuit of Happiness'
        song = 'happiness.mp3';

end


% --- Executes during object creation, after setting all properties.
function songList_CreateFcn(hObject, eventdata, handles)
% hObject    handle to songList (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when figure1 is resized.
function figure1_ResizeFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1
axis off
