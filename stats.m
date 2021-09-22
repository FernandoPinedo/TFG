 function stats = stats(cars)
axesHandle = findobj('Tag', 'axes2');
bar(axesHandle,(cars(:,9)-cars(:,6)))
media= sum((cars(:,9)-cars(:,6))/(length(cars)));
set(handles.text3, 'String', media);
% bar(cars)
% %A
% figure(2)
% set('CurrentAxes','axes2')
%  bar(cars(:,9)-cars(:,6))
% for i=1:1:length(cars)
%    bars(cars(:,9)-cars(:,6)
% end
