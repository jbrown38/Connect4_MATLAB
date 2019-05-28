function varargout = connect4Tool(varargin)
% connect4Tool MATLAB code for connect4Tool.fig
%      connect4Tool, by itself, creates a new connect4Tool or raises the existing
%      singleton*.
%
%      H = connect4Tool returns the handle to a new connect4Tool or the handle to
%      the existing singleton*.
%
%      connect4Tool('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in connect4Tool.M with the given input arguments.
%
%      connect4Tool('Property','Value',...) creates a new connect4Tool or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before connect4Tool_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to connect4Tool_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, fGUIDATA, GUIHANDLES

% Edit the above text to modify the response to help connect4Tool

% Last Modified by GUIDE v2.5 15-May-2019 14:32:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @connect4Tool_OpeningFcn, ...
                   'gui_OutputFcn',  @connect4Tool_OutputFcn, ...
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


% --- Executes just before connect4Tool is made visible.
function connect4Tool_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to connect4Tool (see VARARGIN)

%title figure
set(gcf,'name','Connect 4');

%each axes represents a spot for a piece to be played
%axesArray represents the visible game board
handles.axesArray = [handles.axes1 handles.axes2 handles.axes3 handles.axes4 handles.axes5 handles.axes6, handles.axes7; ...
    handles.axes8 handles.axes9 handles.axes10 handles.axes11 handles.axes12 handles.axes13, handles.axes14; ...
    handles.axes15 handles.axes16 handles.axes17 handles.axes18 handles.axes19 handles.axes20, handles.axes21; ...
    handles.axes22 handles.axes23 handles.axes24 handles.axes25 handles.axes26 handles.axes27, handles.axes28; ...
    handles.axes29 handles.axes30 handles.axes31 handles.axes32 handles.axes33 handles.axes34, handles.axes35; ...
    handles.axes36 handles.axes37 handles.axes38 handles.axes39 handles.axes40 handles.axes41, handles.axes42];

%initialize mathematical model of game board
handles.field = zeros(6,7);

%set default parameters
handles.moveNum=1;
handles.pick=0;
handles.difficulty=0;


%Begin intermediate bot training
for i=1:7
    handles.aggregateMoves(1:21,i)=i;
end

%number of wins to learn from
numSims=1;                                                                                                                                                                                                                                                                                                    ;
%games=0;
for iSims=0:numSims-1
    ifWon=0;
    while ifWon~=1
        [gameMoves, ifWon]=connect4F(handles.aggregateMoves);
        %games=games+1;
    end
    handles.aggregateMoves=[handles.aggregateMoves gameMoves];
end
%disp(num2str(games));
%End intermediate bot training

%display game board image
axes(handles.axes0)
board = imread('empty_board.png');
image(board)
axis off
axis image
%handles.axes0.Visible;

%initialize visible game board (slow,loading effect)/(toggle visibility)
%{
for i = 1:6
    for j=1:7
        axes(handles.axesArray(i,j))
        axis off
        %handles.axesArray(i,j).Visible;
    end
end
%}

%create game pieces
[piece, map, Palpha] = imread('piece.png');

redPiece = piece;
%red values
for i=1:size(redPiece,1)
    for j=1:size(redPiece,2)
        %piece(i,j,1) = 0; %black
        %piece(i,j,1) = 255; %yellow
        redPiece(i,j,1) = 255; %red
    end
end
%green values
for i=1:size(redPiece,1)
    for j=1:size(redPiece,2)
        %piece(i,j,2) = 0; %black
        %piece(i,j,2) = 239; %yellow
        redPiece(i,j,2) = 51; %red
    end
end
%blue values
for i=1:size(redPiece,1)
    for j=1:size(redPiece,2)
        %piece(i,j,3) = 0; %black
        %piece(i,j,3) = 0; %yellow
        redPiece(i,j,3) = 51; %red
    end
end
%optional: insert 1000x1000 pixel image for user game piece
redPiece = imread('Perry.jpg');

yellowPiece = piece;
%red values
for i=1:size(yellowPiece,1)
    for j=1:size(yellowPiece,2)
        %piece(i,j,1) = 0; %black
        yellowPiece(i,j,1) = 255; %yellow
        %piece(i,j,1) = 255; %red
    end
end
%green values
for i=1:size(yellowPiece,1)
    for j=1:size(yellowPiece,2)
        %piece(i,j,2) = 0; %black
        yellowPiece(i,j,2) = 239; %yellow
        %piece(i,j,2) = 51; %red
    end
end
%blue values
for i=1:size(yellowPiece,1)
    for j=1:size(yellowPiece,2)
        %piece(i,j,3) = 0; %black
        yellowPiece(i,j,3) = 0; %yellow
        %piece(i,j,3) = 51; %red
    end
end
%optional: insert 1000x1000 pixel image for opponent game piece
yellowPiece = imread('Doofenshmirtz.jpg');

handles.redPiece = redPiece;
handles.yellowPiece = yellowPiece;
handles.Palpha = Palpha;

%prepare for potential reset
handles.newHandles = handles;

% Choose default command line output for connect4Tool
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes connect4Tool wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = connect4Tool_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pick=1;

handles1 = Base_V6(handles);

guidata(hObject, handles1);

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pick=2;

handles1 = Base_V6(handles);

guidata(hObject, handles1);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pick=3;

handles1 = Base_V6(handles);

guidata(hObject, handles1);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pick=4;

handles1 = Base_V6(handles);

guidata(hObject, handles1);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pick=5;

handles1 = Base_V6(handles);

guidata(hObject, handles1);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pick=6;

handles1 = Base_V6(handles);

guidata(hObject, handles1);


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.pick=7;

handles1 = Base_V6(handles);

guidata(hObject, handles1);


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.difficulty = get(hObject,'Value')-1;

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.


% --- Executes on button press in resetButton.
function resetButton_Callback(hObject, eventdata, handles)
% hObject    handle to resetButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles1 = handles.newHandles;
%prepares for multiple uses of reset button
handles1.newHandles = handles1;
for j=1:7
    for i=6:-1:1
        %for slow,loading effect use:
        %axes(handles1.axesArray(i,j));
        %cla
        cla(handles1.axesArray(i,j))
        axis off
        %handles1.axesArray(i,j).Visible;
    end
end
handles1.popupmenu1.Value=1;
handles.text2.String = 'Connect 4';

guidata(hObject, handles1);
