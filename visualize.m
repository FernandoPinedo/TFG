% Listing 10: visualize.m
function []=visualize(cases, show, queue)
    screen_size = get(0, 'ScreenSize');
    figHandle=figure(1);
    set(figHandle, 'Position', [0 0 screen_size(3) screen_size(3)/2] );
    clf;
    figure(figHandle);
%     subplot(2,2,[1 3])
    hold on;
    axis([-100 100 -100 100]);
    plot(cases(:,2),cases(:,3),'o','Color',[0.5 0.5 0.5]);
    occupied = find(cases(:,1) > 0);
    if( ~isempty(occupied) )
    figure(1)
        plot(cases(occupied,2), cases(occupied,3), 'vr','MarkerSize',8);

    end
%     subplot(2,2,2)
%     plot(1:length(queue),queue,'-r');
%     title('queuing statistics');
%     xlabel('time');
%     ylabel('cars queuing');
    %axis([0 2*tmax 0 25]);

