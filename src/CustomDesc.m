function varargout = CustomDesc(varargin)
% CUSTOMDESC MATLAB code for CustomDesc.fig
%      CUSTOMDESC, by itself, creates a new CUSTOMDESC or raises the existing
%      singleton*.
%
%      H = CUSTOMDESC returns the handle to a new CUSTOMDESC or the handle to
%      the existing singleton*.
%
%      CUSTOMDESC('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CUSTOMDESC.M with the given input arguments.
%
%      CUSTOMDESC('Property','Value',...) creates a new CUSTOMDESC or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CustomDesc_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CustomDesc_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CustomDesc

% Last Modified by GUIDE v2.5 01-Dec-2015 20:46:01

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CustomDesc_OpeningFcn, ...
                   'gui_OutputFcn',  @CustomDesc_OutputFcn, ...
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


% --- Executes just before CustomDesc is made visible.
function CustomDesc_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CustomDesc (see VARARGIN)

% Choose default command line output for CustomDesc
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CustomDesc wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CustomDesc_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function PartQuant1_Callback(hObject, eventdata, handles)
handles.np1 = str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function PartQuant1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.np1 = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes on selection change in PartID1.
function PartID1_Callback(hObject, eventdata, handles)

    switch get(hObject,'Value')

    case 1
        PID = '';
    case 2
        PID = '2WSH12345-0001';
    case 3
        PID = '2CSH1256-0002';
    case 4
        PID = '2ASH12345';
    case 5
        PID = 'AES34712';
    case 6
        PID = 'AL-2024';
    case 7
        PID = 'AL-7075';
    case 8
        PID = 'AL-6061';
    case 9
        PID = 'AMS-9876';
    case 10
        PID = 'AMS-4721';
    case 11
        PID = 'MS25974';
    case 12
        PID = 'SI65478';
    end
handles.PID1 = PID;
guidata(hObject,handles);



% --- Executes during object creation, after setting all properties.
function PartID1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.PID1 = '';
guidata(hObject,handles);


function PartQuant2_Callback(hObject, eventdata, handles)
handles.np2 = str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function PartQuant2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.np2 = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes on selection change in PartID2.
function PartID2_Callback(hObject, eventdata, handles)

    switch get(hObject,'Value')

    case 1
        PID = '';
    case 2
        PID = '2WSH12345-0001';
    case 3
        PID = '2CSH1256-0002';
    case 4
        PID = '2ASH12345';
    case 5
        PID = 'AES34712';
    case 6
        PID = 'AL-2024';
    case 7
        PID = 'AL-7075';
    case 8
        PID = 'AL-6061';
    case 9
        PID = 'AMS-9876';
    case 10
        PID = 'AMS-4721';
    case 11
        PID = 'MS25974';
    case 12
        PID = 'SI65478';
    end
handles.PID2 = PID;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function PartID2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.PID2 = '';
guidata(hObject,handles);


function PartQuant3_Callback(hObject, eventdata, handles)
handles.np3 = str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function PartQuant3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.np3 = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes on selection change in PartID3.
function PartID3_Callback(hObject, eventdata, handles)

    switch get(hObject,'Value')

    case 1
        PID = '';
    case 2
        PID = '2WSH12345-0001';
    case 3
        PID = '2CSH1256-0002';
    case 4
        PID = '2ASH12345';
    case 5
        PID = 'AES34712';
    case 6
        PID = 'AL-2024';
    case 7
        PID = 'AL-7075';
    case 8
        PID = 'AL-6061';
    case 9
        PID = 'AMS-9876';
    case 10
        PID = 'AMS-4721';
    case 11
        PID = 'MS25974';
    case 12
        PID = 'SI65478';
    end
handles.PID3 = PID;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function PartID3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.PID3 = '';
guidata(hObject,handles);

function RepDur_Callback(hObject, eventdata, handles)
handles.RepDur = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function RepDur_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.RepDur = 0;
guidata(hObject,handles);

% --- Executes on button press in ExecuteButton.
function ExecuteButton_Callback(hObject, eventdata, handles)
np = {handles.np1,handles.np2,handles.np3};
PIDs = {handles.PID1,handles.PID2,handles.PID3};
RepDur = handles.RepDur;

PNums = {};
for i = 1:3
    if (np{i} > 0)
        PNums{i} = np{i};
    end
end
PIDNs = {};
for i = 1:3
    if (PIDs{i} > 0)
        PIDNs{i} = PIDs{i};
    end
end
assignin('base','PNums',PNums);
assignin('base','PIDs',PIDNs);
assignin('base','RepDur',RepDur);
close(CustomDesc);




