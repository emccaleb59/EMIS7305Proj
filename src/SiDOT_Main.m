function varargout = SiDOT_Main(varargin)
% SIDOT_MAIN MATLAB code for SiDOT_Main.fig
%      SIDOT_MAIN, by itself, creates a new SIDOT_MAIN or raises the existing
%      singleton*.
%
%      H = SIDOT_MAIN returns the handle to a new SIDOT_MAIN or the handle to
%      the existing singleton*.
%
%      SIDOT_MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SIDOT_MAIN.M with the given input arguments.
%
%      SIDOT_MAIN('Property','Value',...) creates a new SIDOT_MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SiDOT_Main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SiDOT_Main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SiDOT_Main

% Last Modified by GUIDE v2.5 29-Nov-2015 23:04:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SiDOT_Main_OpeningFcn, ...
                   'gui_OutputFcn',  @SiDOT_Main_OutputFcn, ...
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


% --- Executes just before SiDOT_Main is made visible.
function SiDOT_Main_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SiDOT_Main (see VARARGIN)

% Choose default command line output for SiDOT_Main
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes SiDOT_Main wait for user response (see UIRESUME)
% uiwait(handles.figure1);
 iter = 0;
assignin('base','iter',iter);
% --- Outputs from this function are returned to the command line.
function varargout = SiDOT_Main_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
%=========================================================================
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                        %
%% Descrepancy Name                                      %
%                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function desc_name_Callback(hObject, eventdata, handles)
descName = get(hObject,'string');
handles.Inputs.descName = descName;
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function desc_name_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
descName = 'F35_Panel1';
set(hObject,'string',descName);
handles.Inputs.descName = descName;
handles.Flags.Cost = 0;
handles.Flags.Schedule = 0;
handles.Flags.Rel = 0;
handles.Flags.RelPlot = 0;
handles.Flags.AvailPlot = 0;
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                        %
%% Descrepancy Inputs                                    %
%                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Executes on selection change in DescType.

function DescType_Callback(hObject, eventdata, handles)
Material.PartNums = {};
Material.PartQuants = {};
switch get(hObject,'Value')
    case 1
        descType = 'Pick a Descrepancy'; 
    case 2
        descType = 'Panel';
        %Here is where I plan to set defaults for other fields
        %handles.Defaults.Dist = X;
        Material.PartNums{1} = '2WSH12345-0001';
        Material.PartQuants{1} = 1;
        Material.PartNums{2} = 'MS25974';
        Material.PartQuants{2} = 10;
        Material.RepDur = 3;
    case 3
        descType = 'RadarFail';
        Material.PartNums{1} = '2ASH12345';
        Material.PartQuants{1} = 3;
        Material.RepDur = 3;
    case 4
        descType = 'HUDS';
        Material.PartNums{1} = '2ASH12345';
        Material.PartQuants{1} = 1;
        Material.PartNums{2} = '2CSH1256-0002';
        Material.PartQuants{2} = 1;
        Material.RepDur = 1;
    case 5
        descType = 'Oil';
        Material.PartNums{1} = 'SI65478';
        Material.PartQuants{1} = 37;
        Material.RepDur = 1;
    case 6
        descType = 'Rocket';
        Material.PartNums{1} = 'AMS-9876';
        Material.PartQuants{1} = 1;
        Material.RepDur = 3;
    case 7
        descType = 'Custom';
        uiwait(CustomDesc);
        Material.PartNums = evalin('base','PIDs;');
        Material.PartQuants = evalin('base','PNums;');
        Material.RepDur = evalin('base','RepDur');
    otherwise
        descType = 'Type UNK';
end
handles.Inputs.descType = descType;
handles.Materials = Material;
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function DescType_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
descType = 'Pick';
handles.Inputs.descType = descType;
guidata(hObject,handles);

function numUAC_Callback(hObject, eventdata, handles)
numUAC = get(hObject,'String');
handles.Inputs.numUAC = str2double(numUAC);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function numUAC_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.Inputs.numUAC = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes on selection change in DescLoc.
function DescLoc_Callback(hObject, eventdata, handles)
switch get(hObject,'Value')
    case 1
        descLoc = 'Pick Location';
    case 2
        descLoc = 'Loc 1';
        
    case 3
        descLoc = 'Loc 2';
    case 4
        descLoc = 'Loc 3';
    otherwise
        descLoc = 'Loc UNK';
