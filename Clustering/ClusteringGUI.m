function varargout = ClusteringGUI(varargin)
% CLUSTERINGGUI MATLAB code for ClusteringGUI.fig
%      CLUSTERINGGUI, by itself, creates a new CLUSTERINGGUI or raises the existing
%      singleton*.
%
%      H = CLUSTERINGGUI returns the handle to a new CLUSTERINGGUI or the handle to
%      the existing singleton*.
%
%      CLUSTERINGGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CLUSTERINGGUI.M with the given input arguments.
%
%      CLUSTERINGGUI('Property','Value',...) creates a new CLUSTERINGGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ClusteringGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ClusteringGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ClusteringGUI

% Last Modified by GUIDE v2.5 10-Dec-2018 15:16:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ClusteringGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ClusteringGUI_OutputFcn, ...
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

handles.term = 0;
handles.dnorm = 0;
handles.c1 = 0;
handles.c2 = 0;
handles.c3 = 0;

handles.m1a = 0;
handles.m1b = 0;
handles.m1c = 0;

handles.m2a = 0;
handles.m2b = 0;
handles.m2c = 0;

handles.m3a = 0;
handles.m3b = 0;
handles.m3c = 0;

handles.error = 0;
handles.itr = 0;
handles.matClust = 0;
handles.fname = '';
% --- Executes just before ClusteringGUI is made visible.
function ClusteringGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ClusteringGUI (see VARARGIN)

% Choose default command line output for ClusteringGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

axes(handles.axes6);
imshow('/Users/galihasmarandaru/Documents/ProgramSkripsi/Clustering/img/usd-logo.jpg');

% UIWAIT makes ClusteringGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ClusteringGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function doc_proses_Callback(hObject, eventdata, handles)
% hObject    handle to doc_proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of doc_proses as text
%        str2double(get(hObject,'String')) returns contents of doc_proses as a double

% --- Executes during object creation, after setting all properties.
function doc_proses_CreateFcn(hObject, eventdata, handles)
% hObject    handle to doc_proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in minmax.
function minmax_Callback(hObject, eventdata, handles)
% hObject    handle to minmax (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% uicontrol('Parent',handles.btn01)
% Hint: get(hObject,'Value') returns toggle state of minmax

% --- Executes on button press in zscore.
function zscore_Callback(hObject, eventdata, handles)
% hObject    handle to zscore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% uicontrol('Parent',handles.btn01)
% Hint: get(hObject,'Value') returns toggle state of zscore

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


% --- Executes on button press in browse.
function browse_Callback(hObject, eventdata, handles)
% hObject    handle to browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename, pathname] = uigetfile('*.mat',...
   'Select One or More Files', ...
   'MultiSelect', 'on');
fullpathname = strcat(pathname, filename);
dt = open(filename);

handles.term = dt.dt;
handles.fname = filename;
guidata(hObject, handles);

