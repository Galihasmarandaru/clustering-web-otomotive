function varargout = dataTunggal(varargin)
% DATATUNGGAL MATLAB code for dataTunggal.fig
%      DATATUNGGAL, by itself, creates a new DATATUNGGAL or raises the existing
%      singleton*.
%
%      H = DATATUNGGAL returns the handle to a new DATATUNGGAL or the handle to
%      the existing singleton*.
%
%      DATATUNGGAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DATATUNGGAL.M with the given input arguments.
%
%      DATATUNGGAL('Property','Value',...) creates a new DATATUNGGAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before dataTunggal_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to dataTunggal_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help dataTunggal

% Last Modified by GUIDE v2.5 11-Dec-2018 00:54:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @dataTunggal_OpeningFcn, ...
                   'gui_OutputFcn',  @dataTunggal_OutputFcn, ...
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

handles.itr = 0;
handles.error = 0;
handles.term = 0;
handles.fname = '';
% --- Executes just before dataTunggal is made visible.
function dataTunggal_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to dataTunggal (see VARARGIN)

% Choose default command line output for dataTunggal
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes dataTunggal wait for user response (see UIRESUME)
% uiwait(handles.figure2);

% --- Outputs from this function are returned to the command line.
function varargout = dataTunggal_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.mat',...
   'Select One or More Files', ...
   'MultiSelect', 'on');
fullpathname = strcat(pathname, filename);
test = open(filename);

handles.term = test.testing;
handles.fname = filename;
guidata(hObject, handles);

isiFname = sprintf(handles.fname);
set(handles.text_browse, 'String', isiFname );

% --- Executes on button press in proses.
function proses_Callback(hObject, eventdata, handles)
% hObject    handle to proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% try
    h = findobj('Tag','figure1');

    % get handles and other user-defined data associated to Gui1
    g1data = guidata(h);
    % maybe you want to get some data that was saved to the Gui1 app
    C1 = g1data.c1;
    C2 = g1data.c2;
    C3 = g1data.c3;

    switch get(get(handles.button_clustering,'SelectedObject'),'Tag')
           case 'euc_c' 
               clust = 'euclidean';
           case 'cb_c'  
               clust = 'cityblock';
           case 'co_c'  
               clust = 'cosine';
    end

    switch get(get(handles.button_error,'SelectedObject'),'Tag')
           case 'euc_e' 
               err = 'euclidean';
           case 'cb_e'  
               err = 'cityblock';
           case 'co_e'  
               err = 'cosine';
    end
    
    testing = handles.term;
    
    [idxTesting,newDist] = hitungJarak(testing,C1,C2,C3,5,clust);

    %% Diagram dan Akurasi

    errorTesting = silhouetteCoeff(testing, idxTesting, err);

    errTestingMean = mean(errorTesting,1);

    handles.error = errTestingMean;
    set(handles.txt_total_error, 'String', handles.error);

    % Error
    bar(handles.error_diagram,errorTesting,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5);

    xlabel(handles.error_diagram,'Jumlah Dokumen')
    ylabel(handles.error_diagram,'Data Error')

    for i=1:5
        idx{i,1} = horzcat('Dokumen Ke-',num2str(i),'.html');
    end

    mat01 = num2cell(idxTesting);
    mat02 = num2cell(newDist);
    mat1 = {mat01,mat02,idx};
    mat1 = [mat1{:}];
    mat1 = sortrows(mat1,1);
    
    % Table
    set(handles.uitable1, 'data', mat1);
% catch e
%     e = errordlg('Ada input salah atau tidak lengkap','File Error');
% end

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in button_clustering.
function button_clustering_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in button_clustering 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% btn02 = handles.uibuttongroup('Units','Normalized');


% --- Executes when selected object is changed in button_error.
function button_error_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in button_error 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% btn03 = handles.uibuttongroup('Units','Normalized');


% --- Executes on button press in euc_c.
function euc_c_Callback(hObject, eventdata, handles)
% hObject    handle to euc_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% uicontrol('Parent',handles.btn02)
% Hint: get(hObject,'Value') returns toggle state of euc_c


% --- Executes on button press in cb_c.
function cb_c_Callback(hObject, eventdata, handles)
% hObject    handle to cb_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% uicontrol('Parent',handles.btn02)
% Hint: get(hObject,'Value') returns toggle state of cb_c


% --- Executes on button press in co_c.
function co_c_Callback(hObject, eventdata, handles)
% hObject    handle to co_c (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% uicontrol('Parent',handles.btn02)
% Hint: get(hObject,'Value') returns toggle state of co_c


% --- Executes on button press in euc_e.
function euc_e_Callback(hObject, eventdata, handles)
% hObject    handle to euc_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% uicontrol('Parent',handles.btn03)
% Hint: get(hObject,'Value') returns toggle state of euc_e


% --- Executes on button press in cb_e.
function cb_e_Callback(hObject, eventdata, handles)
% hObject    handle to cb_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% uicontrol('Parent',handles.btn03)
% Hint: get(hObject,'Value') returns toggle state of cb_e


% --- Executes on button press in co_e.
function co_e_Callback(hObject, eventdata, handles)
% hObject    handle to co_e (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% uicontrol('Parent',handles.btn03)
% Hint: get(hObject,'Value') returns toggle state of co_e


% --- Executes on button press in close.
function close_Callback(hObject, eventdata, handles)
% hObject    handle to close (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