end
handles.Inputs.descLoc = descLoc;
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function DescLoc_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
descLoc = 'Pick Location';
handles.Inputs.descLoc = descLoc;
guidata(hObject,handles);


function numAAC_Callback(hObject, eventdata, handles)
numAAC = get(hObject,'String');
handles.Inputs.numAAC = str2double(numAAC);
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function numAAC_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.Inputs.numAAC = str2double(get(hObject,'String'));
guidata(hObject,handles);


function numACreq_Callback(hObject, eventdata, handles)
handles.Inputs.numACReq = str2double(get(hObject,'String'));
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function numACreq_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.Inputs.numACReq = str2double(get(hObject,'String'));
guidata(hObject,handles);


function length_Dur_Callback(hObject, eventdata, handles)
handles.Inputs.lenDur = str2double(get(hObject,'String'));
guidata(hObject,handles);
function length_Dur_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.Inputs.lenDur = str2double(get(hObject,'String'));
guidata(hObject,handles);

function avgDur_Callback(hObject, eventdata, handles)
handles.Inputs.avgDur = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function avgDur_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.Inputs.avgDur = str2double(get(hObject,'String'));
guidata(hObject,handles);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                        %
%% Reliability Inputs                                    %
%                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Reliability Inputs
% --- Executes on button press in FlagCostReq.
function FlagCostReq_Callback(hObject, eventdata, handles)
handles.Flags.Cost = get(hObject,'Value');
guidata(hObject,handles);


% --- Executes on selection change in RelModel.
function RelModel_Callback(hObject, eventdata, handles)
handles.Inputs.RelModel = get(hObject,'Value');

switch get(hObject,'Value')
    case 1
        RelModel = 'Pick Reliability Model';
        RelMN = 0;
    case 2
        RelModel = 'Exponential';
        RelMN = 1;
    case 3
        RelModel = 'Normal';
        RelMN = 2;
    case 4
        RelModel = 'LogNormal';
        RelMN = 3;
    case 5
        RelModel = 'Weibull';
        RelMN = 4;
    otherwise
        RelModel = 'Perfect';
        RelMN = 999;
end
assignin('base','RelMN',RelMN);
RelDist;
handles.Inputs.RelModel = RelModel;
handles.Rel.ModelNum = RelMN;
handles.Rel.Model = RelModel;
guidata(hObject,handles);
% --- Executes during object creation, after setting all properties.
function RelModel_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.Inputs.RelModel = 'Pick Reliability Model';
handles.Rel.Model = 0;
guidata(hObject,handles);


% --- Executes on button press in FlagSchReq.
function FlagSchReq_Callback(hObject, eventdata, handles)
handles.Flags.Schedule = get(hObject,'Value');
guidata(hObject,handles);

% --- Executes on button press in FlagRelReq.
function FlagRelReq_Callback(hObject, eventdata, handles)
handles.Flags.Rel = get(hObject,'Value');
guidata(hObject,handles);



function limCost_Callback(hObject, eventdata, handles)
handles.Limits.Cost = str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function limCost_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.Limits.Cost = str2double(get(hObject,'String'));
guidata(hObject,handles);



function limSchedule_Callback(hObject, eventdata, handles)
handles.Limits.Schedule = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function limSchedule_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.Limits.Schedule = str2double(get(hObject,'String'));
guidata(hObject,handles);


function limReliabililty_Callback(hObject, eventdata, handles)
handles.Limits.Reliability = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function limReliabililty_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.Limits.Reliability = str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes on button press in FlagSeries.
function FlagSeries_Callback(hObject, eventdata, handles)
handles.Flags.Series = get(hObject,'Value');
guidata(hObject,handles);

