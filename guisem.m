function varargout = guisem(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guisem_OpeningFcn, ...
                   'gui_OutputFcn',  @guisem_OutputFcn, ...
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


% --- Executes just before guisem is made visible.
function guisem_OpeningFcn(hObject, eventdata, handles, varargin) %#ok<*INUSL>

handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
svvalue = get(findobj('Tag', 'sectorverde'),'value');

set(handles.svdisplay, 'String', svvalue);
handles.svvalue=svvalue;
guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = guisem_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
handles.bucle=0;
handles.monitor=0;
handles.stop=0;
handles.rotonda=1;
handles.pausa=0.01;
svvalue=0.25;
% set(handles.svdisplay, 'String', svvalue);
handles.svvalue=svvalue;
set(findobj('Tag', 'edit2'),'string',1);
set(findobj('Tag', 'edit4'),'string',10);
 
% % Semaforo
semaforo = 1;
handles.semaforo=semaforo;
% % Monitior
monbut=findobj('Tag', 'checkbox2');
set(monbut,'value',1);
monitor = 1;
handles.monitor=monitor;
% % Estadisticas
statbut=findobj('Tag', 'checkbox1');
set(statbut,'value',1)
estadisticas = 1;
handles.estadisticas=estadisticas;

guidata(hObject, handles);
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
cla
set(handles.uipanel1,'visible','off');
set(handles.uipanel2,'visible','off');
ncochesstring = findobj('Tag', 'edit2');    %numero de coches recogido - edit2
% ncoches = get(ncochesstring,'string');  
ncoches=str2double(get(ncochesstring,'string'));
tmaxstring = findobj('Tag', 'edit4');    %tiempo maximo - edit4
% Tmax = get(ncochesstring,'string');
Tmax=str2double(get(tmaxstring,'string'));
monitor=handles.monitor;   %enseñar o no el movimiento de los coches en pantalla
semaforo=handles.semaforo; %elegir tipo de semaforo - popupmenu3
rotonda=handles.rotonda;     %tipo de rotonda - popupmenu2
pausa=handles.pausa;
svvalue=handles.svvalue;
cars=Main(ncoches,monitor,semaforo,rotonda,Tmax,pausa,svvalue); 
bucle=handles.bucle;    %bucle controla el array para las estadisticas en caso de ejecutar varias veces seguidas
bucle=bucle+1;
handles.bucle=bucle;
stats_show=handles.estadisticas;    %enseñar o no las estadisticas
if(stats_show)
axesHandle = findobj('Tag', 'axes2');
bar(axesHandle,(cars(:,9)-cars(:,6)))   %grafico de barras

set(axesHandle,'Tag', 'axes2')          %renombrar el tag de axes2 para volver a buscarlo en la sgte iteracion
media= sum((cars(:,9)-cars(:,6))/(length(cars(:,1))));  %tiempo medio que tardan los coches en pasar por la rotonda
refline(axesHandle,0,media);
medias(bucle)=media;                     %media total en caso de ejecutar el programa varias veces seguidas
handles.medias(bucle)=medias(bucle);
set(handles.text3, 'String', media);
set(handles.text8, 'String', sum(handles.medias)/length(handles.medias));
end

clear cases;
clear cars;

guidata(hObject, handles);
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)

% % % axesHandle = findobj('Tag', 'axes3');
% % % bar(axesHandle,(cars(:,9)-cars(:,6)))
% % % set(axesHandle,'Tag', 'axes3')
% % % media= sum((cars(:,9)-cars(:,6))/(length(cars)));
% % % set(handles.text5, 'String', media);
% hObject    handle to pushbutton2 (see GCBO)
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



function edit2_Callback(hObject, eventdata, handles)

% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


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


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
estadisticas = get(handles.checkbox1,'value')
handles.estadisticas=estadisticas;
guidata(hObject,handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1


% --- Executes on button press in checkbox2.
function checkbox2_Callback(hObject, eventdata, handles)
monitor = get(handles.checkbox2,'value')
handles.monitor=monitor;
guidata(hObject,handles)
% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox2guidata(hObject,handles);



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
handles.medias=[];
handles.bucle=0;
guidata(hObject,handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in checkbox3.
function checkbox3_Callback(hObject, eventdata, handles)
% % cla
% % show_semaforo = get(handles.checkbox3,'value')
% % handles.showsemaforo=show_semaforo;
% % guidata(hObject,handles)
% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox3


% --- Executes during object creation, after setting all properties.
function checkbox1_CreateFcn(hObject, eventdata, handles)

% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function checkbox2_CreateFcn(hObject, eventdata, handles)

% hObject    handle to checkbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function checkbox3_CreateFcn(hObject, eventdata, handles)

% hObject    handle to checkbox3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
cla
switch get(handles.popupmenu2,'Value')   
  case 1
        handles.rotonda=1;
        guidata(hObject,handles);        
  case 2
        handles.rotonda=2;
        guidata(hObject,handles);

end 
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


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


% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
cla
switch get(handles.popupmenu3,'Value')   
  case 1 %Sin Semaforo
        handles.semaforo=1;
        guidata(hObject,handles);        
  case 2 %Semaforo giratorio
        handles.semaforo=2;
        guidata(hObject,handles);
  case 3 %Semaforo inteligente
        handles.semaforo=3;
        guidata(hObject,handles);
  case 4 %Semaforo 4 sectores
        handles.semaforo=4;
        guidata(hObject,handles);
        
  case 5 %Semaforo 4 sectores dinamicos
        handles.semaforo=5;
    	guidata(hObject,handles);

end 
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit4_Callback(hObject, eventdata, handles)



% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)

% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Comparacion de todos las opciones
function pushbutton6_Callback(hObject, eventdata, handles)

cla

ncochesstring = findobj('Tag', 'edit2');    %numero de coches recogido - edit2
ncoches=str2double(get(ncochesstring,'string'));
tmaxstring = findobj('Tag', 'edit4');    %tiempo maximo - edit4
Tmax=str2double(get(tmaxstring,'string'));
monitor=0;   %enseñar o no el movimiento de los coches en pantalla
pausa=0;
svvalue=25;
for it=1:1:6
    switch it
        case 1
        semaforo=1;
        rotonda=1;
        case 2
        semaforo=2;
        rotonda=1;
        case 3
        semaforo=3;
        rotonda=1;
        case 4
        semaforo=1;
        rotonda=2;
        case 5
        semaforo=2;
        rotonda=2;
        case 6
        semaforo=3;
        rotonda=2;
    end

cars=Main(ncoches,monitor,semaforo,rotonda,Tmax,pausa, svvalue); 


bucle=handles.bucle;    %bucle controla el array para las estadisticas en caso de ejecutar varias veces seguidas
bucle=bucle+1;
handles.bucle=bucle;
stats_show=1;    %enseñar o no las estadisticas
media= sum((cars(:,9)-cars(:,6))/(length(cars(:,1))));  %tiempo medio que tardan los coches en pasar por la rotonda
medias(bucle)=media;                     %media total en caso de ejecutar el programa varias veces seguidas
handles.medias(bucle)=medias(bucle);

set(handles.text8, 'String', sum(handles.medias)/length(handles.medias));
if(stats_show)
    
    set(handles.uipanel1,'visible','on');
    set(handles.uipanel2,'visible','on');
        switch it
        case 1
            axesHandle = findobj('Tag', 'axes2');
            bar(axesHandle,(cars(:,9)-cars(:,6)))   %grafico de barras
            media= sum((cars(:,9)-cars(:,6))/(length(cars(:,1))));
            refline(axesHandle,0,media);    
            set(axesHandle,'Tag', 'axes2')          %renombrar el tag de axes2 para volver a buscarlo en la sgte iteracion
            set(handles.text3, 'String', media);
            xlabel(axesHandle,'Sin semáforo')
            ylabel(axesHandle,'Rotonda estándar')

        case 2
            axesHandle = findobj('Tag', 'axes3');
            bar(axesHandle,(cars(:,9)-cars(:,6)))   %grafico de barras
            media= sum((cars(:,9)-cars(:,6))/(length(cars(:,1))));
            refline(axesHandle,0,media);
            set(axesHandle,'Tag', 'axes3')          %renombrar el tag de axes2 para volver a buscarlo en la sgte iteracion
            set(handles.text12, 'String', media);
            xlabel(axesHandle,'Semáforo giratorio')

        case 3
            axesHandle = findobj('Tag', 'axes4');
            bar(axesHandle,(cars(:,9)-cars(:,6)))   %grafico de barras
            media= sum((cars(:,9)-cars(:,6))/(length(cars(:,1))));
            refline(axesHandle,0,media);
            set(axesHandle,'Tag', 'axes4')          %renombrar el tag de axes2 para volver a buscarlo en la sgte iteracion
            set(handles.text14, 'String', media);
            xlabel(axesHandle,'Semáforo inteligente')
 
        case 4
            axesHandle = findobj('Tag', 'axes5');
            bar(axesHandle,(cars(:,9)-cars(:,6)))   %grafico de barras
            media= sum((cars(:,9)-cars(:,6))/(length(cars(:,1))));
            refline(axesHandle,0,media);
            set(axesHandle,'Tag', 'axes5')          %renombrar el tag de axes2 para volver a buscarlo en la sgte iteracion
            set(handles.text16, 'String', media);
            ylabel(axesHandle,'Rotonda con carriles laterales')


        case 5
            axesHandle = findobj('Tag', 'axes6');
            bar(axesHandle,(cars(:,9)-cars(:,6)))   %grafico de barras
            media= sum((cars(:,9)-cars(:,6))/(length(cars(:,1))));
            refline(axesHandle,0,media);
            set(axesHandle,'Tag', 'axes6')          %renombrar el tag de axes2 para volver a buscarlo en la sgte iteracion
            set(handles.text18, 'String', media);

        case 6
            axesHandle = findobj('Tag', 'axes7');
            bar(axesHandle,(cars(:,9)-cars(:,6)))   %grafico de barras
            media= sum((cars(:,9)-cars(:,6))/(length(cars(:,1))));
            refline(axesHandle,0,media);
            set(axesHandle,'Tag', 'axes7')          %renombrar el tag de axes2 para volver a buscarlo en la sgte iteracion
            set(handles.text20, 'String', media);

         end



end

guidata(hObject, handles);
end
cla
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function text12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)

