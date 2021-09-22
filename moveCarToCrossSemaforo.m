% Listing 7: moveCarToCross.m
function [cars, cases] = moveCarToCross(cars, cases, time,s,sem, sem4)
prob=5;
for caseID = 121 : 280

switch caseID
%%%%%%%%%%%%%%%%%% CARS WANTING TO ENTER THE INNER LANE
%%%%%%%%%%%%%%%%%%%%%%%%%%%
case 121
    if cases(caseID,1)>0
        comp=101;
    thisCar=cases(caseID,1);
    if min(sem4)>0
        destinocoche=cars(thisCar,4);
        origencoche=cars(thisCar,3);
    else 
        destinocoche=0;
        origencoche=0;
    end 
        if (cases(comp,1)==0 && cases(comp+1,1)==0 && cases(120,1)==0 && cases(comp-20,1)==0 && cases(comp-19,1)==0 && cases(100,1)==0 && sem(s(1))==1 && origencoche==sem4(1) && 100*rand()>prob &&  cases(119,1)==0);
%         if (cases(100,1)==0 && cases(120,1)==0 && cases(81,1)==0 && cases(101,1)==0 && sem(s(1))==1);
            cars(thisCar,2)=caseID; %last position
            cars(thisCar,1)=120; % move into roundabout
            cars(thisCar,5)=0; %not queuing
            cases(120,1)=cases(caseID,1);
            cases(caseID,1)=0;
        elseif cars(thisCar,2)==cars(thisCar,1)
            cars(thisCar,5)=1; %queuing
        else
            cars(thisCar,2)=caseID; %not yet queuing
        end
    end
 case 141
     if cases(caseID,1)>0
    thisCar=cases(caseID,1);
    if min(sem4)>0
        destinocoche=cars(thisCar,4);
        origencoche=cars(thisCar,3);
    else 
        destinocoche=0;
        origencoche=0;
    end 
        comp=115;
        if (cases(comp,1)==0 && cases(comp+1,1)==0 && cases(comp+2,1)==0 && cases(comp-20,1)==0 && cases(comp-19,1)==0 && cases(comp-18,1)==0 && sem(s(2))==2 && origencoche==sem4(2)&& 100*rand()>prob && cases(114,1)==0);
%         if (cases(96,1)==0 && cases(115,1)==0 && cases(95,1)==0 && cases(116,1)==0 && sem(s(2))==2);
        cars(thisCar,2)=caseID; %last position
        cars(thisCar,1)=115; % move into roundabout
        cars(thisCar,5)=0; %not queuing
        cases(115,1)=cases(caseID,1);
        cases(caseID,1)=0;
         elseif cars(thisCar,2)==cars(thisCar,1)
            cars(thisCar,5)=1; %queuing
         else
        cars(thisCar,2)=caseID; %not yet queuing
         end
      end
case 161
    if cases(caseID,1)>0
    thisCar=cases(caseID,1);
    if min(sem4)>0
        destinocoche=cars(thisCar,4);
        origencoche=cars(thisCar,3);
    else 
        destinocoche=0;
        origencoche=0;
    end 
        comp=110;
        if (cases(comp,1)==0 && cases(comp+1,1)==0 && cases(comp+2,1)==0 && cases(comp-20,1)==0 && cases(comp-19,1)==0 && cases(comp-18,1)==0 && sem(s(3))==3 && origencoche==sem4(3)&& 100*rand()>prob && cases(109,1)==0);
