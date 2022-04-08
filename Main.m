%% Default parameters
%   freq: 4x4-matrix:
%    (x,1): percentage of total traffic coming from direction x
%    (x,2): percentage of traffic from direction x turningr
%    (x,3): percentage of traffic from direction x going straight
%    (x,4): percentage of traffic from direction x turning left
%%%%%%%%%% scenario 1
function [cars]=Mainn(ncoches,monitor, semaforo,rotonda,tiempo,pausa,svvalue)

tmax=tiempo;
% escenario 1
%  freq = ...
%    [35 70 15 15;...
%     35 15 15 70;...
%     15 20 40 40;...
%     15 40 40 20];
% escenario 2
freq = ...
   [60 10 80 10;...
    20 80 10 10;...
    10 20 40 40;...
    10 10 10 80];


totalCars = ncoches; % totalCars = 7500;
coches=zeros(totalCars,7); %#ok<PREALL>

strategy = [0;100];
destino=['>', '^', '<', 'v']; 
color=['g', 'b', 'r', 'm'];   %Verde, azul, rojo, morado
show = 1;

%% Inicializar semaforo
tiposemaforo=semaforo;
sem=[4,3,2,1];
s=[1,2,3,4];
semaforo_cont=1;
semaforocolor=1;
semsube=1;
sembaja=0;
sectorverde=svvalue/100;
switch tiposemaforo
    case 2
        g=2*pi-pi/4-5*pi/30:-pi/30:-pi/4-5*pi/30;
        v=2*pi*sectorverde:-pi/30:0;
        r=2*pi:-pi/30:2*pi*sectorverde;
        x=15*cos(v);
        y=15*sin(v);
        X=15*cos(r);
        Y=15*sin(r);
        [T,R]=cart2pol(X,Y);
        [t,r]=cart2pol(x,y);

    case 3
        lucesx=[16.0561,-8.5554,-16.0561, 9.0242,];
        lucesy=[8.9070,16.1732, -8.6726, -15.4701];
        [tsem,rsem]=cart2pol(lucesx,lucesy);
    case 4
        g=2*pi-pi/4-5*pi/30:-pi/30:-pi/4-5*pi/30;
        v=2*pi:-pi/30:1.5*pi;
        a=0.5*pi:-pi/30:0;
        m=pi:-pi/30:0.5*pi;
        r=1.5*pi:-pi/30:pi;
        vx=15*cos(v);
        vy=15*sin(v);
        rx=15*cos(r);
        ry=15*sin(r);
        ax=15*cos(a);
        ay=15*sin(a);
        mx=15*cos(m);
        my=15*sin(m);
        [tr,rr]=cart2pol(rx,ry);
        [tv,rv]=cart2pol(vx,vy);
        [ta,ra]=cart2pol(ax,ay);
        [tm,rm]=cart2pol(mx,my);
    case 5
        vuelta=1;
        g=2*pi-pi/4-5*pi/30:-pi/30:-pi/4-5*pi/30;
        r=2*pi:-pi/30:1.5*pi;
        a=1.5*pi:-pi/30:pi;
        v=pi:-pi/30:0.5*pi;
        m=0.5*pi:-pi/30:0;
        vx=15*cos(v);
        vy=15*sin(v);
        rx=15*cos(r);
        ry=15*sin(r);
        ax=15*cos(a);
        ay=15*sin(a);
        mx=15*cos(m);
        my=15*sin(m);
        [tr,rr]=cart2pol(rx,ry);
        [tv,rv]=cart2pol(vx,vy);
        [ta,ra]=cart2pol(ax,ay);
        [tm,rm]=cart2pol(mx,my);
end
%% Initialize geometry and cars
switch rotonda
    case 1
cases = initGeom(show);
    case 2
cases = initGeomA(show);
end
cars = initCars( freq, totalCars, tmax, strategy);
%% initialize statistical variables
finalt=0;
coches=[];

%% Time loop
while(length(find(cars(:,7)==2))~=totalCars)
%%% loop until all cars have reached their destination
    finalt=finalt+1;
    
              %% Semaforo
switch tiposemaforo
        % Sin Semaforo 
        case 1 
            sem=[1,2,3,4];
            s=[1,2,3,4];
            sem4=zeros(1,4);
        case 2      
                sem4=zeros(1,4);
                semaforo_cont=semaforo_cont+1;
                if semaforo_cont==61 
                   semaforo_cont=1;
                end

         s=ones(1,4)*ceil(semaforo_cont/15);
         polarplot(t+(g(semaforo_cont)),r,'g');
         polarplot(T+g(semaforo_cont),R,'r');
         axis off
       
        % Semaforo inteligente
        case 3