pausa = get(handles.slider1,'value');
if pausa==0 
    pausa=0.01;
end
handles.pausa=pausa/10;
guidata(hObject, handles);

% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in togglebutton2.
function togglebutton2_Callback(hObject, eventdata, handles)

switch get(handles.togglebutton2,'Value')   
  case 0
      set(handles.uibuttongroup2,'visible','off')
      
      
  case 1
      set(handles.uibuttongroup2,'visible','on')
end
 




% hObject    handle to togglebutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of togglebutton2


% --- Executes during object creation, after setting all properties.
function uibuttongroup2_CreateFcn(hObject, eventdata, handles)

% hObject    handle to uibuttongroup2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in prueba.
function prueba_Callback(hObject, eventdata, handles)
cla
set(handles.uipanel1,'visible','off');
set(handles.uipanel2,'visible','off');
% ncochesstring = findobj('Tag', 'edit2');    %numero de coches recogido - edit2
% % ncoches = get(ncochesstring,'string');  
ncoches=3;
% tmaxstring = findobj('Tag', 'edit4');    %tiempo maximo - edit4
% % Tmax = get(ncochesstring,'string');
Tmax=-1;
monitor=handles.monitor;   %enseñar o no el movimiento de los coches en pantalla
semaforo=1; %elegir tipo de semaforo - popupmenu3
rotonda=handles.rotonda;     %tipo de rotonda - popupmenu2
pausa=0.01;
cars=Main(ncoches,monitor,semaforo,rotonda,Tmax,pausa,1); 
bucle=handles.bucle;    %bucle controla el array para las estadisticas en caso de ejecutar varias veces seguidas
bucle=bucle+1;
handles.bucle=bucle;
stats_show=handles.estadisticas;    %enseñar o no las estadisticas
if(stats_show)
axesHandle = findobj('Tag', 'axes2');
bar(axesHandle,(cars(:,9)-cars(:,6)))   %grafico de barras


set(axesHandle,'Tag', 'axes2')          %renombrar el tag de axes2 para volver a buscarlo en la sgte iteracion
media= sum((cars(:,9)-cars(:,6))/(length(cars(:,1))));  %tiempo medio que tardan los coches en pasar por la rotonda
refline(axesHandle,0,media);

medias(bucle)=media;                     %media total en caso de ejecutar el programa varias veces seguidas
handles.medias(bucle)=medias(bucle);
set(handles.text3, 'String', media);
set(handles.text8, 'String', sum(handles.medias)/length(handles.medias));
end

clear cases;
clear cars;


% --- Executes on slider movement.
function sectorverde_Callback(hObject, eventdata, handles)

svvalue = get(handles.sectorverde,'value');

set(handles.svdisplay, 'String', svvalue);
handles.svvalue=svvalue;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function sectorverde_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sectorverde (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
set(findobj('Tag', 'sectorverde'),'value',25);



% --- Executes on slider movement.
function velocidadsemaforo_Callback(hObject, eventdata, handles)
velsem = get(handles.velocidadsemaforo,'value');
handles.pausa=velsem;
guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function velocidadsemaforo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to velocidadsemaforo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes during object creation, after setting all properties.
function svdisplay_CreateFcn(hObject, eventdata, handles)


% --- Executes on button press in uncuarto.
function uncuarto_Callback(hObject, eventdata, handles)
% hObject    handle to uncuarto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(findobj('Tag', 'sectorverde'),'value',25);
svvalue=25;
set(handles.svdisplay, 'String', svvalue);
handles.svvalue=svvalue;
guidata(hObject, handles);

% --- Executes on button press in doscuartos.
function doscuartos_Callback(hObject, eventdata, handles)
% hObject    handle to doscuartos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(findobj('Tag', 'sectorverde'),'value',50);
svvalue=50;
set(handles.svdisplay, 'String', svvalue);
handles.svvalue=svvalue;
guidata(hObject, handles);