%         if (cases(91,1)==0 && cases(110,1)==0 && cases(90,1)==0 && cases(111,1)==0 && sem(s(3))==3);
            cars(thisCar,2)=caseID; %last position
            cars(thisCar,1)=110; % move into roundabout
            cars(thisCar,5)=0; %not queuing
            cases(110,1)=cases(caseID,1);
             cases(caseID,1)=0;
        elseif cars(thisCar,2)==cars(thisCar,1)
            cars(thisCar,5)=1; %queuing
        else
            cars(thisCar,2)=caseID; %not yet queuing
        end
    end
 case 181
    if cases(caseID,1)>0
        comp=105;
    thisCar=cases(caseID,1);
    if min(sem4)>0
        destinocoche=cars(thisCar,4);
        origencoche=cars(thisCar,3);
    else 
        destinocoche=0;
        origencoche=0;
    end 
        if (cases(comp,1)==0 && cases(comp+1,1)==0 && cases(comp+2,1)==0 && cases(comp-20,1)==0 && cases(comp-19,1)==0 && cases(comp-18,1)==0 && sem(s(4))==4 && origencoche==sem4(4)&& 100*rand()>prob && cases(104,1)==0);
%         if (cases(86,1)==0 && cases(105,1)==0 && cases(85,1)==0 && cases(106,1)==0 && sem(s(4))==4);
            cars(thisCar,2)=caseID; %last position
            cars(thisCar,1)=105; % move into roundabout
            cars(thisCar,5)=0; %not queuing
            cases(105,1)=cases(caseID,1);
            cases(caseID,1)=0;
        elseif cars(thisCar,2)==cars(thisCar,1)
            cars(thisCar,5)=1; %queuing
        else
            cars(thisCar,2)=caseID; %not yet queuing
        end
    end
case 201
if cases(caseID,1)>0
    comp=99;
    thisCar=cases(caseID,1);
    if min(sem4)>0
        destinocoche=cars(thisCar,4);
        origencoche=cars(thisCar,3);
    else 
        destinocoche=0;
        origencoche=0;
    end 
    if (cases(comp,1)==0 &&  cases(comp+1,1)==0 && cases(101,1)==0  && cases(81,1)==0 && cases(81,1)==0 && sem(s(1))==1 && origencoche==sem4(1)&& 100*rand()>prob && cases(98,1)==0);
%     if (cases(99,1)==0 && cases(100,1)==0 && sem(s(1))==1);
        cars(thisCar,2)=caseID; %last position
        cars(thisCar,1)=99; % move into roundabout
        cars(thisCar,5)=0; %not queuing
        cases(99,1)=cases(caseID,1);
        cases(caseID,1)=0;
    elseif cars(thisCar,2)==cars(thisCar,1)
        cars(thisCar,5)=1; %queuing
    else
        cars(thisCar,2)=caseID; %not yet queuing
    end
 end
 case 221
    if cases(caseID,1)>0
        comp=94;
    thisCar=cases(caseID,1);
    if min(sem4)>0
        destinocoche=cars(thisCar,4);
        origencoche=cars(thisCar,3);
    else 
        destinocoche=0;
        origencoche=0;
    end 
    if (cases(comp,1)==0 && cases(comp+1,1)==0 && cases(comp+2,1)==0 && cases(comp+22,1)==0 && sem(s(2))==2 && origencoche==sem4(2)&& 100*rand()>prob && cases(93,1)==0);
%     if (cases(95,1)==0 && cases(94,1)==0 && sem(s(2))==2);
        cars(thisCar,2)=caseID; %last position
        cars(thisCar,1)=94; % move into roundabout 31
        cars(thisCar,5)=0; %not queuing
        cases(94,1)=cases(caseID,1);
        cases(caseID,1)=0;
    elseif cars(thisCar,2)==cars(thisCar,1)
        cars(thisCar,5)=1; %queuing
    else
        cars(thisCar,2)=caseID; %not yet queuing
    end
 end
 case 241
    if cases(caseID,1)>0
        comp=89;
    thisCar=cases(caseID,1);
    if min(sem4)>0
        destinocoche=cars(thisCar,4);
        origencoche=cars(thisCar,3);
    else 
        destinocoche=0;
        origencoche=0;
    end 
     if (cases(comp,1)==0 && cases(comp+1,1)==0 && cases(comp+2,1)==0 && cases(comp+22,1)==0 && sem(s(3))==3 && origencoche==sem4(3)&& 100*rand()>prob && cases(88,1)==0);