function numElsSeries_Callback(hObject, eventdata, handles)
% hObject    handle to numElsSeries (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numElsSeries as text
%        str2double(get(hObject,'String')) returns contents of numElsSeries as a double


% --- Executes during object creation, after setting all properties.
function numElsSeries_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numElsSeries (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','black');
end


% --- Executes on button press in FlagParallel.
function FlagParallel_Callback(hObject, eventdata, handles)
% hObject    handle to FlagParallel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FlagParallel



function numElsAP_Callback(hObject, eventdata, handles)
% hObject    handle to numElsAP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numElsAP as text
%        str2double(get(hObject,'String')) returns contents of numElsAP as a double


% --- Executes during object creation, after setting all properties.
function numElsAP_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numElsAP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','black');
end


% --- Executes on button press in FlagRN.
function FlagRN_Callback(hObject, eventdata, handles)
% hObject    handle to FlagRN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of FlagRN



function numElsRN_r_Callback(hObject, eventdata, handles)
% hObject    handle to numElsRN_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numElsRN_r as text
%        str2double(get(hObject,'String')) returns contents of numElsRN_r as a double


% --- Executes during object creation, after setting all properties.
function numElsRN_r_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numElsRN_r (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','black');
end



function numElsRN_n_Callback(hObject, eventdata, handles)
% hObject    handle to numElsRN_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of numElsRN_n as text
%        str2double(get(hObject,'String')) returns contents of numElsRN_n as a double


% --- Executes during object creation, after setting all properties.
function numElsRN_n_CreateFcn(hObject, eventdata, handles)
% hObject    handle to numElsRN_n (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','black');
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                        %
%% Output Inputs                                         %
%                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% --- Executes on button press in PlotFlagRel.
function PlotFlagRel_Callback(hObject, eventdata, handles)
handles.Flags.RelPlot = get(hObject,'Value');
guidata(hObject,handles);


% --- Executes on button press in PlotAvailFlag.
function PlotAvailFlag_Callback(hObject, eventdata, handles)
handles.Flags.AvailPlot = get(hObject,'Value');
guidata(hObject,handles);

% --- Executes on button press in FlagOptimizer.
function FlagOptimizer_Callback(hObject, eventdata, handles)
handles.Flags.OptPlot = get(hObject,'Value');
guidata(hObject,handles);


% --- Executes on selection change in AvailProb.
function AvailProb_Callback(hObject, eventdata, handles)
% handles.Inputs.AvModel = get(hObject,'Value');

switch get(hObject,'Value')
    case 1
        AvModel = 'Pick Availability Standard';
        AvStandard = 0;
    case 2
        AvModel = 'Mean';
        AvStandard = 0;
    case 3
        AvModel = 'Median';
        AvStandard = .5;
    case 4
        AvModel = '75th Percentile';
        AvStandard = .75;
    case 5
        AvModel = '90th Percentile';
        AvStandard = .90;
    case 6
        AvModel = '95th Percentile';
        AvStandard = .95;
    case 7
        AvModel = '99th Percentile';
        AvStandard = .99;
end
handles.Inputs.AvStandard = AvStandard;
handles.Inputs.AvDesc = AvModel;
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function AvailProb_CreateFcn(hObject, eventdata, handles)
handles.Inputs.AvStandard = 999;
handles.Inputs.AvDesc = 'Need to Select Avail Model';
guidata(hObject,handles);

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.Inputs.AvailProb = 0;
guidata(hObject,handles);


function MC_Samples_Callback(hObject, eventdata, handles)
handles.Inputs.MCSamples= str2double(get(hObject,'String'));
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function MC_Samples_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
handles.Inputs.MCSamples= str2double(get(hObject,'String'));
guidata(hObject,handles);

% --- Executes on button press in ClearPlots.
function ClearPlots_Callback(hObject, eventdata, handles)

close(1)
close(2)
iter = 0;
assignin('base','iter',iter);


% --- Executes on button press in SavePlots.
function SavePlots_Callback(hObject, eventdata, handles)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                        %
%% Start Calculations                                    %
%                                                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Executes on button press in MakeCompare.
function MakeCompare_Callback(hObject, eventdata, handles)
iter = evalin('base','iter;')+1;
assignin('base','iter',iter);
if iter == 1
    assignin('base','RlegStr',{});
    assignin('base','AlegStr',{});
end

Flags = handles.Flags;
Limits = handles.Limits;
Inputs = handles.Inputs;
Reliability = handles.Rel;
Reliability.beta = evalin('base','beta;');
Reliability.theta = evalin('base','theta;');
Reliability.mu = evalin('base','mu;');
Reliability.std = evalin('base','std;');

Materials = handles.Materials;
for i = 1:length(Materials.PartNums)
    Materials.ForLookup{i,1} = Materials.PartNums{i};
    Materials.ForLookup{i,2} = Materials.PartQuants{i};
end
%This puts variables into the workspace just in case you need them there...
assignin('base','Inputs',Inputs);
assignin('base','Flags',Flags);
assignin('base','Limits',Limits);
assignin('base','Reliability',Reliability);
assignin('base','Materials',Materials);
assignin('base','iter',iter);

logiconly_Main

PlotData
