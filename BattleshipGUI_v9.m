function varargout = BattleshipGUI_v9(varargin)
% BATTLESHIPGUI_V9 MATLAB code for BattleshipGUI_v9.fig
%      BATTLESHIPGUI_V9, by itself, creates a new BATTLESHIPGUI_V9 or raises the existing
%      singleton*.
%
%      H = BATTLESHIPGUI_V9 returns the handle to a new BATTLESHIPGUI_V9 or the handle to
%      the existing singleton*.
%
%      BATTLESHIPGUI_V9('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BATTLESHIPGUI_V9.M with the given input arguments.
%
%      BATTLESHIPGUI_V9('Property','Value',...) creates a new BATTLESHIPGUI_V9 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before BattleshipGUI_v9_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to BattleshipGUI_v9_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help BattleshipGUI_v9

% Last Modified by GUIDE v2.5 26-Apr-2019 09:43:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @BattleshipGUI_v9_OpeningFcn, ...
                   'gui_OutputFcn',  @BattleshipGUI_v9_OutputFcn, ...
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


% --- Executes just before BattleshipGUI_v9 is made visible.
function BattleshipGUI_v9_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to BattleshipGUI_v9 (see VARARGIN)

% Choose default command line output for BattleshipGUI_v9
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes BattleshipGUI_v9 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

BoardClear(handles)
% --- Outputs from this function are returned to the command line.
function varargout = BattleshipGUI_v9_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in randPlaceCheck.
function randPlaceCheck_Callback(hObject, eventdata, handles)
% hObject    handle to randPlaceCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of randPlaceCheck


% --- Executes on button press in strat1Check.
function strat1Check_Callback(hObject, eventdata, handles)
% hObject    handle to strat1Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of strat1Check
if handles.strat1Check.Value==0
   imshow(imread('blank space.png'), 'InitialMagnification', 'fit', 'Parent', handles.strat1Display )
else
       imshow(imread('grid.png'), 'InitialMagnification', 'fit', 'Parent', handles.strat1Display )
       BoardChoiceDisplayUpdate(handles)
end

% --- Executes on button press in strat2Check.
function strat2Check_Callback(hObject, eventdata, handles)
% hObject    handle to strat2Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of strat2Check

if handles.strat2Check.Value==0
   imshow(imread('blank space.png'), 'InitialMagnification', 'fit', 'Parent', handles.strat2Display )
else
       imshow(imread('grid.png'), 'InitialMagnification', 'fit', 'Parent', handles.strat2Display )
       BoardChoiceDisplayUpdate(handles)
end

% --- Executes on button press in strat3Check.
function strat3Check_Callback(hObject, eventdata, handles)
% hObject    handle to strat3Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of strat3Check
if handles.strat3Check.Value==0
   imshow(imread('blank space.png'), 'InitialMagnification', 'fit', 'Parent', handles.strat3Display )
else
       imshow(imread('grid.png'), 'InitialMagnification', 'fit', 'Parent', handles.strat3Display )
       BoardChoiceDisplayUpdate(handles)
end

% --- Executes on button press in strat4Check.
function strat4Check_Callback(hObject, eventdata, handles)
% hObject    handle to strat4Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of strat4Check
if handles.strat4Check.Value==0
   imshow(imread('blank space.png'), 'InitialMagnification', 'fit', 'Parent', handles.strat4Display )
else
       imshow(imread('grid.png'), 'InitialMagnification', 'fit', 'Parent', handles.strat4Display )
       BoardChoiceDisplayUpdate(handles)
end

% --- Executes on button press in strat5Check.
function strat5Check_Callback(hObject, eventdata, handles)
% hObject    handle to strat5Check (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of strat5Check
if handles.strat5Check.Value==0
   imshow(imread('blank space.png'), 'InitialMagnification', 'fit', 'Parent', handles.strat5Display )
else
       imshow(imread('grid.png'), 'InitialMagnification', 'fit', 'Parent', handles.strat5Display )
       BoardChoiceDisplayUpdate(handles)
end

% --- Executes on button press in compPlaceCheck.
function compPlaceCheck_Callback(hObject, eventdata, handles)
% hObject    handle to compPlaceCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of compPlaceCheck


% --- Executes on button press in cyoPlaceCheck.
function cyoPlaceCheck_Callback(hObject, eventdata, handles)
% hObject    handle to cyoPlaceCheck (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of cyoPlaceCheck


% --- Executes on button press in checkbox9.
function checkbox9_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox9



function trialsText_Callback(hObject, eventdata, handles)
% hObject    handle to trialsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of trialsText as text
%        str2double(get(hObject,'String')) returns contents of trialsText as a double


% --- Executes during object creation, after setting all properties.
function trialsText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to trialsText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in placementChoicePopup.
function placementChoicePopup_Callback(hObject, eventdata, handles)
% hObject    handle to placementChoicePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns placementChoicePopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from placementChoicePopup
if handles.placementChoicePopup.Value==1
    BoardChoiceDisplayUpdate(handles);
    imageChoice=OutputBoardChoiceDisplayUpdate(handles);
    handles.shipPopup.Visible=1;
    BoardClear(handles);
end

if handles.placementChoicePopup.Value==2
    randomArray=randomPlacement(handles);
    randArray=arraysave(randomArray);
    handles.randTable.Data=randArray;
    randomArray2=array2one(randomArray);
    array2gui(handles,randomArray2)
    imageChoice=OutputBoardChoiceDisplayUpdate(handles);
    handles.shipPopup.Visible=0;
end
   
    
% --- Executes during object creation, after setting all properties.
function placementChoicePopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to placementChoicePopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in a1Button.
function a1Button_Callback(hObject, eventdata, handles)
% hObject    handle to a1Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BoardChoiceDisplayUpdate(handles)



% --- Executes on button press in b1Button.
function b1Button_Callback(hObject, eventdata, handles)
% hObject    handle to b1Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in a2Button.
function a2Button_Callback(hObject, eventdata, handles)
% hObject    handle to a2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in a9Button.
function a9Button_Callback(hObject, eventdata, handles)
% hObject    handle to a9Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in a8Button.
function a8Button_Callback(hObject, eventdata, handles)
% hObject    handle to a8Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in a7Button.
function a7Button_Callback(hObject, eventdata, handles)
% hObject    handle to a7Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in a6Button.
function a6Button_Callback(hObject, eventdata, handles)
% hObject    handle to a6Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in a5Button.
function a5Button_Callback(hObject, eventdata, handles)
% hObject    handle to a5Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in a4Button.
function a4Button_Callback(hObject, eventdata, handles)
% hObject    handle to a4Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in a3Button.
function a3Button_Callback(hObject, eventdata, handles)
% hObject    handle to a3Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in a10Button.
function a10Button_Callback(hObject, eventdata, handles)
% hObject    handle to a10Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in d1Button.
function d1Button_Callback(hObject, eventdata, handles)
% hObject    handle to d1Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in c10Button.
function c10Button_Callback(hObject, eventdata, handles)
% hObject    handle to c10Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)


% --- Executes on button press in c9Button.
function c9Button_Callback(hObject, eventdata, handles)
% hObject    handle to c9Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in c8Button.
function c8Button_Callback(hObject, eventdata, handles)
% hObject    handle to c8Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in c7Button.
function c7Button_Callback(hObject, eventdata, handles)
% hObject    handle to c7Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in c6Button.
function c6Button_Callback(hObject, eventdata, handles)
% hObject    handle to c6Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in c5Button.
function c5Button_Callback(hObject, eventdata, handles)
% hObject    handle to c5Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in c4Button.
function c4Button_Callback(hObject, eventdata, handles)
% hObject    handle to c4Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in c3Button.
function c3Button_Callback(hObject, eventdata, handles)
% hObject    handle to c3Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in c2Button.
function c2Button_Callback(hObject, eventdata, handles)
% hObject    handle to c2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in c1Button.
function c1Button_Callback(hObject, eventdata, handles)
% hObject    handle to c1Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in b10Button.
function b10Button_Callback(hObject, eventdata, handles)
% hObject    handle to b10Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in b9Button.
function b9Button_Callback(hObject, eventdata, handles)
% hObject    handle to b9Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in b8Button.
function b8Button_Callback(hObject, eventdata, handles)
% hObject    handle to b8Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in b7Button.
function b7Button_Callback(hObject, eventdata, handles)
% hObject    handle to b7Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in b6Button.
function b6Button_Callback(hObject, eventdata, handles)
% hObject    handle to b6Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in b5Button.
function b5Button_Callback(hObject, eventdata, handles)
% hObject    handle to b5Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in b4Button.
function b4Button_Callback(hObject, eventdata, handles)
% hObject    handle to b4Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in b3Button.
function b3Button_Callback(hObject, eventdata, handles)
% hObject    handle to b3Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in b2Button.
function b2Button_Callback(hObject, eventdata, handles)
% hObject    handle to b2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in e8Button.
function e8Button_Callback(hObject, eventdata, handles)
% hObject    handle to e8Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in e7Button.
function e7Button_Callback(hObject, eventdata, handles)
% hObject    handle to e7Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in e6Button.
function e6Button_Callback(hObject, eventdata, handles)
% hObject    handle to e6Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in e5Button.
function e5Button_Callback(hObject, eventdata, handles)
% hObject    handle to e5Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in e4Button.
function e4Button_Callback(hObject, eventdata, handles)
% hObject    handle to e4Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in e3Button.
function e3Button_Callback(hObject, eventdata, handles)
% hObject    handle to e3Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in e2Button.
function e2Button_Callback(hObject, eventdata, handles)
% hObject    handle to e2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in e1Button.
function e1Button_Callback(hObject, eventdata, handles)
% hObject    handle to e1Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in d10Button.
function d10Button_Callback(hObject, eventdata, handles)
% hObject    handle to d10Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in d9Button.
function d9Button_Callback(hObject, eventdata, handles)
% hObject    handle to d9Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in d8Button.
function d8Button_Callback(hObject, eventdata, handles)
% hObject    handle to d8Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in d7Button.
function d7Button_Callback(hObject, eventdata, handles)
% hObject    handle to d7Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in d6Button.
function d6Button_Callback(hObject, eventdata, handles)
% hObject    handle to d6Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in d5Button.
function d5Button_Callback(hObject, eventdata, handles)
% hObject    handle to d5Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in d4Button.
function d4Button_Callback(hObject, eventdata, handles)
% hObject    handle to d4Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in d3Button.
function d3Button_Callback(hObject, eventdata, handles)
% hObject    handle to d3Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in d2Button.
function d2Button_Callback(hObject, eventdata, handles)
% hObject    handle to d2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in g10Button.
function g10Button_Callback(hObject, eventdata, handles)
% hObject    handle to g10Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in f10Button.
function f10Button_Callback(hObject, eventdata, handles)
% hObject    handle to f10Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in f9Button.
function f9Button_Callback(hObject, eventdata, handles)
% hObject    handle to f9Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in f8Button.
function f8Button_Callback(hObject, eventdata, handles)
% hObject    handle to f8Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in f6Button.
function f6Button_Callback(hObject, eventdata, handles)
% hObject    handle to f6Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in f7Button.
function f7Button_Callback(hObject, eventdata, handles)
% hObject    handle to f7Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in f5Button.
function f5Button_Callback(hObject, eventdata, handles)
% hObject    handle to f5Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in f4Button.
function f4Button_Callback(hObject, eventdata, handles)
% hObject    handle to f4Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in f3Button.
function f3Button_Callback(hObject, eventdata, handles)
% hObject    handle to f3Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in f2Button.
function f2Button_Callback(hObject, eventdata, handles)
% hObject    handle to f2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in f1Button.
function f1Button_Callback(hObject, eventdata, handles)
% hObject    handle to f1Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in e10Button.
function e10Button_Callback(hObject, eventdata, handles)
% hObject    handle to e10Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in e9Button.
function e9Button_Callback(hObject, eventdata, handles)
% hObject    handle to e9Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in i5Button.
function i5Button_Callback(hObject, eventdata, handles)
% hObject    handle to i5Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in i4Button.
function i4Button_Callback(hObject, eventdata, handles)
% hObject    handle to i4Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in i3Button.
function i3Button_Callback(hObject, eventdata, handles)
% hObject    handle to i3Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in i2Button.
function i2Button_Callback(hObject, eventdata, handles)
% hObject    handle to i2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in i1Button.
function i1Button_Callback(hObject, eventdata, handles)
% hObject    handle to i1Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in h10Button.
function h10Button_Callback(hObject, eventdata, handles)
% hObject    handle to h10Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in h9Button.
function h9Button_Callback(hObject, eventdata, handles)
% hObject    handle to h9Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in h8Button.
function h8Button_Callback(hObject, eventdata, handles)
% hObject    handle to h8Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in h7Button.
function h7Button_Callback(hObject, eventdata, handles)
% hObject    handle to h7Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in h6Button.
function h6Button_Callback(hObject, eventdata, handles)
% hObject    handle to h6Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in h5Button.
function h5Button_Callback(hObject, eventdata, handles)
% hObject    handle to h5Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in h4Button.
function h4Button_Callback(hObject, eventdata, handles)
% hObject    handle to h4Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in h3Button.
function h3Button_Callback(hObject, eventdata, handles)
% hObject    handle to h3Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in h2Button.
function h2Button_Callback(hObject, eventdata, handles)
% hObject    handle to h2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in h1Button.
function h1Button_Callback(hObject, eventdata, handles)
% hObject    handle to h1Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in g9Button.
function g9Button_Callback(hObject, eventdata, handles)
% hObject    handle to g9Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in g8Button.
function g8Button_Callback(hObject, eventdata, handles)
% hObject    handle to g8Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in g7Button.
function g7Button_Callback(hObject, eventdata, handles)
% hObject    handle to g7Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in g6Button.
function g6Button_Callback(hObject, eventdata, handles)
% hObject    handle to g6Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in g5Button.
function g5Button_Callback(hObject, eventdata, handles)
% hObject    handle to g5Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in g4Button.
function g4Button_Callback(hObject, eventdata, handles)
% hObject    handle to g4Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in g3Button.
function g3Button_Callback(hObject, eventdata, handles)
% hObject    handle to g3Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in g2Button.
function g2Button_Callback(hObject, eventdata, handles)
% hObject    handle to g2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in g1Button.
function g1Button_Callback(hObject, eventdata, handles)
% hObject    handle to g1Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in j10Button.
function j10Button_Callback(hObject, eventdata, handles)
% hObject    handle to j10Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in j9Button.
function j9Button_Callback(hObject, eventdata, handles)
% hObject    handle to j9Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in j8Button.
function j8Button_Callback(hObject, eventdata, handles)
% hObject    handle to j8Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in j7Button.
function j7Button_Callback(hObject, eventdata, handles)
% hObject    handle to j7Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in i6Button.
function i6Button_Callback(hObject, eventdata, handles)
% hObject    handle to i6Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in j6Button.
function j6Button_Callback(hObject, eventdata, handles)
% hObject    handle to j6Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in j5Button.
function j5Button_Callback(hObject, eventdata, handles)
% hObject    handle to j5Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in j4Button.
function j4Button_Callback(hObject, eventdata, handles)
% hObject    handle to j4Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in j3Button.
function j3Button_Callback(hObject, eventdata, handles)
% hObject    handle to j3Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in j2Button.
function j2Button_Callback(hObject, eventdata, handles)
% hObject    handle to j2Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in j1Button.
function j1Button_Callback(hObject, eventdata, handles)
% hObject    handle to j1Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

 BoardChoiceDisplayUpdate(handles)
% --- Executes on button press in i10Button.
function i10Button_Callback(hObject, eventdata, handles)
% hObject    handle to i10Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in i9Button.
function i9Button_Callback(hObject, eventdata, handles)
% hObject    handle to i9Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in i8Button.
function i8Button_Callback(hObject, eventdata, handles)
% hObject    handle to i8Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in i7Button.
function i7Button_Callback(hObject, eventdata, handles)
% hObject    handle to i7Button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 BoardChoiceDisplayUpdate(handles)

% --- Executes on button press in playButton.
function playButton_Callback(hObject, eventdata, handles)
% hObject    handle to playButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

imageChange=OutputBoardChoiceDisplayUpdate(handles);
[Strat1MoveRowArray,Strat1MoveColArray, Strat1HitMissArray]=strategyOne(handles);
[Strat2MoveRowArray,Strat2MoveColArray, Strat2HitMissArray]=randomTargeting3(handles);
[Strat3MoveRowArray,Strat3MoveColArray, Strat3HitMissArray]=parityWithOutputs(handles);
[Strat4MoveRowArray,Strat4MoveColArray, Strat4HitMissArray]=probabilityonlyGUI(handles);
[Strat5MoveRowArray,Strat5MoveColArray, Strat5HitMissArray]=probabilitytargetingGUI(handles);
runGame(handles, imageChange, Strat1MoveRowArray,Strat1MoveColArray, Strat1HitMissArray,Strat2MoveRowArray,Strat2MoveColArray, Strat2HitMissArray,Strat3MoveRowArray,Strat3MoveColArray, Strat3HitMissArray, Strat4MoveRowArray,Strat4MoveColArray, Strat4HitMissArray,Strat5MoveRowArray,Strat5MoveColArray, Strat5HitMissArray)

randper=randomPlot(handles);
randtarper=targetingPlot(handles);
parper=parityPlotting(handles);
probper=probabilityonly(handles);
probtarper=probabilitytargeting(handles);

nTrials = str2double(handles.trialsText.String);

x=linspace(1,nTrials,nTrials);

if nTrials > 30
    plot(handles.graphDisplay,x,randper,'r',x,randtarper,'b',x,parper,'g', x,probper,'y',x,probtarper,'k')
    grid on
    xlabel(handles.graphDisplay,'Trial Number')
    ylabel(handles.graphDisplay,'Amount of turns')
    legend(handles.graphDisplay,{'Random','Random with Targeting','Parity with Targeting',...
                                 'Probability','Probability with Targeting'},'FontSize',5.8,...
                                 'Location','northeast')
    axis(handles.graphDisplay,[1,nTrials,1,150])
else
    plot(handles.graphDisplay,x,randper,'ro',x,randtarper,'bo',x,parper,'go', x,probper,'yo',x,probtarper,'ko')
    grid on
    xlabel(handles.graphDisplay,'Trial Number')
    ylabel(handles.graphDisplay,'Amount of turns')
    legend(handles.graphDisplay,{'Random','Random with Targeting','Parity with Targeting',...
                                 'Probability','Probability with Targeting'},'FontSize',5.8,...
                                 'Location','northeast')
    axis(handles.graphDisplay,[0,nTrials+1,1,150])
end

% --- Executes on button press in clearButton.
function clearButton_Callback(hObject, eventdata, handles)
% hObject    handle to clearButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
BoardClear(handles)


% --- Executes on selection change in shipPopup.
function shipPopup_Callback(hObject, eventdata, handles)
% hObject    handle to shipPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns shipPopup contents as cell array
%        contents{get(hObject,'Value')} returns selected item from shipPopup


% --- Executes during object creation, after setting all properties.
function shipPopup_CreateFcn(hObject, eventdata, handles)
% hObject    handle to shipPopup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in RandButton.
function RandButton_Callback(hObject, eventdata, handles)
% hObject    handle to RandButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 randomArray=randomPlacement(handles);
    randArray=arraysave(randomArray);
    handles.randTable.Data=randArray;
    randomArray2=array2one(randomArray);
    array2gui(handles,randomArray2)
    imageChoice=OutputBoardChoiceDisplayUpdate(handles);
    handles.shipPopup.Visible=0;
    BoardChoiceDisplayUpdate(handles);
