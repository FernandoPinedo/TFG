 % Listing 2: GEOM A: ROTONDA CON ATAJOS
 function cases = initGeomA(show)
 %INITGEOM Creates the geography of the Roundabout
 % Detailed explanation goes here
 % show: boolean, if the geometry should be shown.

 cases=zeros(280,6); %contains information about the possible positions
 % (x,1): occupied: car.ID if yes, 0 if empty
 % (x,2): x-coordinate of center
 % (x,3): y-coordinate of center

 %% computation of coordinates
 lane1=92:-4:16;
 lane2=16:4:92;

% cases no. 1 to 80: routes from the roundabout away, counting from east counter-
% clockwise
% cells 20, 40, 60, 80 are the first cell after the roundabout, counting down
% when driving away.
cases(1:20,2)=lane1;
cases(1:20,3)=-4;
cases(21:40,2)=4;
cases(21:40,3)=lane1;
cases(41:60,2)=-lane1;
cases(41:60,3)=4;
cases(61:80,2)=-4;
cases(61:80,3)=-lane1;
% Outer lane of the roundabout, counting from west counter-clockwise (???)
v = [0 4 8 10.5 12]';
cases(81:85,2:3)=[sort(v,'descend'), [-4 -8 -10.5 -12 -12]'];
cases(86,2:3)=[-4, -12];
cases(87,2:3)=[-8, -10.5];
cases(88,2:3)=[-10.5, -8];
cases(89,2:3)=[-12,-4];
cases(90,2:3)=[-12, 0];
cases(91:100,2:3)=-cases(81:90,2:3);
% Inner lane of the roundabout, counting from west counter-clockwise
cases(101,2:3)=[9,-3.5];
cases(102,2:3)=[8,-6.3];
cases(103,2:3)=[6.3,-8];
cases(104,2:3)=[3.5,-9];
cases(105,2:3)=[0,-9];
cases(106,2:3)=[-3.5,-9];
cases(107,2:3)=[-6.3,-8];
cases(108,2:3)=[-8,-6.3];
cases(109,2:3)=[-9,-3.5];
cases(110,2:3)=[-9,0];
cases(111:120,2:3)=-cases(101:110,2:3);
% Left street to the roundabout
cases(121:140,2)=lane2;     %carril entrada ESTE
cases(141:160,3)=lane2;     %carril entrada NORTE
cases(161:180,2)=-lane2;    %carril entrada OESTE
cases(181:200,3)=-lane2;    %carril entrada SUR
% Right street to the roundabout
%--------------------------CALZADA ESTE
cases(201:220,2)=lane2; %coordenada X
cases(201:220,3)=4;     %coordenada Y
%--------------------------CALZADA NORTE
cases(221:240,2)=-4;    %coordenada X
cases(221:240,3)=lane2; %coordenada Y
%--------------------------CALZADA OESTE
cases(241:260,2)=-lane2;%coordenada X
cases(241:260,3)=-4;    %coordenada Y
%--------------------------CALZADA SUR
cases(261:280,2)=4;     %coordenada X 
cases(261:280,3)=-lane2;%coordenada Y

[theta, rho]=cart2pol(cases(:,2),cases(:,3));

%% Carriles Extra
carril1x = [20.0486 ,16.0324,13 ,10.5 ,8  ,7      ];     %Posicion x del carril atajo
carril1y = [7       ,8.1361 ,10 ,13 ,16 ,20.0452];       %Posicion y del carril atajo
[lanex, laney]=cart2pol(carril1x,carril1y);   %coord polares para extrapolar a las demas calles
caso=-1;
 for i=0:pi/2:3*pi/2
     for j=1:1:6
         caso=caso+1;
     theta(304-caso)=(lanex(j)+i);
     rho(304-caso)=(laney(j));
     end
 end
 px=theta(281:length(theta));
 py=rho(281:length(rho));
 [cx,cy]=pol2cart(px,py);
 cases(281:304,2)= cx;
 cases(281:304,3)=cy;
%% Show the geometry


%  polarplot(theta,rho,'o');


 axis off
 end
