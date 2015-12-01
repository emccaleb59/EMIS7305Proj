function varargout = RelDist(varargin)
% RELDIST MATLAB code for RelDist.fig
%      RELDIST, by itself, creates a new RELDIST or raises the existing
%      singleton*.
%
%      H = RELDIST returns the handle to a new RELDIST or the handle to
%      the existing singleton*.
%
%      RELDIST('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in RELDIST.M with the given input arguments.
%
%      RELDIST('Property','Value',...) creates a new RELDIST or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before RelDist_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to RelDist_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help RelDist

% Last Modified by GUIDE v2.5 29-Nov-2015 18:13:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @RelDist_OpeningFcn, ...
                   'gui_OutputFcn',  @RelDist_OutputFcn, ...
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

% --- Executes just before RelDist is made visible.
function RelDist_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to RelDist (see VARARGIN)

% Choose default command line output for RelDist
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes RelDist wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = RelDist_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function ln_std_Callback(hObject, eventdata, handles)
handles.ln.std = str2double(get(hObject,'String'));
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function ln_std_CreateFcn(hObject, eventdata, handles)

RelMN = evalin('base','RelMN;');

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
end
if RelMN ~= 3
    set(hObject,'Visible','off')
end
handles.ln.std = str2double(get(hObject,'String'));
guidata(hObject,handles);




function ln_mu_Callback(hObject, eventdata, handles)
handles.ln.mu = str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function ln_mu_CreateFcn(hObject, eventdata, handles)

RelMN = evalin('base','RelMN;');

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
end
if RelMN ~= 3
    set(hObject,'BackgroundColor','black')
    set(hObject,'Visible','off')
end
handles.ln.mu = str2double(get(hObject,'String'));
guidata(hObject,handles);


function norm_std_Callback(hObject, eventdata, handles)
handles.norm.std = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function norm_std_CreateFcn(hObject, eventdata, handles)

RelMN = evalin('base','RelMN;');

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
end
if RelMN ~= 2
    set(hObject,'BackgroundColor','black')
    set(hObject,'Visible','off')
end
handles.norm.std = str2double(get(hObject,'String'));
guidata(hObject,handles);


function norm_mu_Callback(hObject, eventdata, handles)
handles.norm.mu = str2double(get(hObject,'String'));
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function norm_mu_CreateFcn(hObject, eventdata, handles)

RelMN = evalin('base','RelMN;');

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
end
if RelMN ~= 2
    set(hObject,'BackgroundColor','black')
    set(hObject,'Visible','off')
end
handles.norm.mu = str2double(get(hObject,'String'));
guidata(hObject,handles);


function wb_beta_Callback(hObject, eventdata, handles)
handles.wb.beta = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function wb_beta_CreateFcn(hObject, eventdata, handles)

RelMN = evalin('base','RelMN;');

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
end
if RelMN ~= 4
    set(hObject,'BackgroundColor','black')
    set(hObject,'Visible','off')
end
handles.wb.beta = str2double(get(hObject,'String'));
guidata(hObject,handles);


function wb_theta_Callback(hObject, eventdata, handles)
handles.wb.theta = str2double(get(hObject,'String'));
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function wb_theta_CreateFcn(hObject, eventdata, handles)

RelMN = evalin('base','RelMN;');

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
end
if RelMN ~= 4
    set(hObject,'BackgroundColor','black')
    set(hObject,'Visible','off')
end
handles.wb.theta = str2double(get(hObject,'String'));
guidata(hObject,handles);


function exp_theta_Callback(hObject, eventdata, handles)
handles.exp.theta = str2double(get(hObject,'String'));
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function exp_theta_CreateFcn(hObject, eventdata, handles)

RelMN = evalin('base','RelMN;');

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
end
if RelMN ~= 1
    set(hObject,'BackgroundColor','black')
    set(hObject,'Visible','off')
end
handles.exp.theta = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
RelMN = evalin('base','RelMN;');
if RelMN == 1
    theta = handles.exp.theta;
    mu = 0;
    std = 0;
    beta = 0;
elseif RelMN == 2
    mu = handles.norm.mu;
    std = handles.norm.std;
    theta = 0;
    beta = 0;
elseif RelMN == 3
    mu = handles.ln.mu;
    std = handles.ln.std;
    theta = 0;
    beta = 0;
elseif RelMN == 4
    beta = handles.wb.beta;
    theta = handles.wb.theta;
    mu = 0;
    std = 0;
else
    disp('Reliability Unknown')
    beta = 0;
    theta = 0;
    mu = 0;
    std = 0;
end
assignin('base','beta',beta);
assignin('base','theta',theta);
assignin('base','mu',mu);
assignin('base','std',std);
close(RelDist);
