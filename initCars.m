% initCars.m
function cars = initCars( freq, totalCars, tmax, strategy)
%INITCARS Computes the initial parameters fo all cars.
cars=zeros(totalCars, 9);
% (x,1): actual position:   .ID
% (x,2): last position:   .ID
% (x,3): origin: [1:4]
% (x,4): destination [1:4]
% (x,5): queue: 0=not queuing, 1=queuing
% (x,6): Start time of agent
% (x,7): state: 1=not yet started, 0=driving, 2=finished
% (x,8): start: first cases case driven
% (x,9): arrival time
%%% init of starting times:%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if tmax ==-1 
    cars=[0,0,4,1,0,1,1,280,0;0,0,4,2,0,2,1,280,0;0,0,4,3,0,3,1,200,0];
    
    totalCars=3;
else
randnbs=floor(tmax*rand(totalCars, 1));
randnbs=sort(randnbs);
cars(:,6)=randnbs;
%%% init of states %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
cars(:,7)=ones(totalCars,1);
%%% init of origins and destinations%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
randnbs=100*rand(totalCars,3);

for i=1:totalCars
    if randnbs(i,1)<=freq(1,1) % Origin 1
        cars(i,3)=1;
        if randnbs(i,2)<= freq(1,2)
            cars(i,4)=2;
            cars(i,8)=220;
        elseif randnbs(i,2)<= freq(1,2)+freq(1,3)
            cars(i,4)=3;
            if(randnbs(i,3)<strategy(1))
                cars(i,8)=140; % initializ of first cases   
            else cars(i,8)=220;
            end
        else
            cars(i,4)=4;
            if(randnbs(i,3)<strategy(2))
                cars(i,8)=140; % initializ of first cases   
            else cars(i,8)=220;
            end
        end
    elseif randnbs(i,1)<=freq(1,1)+freq(2,1)
        cars(i,3)=2;
        if randnbs(i,2)<= freq(2,2) %right turning
            cars(i,4)=3;
            cars(i,8)=240;
    elseif randnbs(i,2)<= freq(2,2)+freq(2,3) %straight
        cars(i,4)=4;
        if(randnbs(i,3)<strategy(1)) cars(i,8)=160; % initializ of first cases   
              
        else cars(i,8)=240;
        end
    else %left turn
        cars(i,4)=1;
        if(randnbs(i,3)<strategy(2)) cars(i,8)=160; % init of first cases
              
        else cars(i,8)=240;
        end
    end
elseif randnbs(i,1)<=freq(1,1)+freq(2,1)+freq(3,1)
    cars(i,3)=3;
    if randnbs(i,2)<= freq(1,2) %right turning
        cars(i,4)=4;
        cars(i,8)=260;
    elseif randnbs(i,2)<= freq(3,2)+freq(3,3) %straight
        cars(i,4)=1;
        if(randnbs(i,3)<strategy(1)) cars(i,8)=180; % init of first cases
              
        else cars(i,8)=260;
        end
    else %left turn
        cars(i,4)=2;
        if(randnbs(i,3)<strategy(2)) cars(i,8)=180; % init of first cases
        else cars(i,8)=260;
        end
    end
 else
    cars(i,3)=4;
    if randnbs(i,2)<= freq(4,2) %right turning
        cars(i,4)=1;
        cars(i,8)=280;
    elseif randnbs(i,2)<= freq(4,2)+freq(4,3) %straight
        cars(i,4)=2;
        if(randnbs(i,3)<strategy(1)) cars(i,8)=200; % init of first cases
    else cars(i,8)=280;
        end
    else %left turn
        cars(i,4)=3;
        if(randnbs(i,3)<strategy(2)) cars(i,8)=200; % init of first cases
        else cars(i,8)=280;
        end
    end
 end

end
end
%cars