isiFname = sprintf(handles.fname);
set(handles.text_browse, 'String', isiFname );
% --- Executes on button press in proses.
function proses_Callback(hObject, eventdata, handles)
% hObject    handle to proses (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% norm = get(handles.button_normalisasi,'String');
% dist_clustering = get(handles.button_clustering,'String');
% dist_error = get(handles.button_error,'String');
% try
    cr_pca = get(handles.ciri_pca,'String');
    pca = str2double(char(cr_pca));

    switch get(get(handles.button_normalisasi,'SelectedObject'),'Tag')
           case 'minmax' 
               norm = 'minmaxNorm';
           case 'zscore'  
               norm = 'zscoreNorm';
    end

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

    dt = handles.term;

    %% Hitung Bobot
    [W,n,k] = hitungBobot(dt);

    %% Reduksi Dimensi Data
    % Principal Component Analysis
    pcaMat = pcaMethod(W,pca);
    testing = pcaMat(end-4:end,:);
    trainMat = pcaMat(1:end-5,:);

    save('/Users/galihasmarandaru/Documents/ProgramSkripsi/Clustering/Matriks/testing.mat','testing')
    %% Hitung Normalisasi
    normData = normalisasi(trainMat, norm);
    handles.dnorm = normData;

    %% Clustering
    [C1,C2,C3,sortX] = varIn(normData);
    [matClustering,jumlahIterasi] = kMeans(normData,C1,C2,C3,clust);

    handles.c1 = C1;
    handles.c2 = C2;
    handles.c3 = C3;
    %% Diagram dan Akurasi

    error = silhouetteCoeff(trainMat, matClustering(1:end,1), err);

    errPer = strcat(num2str((sum(error>0)/300)*100),"%");

    handles.error = errPer;
    set(handles.txt_total_error, 'String', handles.error);

    % Error
    bar(handles.error_diagram,error,'FaceColor',[0 .5 .5],'EdgeColor',[0 .9 .9],'LineWidth',1.5);

    xlabel(handles.error_diagram,'Jumlah Dokumen')
    ylabel(handles.error_diagram,'Data Error')

    % Clustering
    [doc,iterasi] = size(jumlahIterasi);
    handles.itr = iterasi;
    set(handles.txt_iterasi, 'String', handles.itr);

    for i=1:300
        idx{i,1} = horzcat('Dokumen Ke-',num2str(i),'.html');
    end

    mat0 = num2cell(matClustering);
    mat1 = {mat0,idx};
    mat1 = [mat1{:}];
    mat1 = sortrows(mat1,1);
    mat2 = sortrows(matClustering,1);

    dt1 = sum(mat2(:,1)==1);
    dt2 = sum(mat2(:,1)==2);
    dt3 = sum(mat2(:,1)==3);

    dataTotal = [dt1,dt2,dt3];

    pie(handles.cluster_diagram,dataTotal);

    legend(handles.cluster_diagram,'Kel1','Kel2','Kel3')

    % Table
    set(handles.uitable2, 'data', mat1);
    guidata(hObject, handles);
    
    % Percentage
    [m1a,m1b,m1c,m2a,m2b,m2c,m3a,m3b,m3c]  = percentClust(matClustering);
    
    handles.m1a = m1a;
    set(handles.kontra1, 'String', handles.m1a);
    handles.m1b = m1b;
    set(handles.kontra2, 'String', handles.m1b);
    handles.m1c = m1c;
    set(handles.kontra3, 'String', handles.m1c);
    
    handles.m2a = m2a;
    set(handles.netral1, 'String', handles.m2a);
    handles.m2b = m2b;
    set(handles.netral2, 'String', handles.m2b);
    handles.m2c = m2c;
    set(handles.netral3, 'String', handles.m2c);
    
    handles.m3a = m3a;
    set(handles.pro1, 'String', handles.m3a);
    handles.m3b = m3b;
    set(handles.pro2, 'String', handles.m3b);
    handles.m3c = m3c;
    set(handles.pro3, 'String', handles.m3c);
    
% catch e
%     e = errordlg('Ada input salah atau tidak lengkap','File Error');
% end
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


% --- Executes during object creation, after setting all properties.
function text_browse_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function text_browse_Callback(hObject, eventdata, handles)
% hObject    handle to text_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of text_browse as text
%        str2double(get(hObject,'String')) returns contents of text_browse as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text_browse (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes when selected object is changed in button_normalisasi.
function button_normalisasi_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in button_normalisasi 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% btn01 = handles.uibuttongroup('Units','Normalized');


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


% --- Executes when entered data in editable cell(s) in uitable1.
function uitable1_CellEditCallback(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  structure with the following fields (see MATLAB.UI.CONTROL.TABLE)
%	Indices: row and column indices of the cell(s) edited
%	PreviousData: previous data for the cell(s) edited
%	EditData: string(s) entered by the user
%	NewData: EditData or its converted form set on the Data property. Empty if Data was not changed
%	Error: error string when failed to convert EditData to appropriate value for Data
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on slider movement.
function slider3_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function ciri_pca_Callback(hObject, eventdata, handles)
% hObject    handle to ciri_pca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ciri_pca as text
%        str2double(get(hObject,'String')) returns contents of ciri_pca as a double


% --- Executes during object creation, after setting all properties.
function ciri_pca_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ciri_pca (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset_button.
function reset_button_Callback(hObject, eventdata, handles)
% hObject    handle to reset_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.text_browse,'string',num2str(''));
set(handles.ciri_pca,'string',num2str(''));

set(handles.kontra1,'string',num2str(''));
set(handles.kontra2,'string',num2str(''));
set(handles.kontra3,'string',num2str(''));

set(handles.netral1,'string',num2str(''));
set(handles.netral2,'string',num2str(''));
set(handles.netral3,'string',num2str(''));

set(handles.pro1,'string',num2str(''));
set(handles.pro2,'string',num2str(''));
set(handles.pro3,'string',num2str(''));
% Table
set(handles.uitable2, 'Data', {})
set(handles.txt_iterasi,'string',num2str(''));
% % Diagram Bar1
axes(handles.cluster_diagram);
cla reset;
% % Diagram Bar2
axes(handles.error_diagram);
set(handles.txt_total_error,'string',num2str(''));
cla reset;

% --- Executes on button press in uji_data.
function uji_data_Callback(hObject, eventdata, handles)
% hObject    handle to uji_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% figure;
% LastName = {'Smith';'Johnson';'Williams';'Jones';'Brown'};
% Age = [38;43;38;40;49];
% Height = [71;69;64;67;64];
% Weight = [176;163;131;133;119];
% T = table(Age,Height,Weight,'RowNames',LastName);
% 
% uitable('Data',T{:,:},'ColumnName',T.Properties.VariableNames,...
%     'RowName',T.Properties.RowNames,'Units', 'Normalized', 'Position',[0, 0, 1, 1]);
% normData = handles.dnorm;
% C1 = handles.c1;
% C2 = handles.c2;
% C3 = handles.c3;
dataTunggal