%             sem=[4,3,2,1];
%             s=[1,1,1,1];
            sem4=zeros(1,4);
            cc(1)=length(vertcat(find(cases(121:140,1) > 0),find(cases(201:220,1) > 0))); %coches calle 1 ...
            cc(2)=length(vertcat(find(cases(141:160,1) > 0),find(cases(221:240,1) > 0)));
            cc(3)=length(vertcat(find(cases(161:180,1) > 0),find(cases(241:261,1) > 0)));
            cc(4)=length(vertcat(find(cases(181:200,1) > 0),find(cases(261:280,1) > 0))); %
            minimo=min(cc);
            
            for a=1:1:4
                if (cc(a)== minimo || cc(a)<minimo)
                    sem(a)=5;
                else
                    sem(a)=a;
                end
            end
            if (length(unique(sem))==1)  %comprobar si estan todos los semaforos en rojo
                sem=[1,2,3,4];
            end
            %semaforo 4 sectores
    case 4
         if semaforo_cont==1 
             semaforo_cont=61;
         end
         semaforo_cont=semaforo_cont-1;
         s=ones(1,4)*ceil(semaforo_cont/15);
         polarplot(tv+g(semaforo_cont),rv,'g'); 
         polarplot(tr+g(semaforo_cont),rr,'r');
         polarplot(ta+g(semaforo_cont),ra,'c');
         polarplot(tm+g(semaforo_cont),rm,'m');
         sline4=[1, 2, 4, 3];
         sem4v=horzcat(ones(1,15)*sline4(3),ones(1,15)*sline4(4), ones(1,15)*sline4(1),ones(1,15)*sline4(2));
         sem4vp= horzcat(sem4v(semaforo_cont:end), sem4v(1:semaforo_cont));
         sem4=horzcat(sem4vp(1),sem4vp(15),sem4vp(30),sem4vp(45));
         axis off
         s=[1,2,3,4];
         sem=[1,2,3,4];

    case 5
        vuelta=vuelta+1;
        g=2*pi-pi/4-5*pi/30:-pi/30:-pi/4-5*pi/30;
        gc=0.5*pi:-pi/60:-0.5*pi;
        
        if semsube
          semaforocolor=semaforocolor+1;
            if semaforocolor==61
               sembaja=1;
               semsube=0;
            end
        end
        if sembaja
            semaforocolor=semaforocolor-1;
            if semaforocolor==1
               sembaja=0;
               semsube=1;
            end
        end 
        r=2*pi:-pi/30:(1.5*pi-gc(semaforocolor));
        a=(1.5*pi-gc(semaforocolor)):-pi/30:pi;
        m=pi:-pi/30:(0.5*pi-gc(semaforocolor));
        v=(0.5*pi-gc(semaforocolor)):-pi/30:0;
        
        vx=15*cos(v);
        vy=15*sin(v);
        rx=15*cos(r);
        ry=15*sin(r);
        ax=15*cos(a);
        ay=15*sin(a);
        mx=15*cos(m);
        my=15*sin(m);
        [tr,rr]=cart2pol(rx,ry);
        [tv,rv]=cart2pol(vx,vy);
        [ta,ra]=cart2pol(ax,ay);
        [tm,rm]=cart2pol(mx,my);
        
         sem4v=horzcat(ones(1,length(v))*1,ones(1,length(m))*4, ones(1,length(a))*2,ones(1,length(r))*3);
         sem4vp= horzcat(sem4v(semaforo_cont:end), sem4v(1:semaforo_cont));
         sem4=horzcat(sem4vp(1),sem4vp(15),sem4vp(30),sem4vp(45))
         s=[1,2,3,4];
         sem=[1,2,3,4];
         

         if semaforo_cont==1 
             semaforo_cont=61;
         end
         semaforo_cont=semaforo_cont-1;
%          s=ones(1,4)*ceil(semaforo_cont/15);
         polarplot(tv+g(semaforo_cont),rv,'g'); 
         polarplot(tr+g(semaforo_cont),rr,'r');
         polarplot(ta+g(semaforo_cont),ra,'c');
         polarplot(tm+g(semaforo_cont),rm,'m');
         axis off
         sem=[1,2,3,4];

end  
            %% Movimiento de los coches           
    [cars, cases]=moveCarFromCross(cars, cases, finalt);
    [cars, cases] = moveCarOuterRoundabout(cars, cases);
    [cars, cases] = moveCarInnerRoundabout(cars, cases);
        switch rotonda
            case 1
            [cars, cases]=moveCarToCrossSemaforo(cars, cases, finalt,s,sem,sem4);
            case 2
            [cars, cases]=moveCarToCrossSemaforoA(cars, cases, finalt,s,sem,sem4);   
        end

    [theta, rho]=cart2pol(cases(:,2),cases(:,3));
                %% Dibujar en la pantalla
    if(monitor)
        
    polarplot(theta,rho,'o','Color',[0.5 0.5 0.5]);
    axis off
    hold on
    occupied = find(cases(:,1) > 0);
    if(tiposemaforo==3)
            for a=1:1:4
                if sem(a) == 5
                    polarplot (tsem(a),rsem(a),'o','Color','red');
                else 
                   polarplot (tsem(a),rsem(a),'o','Color','green');
                end
            end
    end
        if( ~isempty(occupied) )
               if( ~isempty(coches) )
                        delete(coches)
                        clear coches
               end
               for l=1:1:length(occupied)
                     
                      coches(l)=polarplot(theta(occupied(l)), rho(occupied(l)), destino(cars(cases(occupied(l),1),4)),'MarkerFaceColor', color(cars(cases(occupied(l),1),3)),'MarkerSize',8);
                      axis off
               end
        end
        pause(pausa);         
    end
end
delete(coches)
end