%         if (cases(90,1)==0 && cases(89,1)==0 && sem(s(3))==3);
            cars(thisCar,2)=caseID; %last position
            cars(thisCar,1)=89; % move into roundabout
            cars(thisCar,5)=0; %not queuing
            cases(89,1)=cases(caseID,1);
            cases(caseID,1)=0;
        elseif cars(thisCar,2)==cars(thisCar,1)
            cars(thisCar,5)=1; %queuing
        else
            cars(thisCar,2)=caseID; %not yet queuing
        end
    end
 case 261
    if cases(caseID,1)>0
        comp=84;
    thisCar=cases(caseID,1);
    if min(sem4)>0
        destinocoche=cars(thisCar,4);
        origencoche=cars(thisCar,3);
    else 
        destinocoche=0;
        origencoche=0;
    end 
        if (cases(comp,1)==0 && cases(comp+1,1)==0 && cases(comp+2,1)==0 && cases(comp+22,1)==0 && sem(s(4))==4 && origencoche==sem4(4)&& 100*rand()>prob && cases(83,1)==0);
%         if (cases(85,1)==0 && cases(84,1)==0 && sem(s(4))==4);
            cars(thisCar,2)=caseID; %last position
            cars(thisCar,1)=84; % move into roundabout
            cars(thisCar,5)=0; %not queuing
            cases(84,1)=cases(caseID,1);
            cases(caseID,1)=0;
        elseif cars(thisCar,2)==cars(thisCar,1)
            cars(thisCar,5)=1; %queuing
        else
            cars(thisCar,2)=caseID; %not yet queuing
        end
    end
    otherwise
        if (cases(caseID,1) > 0) % if there is a car in this case number
            thisCar=cases(caseID,1);
            if(cases(caseID-1,1)==0) % if next case empty, drive forward
                cars(thisCar,2)=caseID; %last position
                cars(thisCar,1)=caseID-1; % actual position
                cars(thisCar,5)=0; %not queuing
                cases(caseID-1,1)=cases(caseID,1);
                cases(caseID,1)=0;
            elseif cars(thisCar,2)==cars(thisCar,1)
                cars(thisCar,5)=1; %queuing
            else
                cars(thisCar,2)=caseID; %not yet queuing
            end
        end
 end
 end
%%%%%%%%%% Entering cars %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 for i=1:size(cars)
    if (cars(i,6)>time)
       break;
    end
    if(cars(i,7)==1)
        switch(cars(i,8))
        case 140
            if(cases(140,1)==0)
                cases(140,1)=i;
                cars(i,7)=0; %state:driving
                cars(i,1)=140;
            end
        case 160
            if(cases(160,1)==0)
                cases(160,1)=i;
                cars(i,7)=0; %state:driving
                cars(i,1)=160;
            end
        case 180
            if(cases(180,1)==0)
                cases(180,1)=i;
                cars(i,7)=0; %state:driving
                cars(i,1)=180;
            end
        case 200
            if(cases(200,1)==0)
                cases(200,1)=i;
                cars(i,7)=0; %state:driving
                cars(i,1)=200;
            end
        case 220
            if(cases(220,1)==0)
                cases(220,1)=i;
                cars(i,7)=0; %state:driving
                cars(i,1)=220;
            end
        case 240
            if(cases(240,1)==0)
                cases(240,1)=i;
                cars(i,7)=0; %state:driving
                cars(i,1)=240;
            end
        case 260
            if(cases(260,1)==0)
                cases(260,1)=i;
                cars(i,7)=0; %state:driving
                cars(i,1)=260;
            end
        case 280
            if(cases(280,1)==0)
                cases(280,1)=i;
                cars(i,7)=0; %state:driving
                cars(i,1)=280;
            end
        end
 end
 end