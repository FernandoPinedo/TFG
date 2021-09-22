% Listing 7: moveCarToCross.m
function [cars, cases] = moveCarToCross(cars, cases, time,s,sem,sem4)
prob=5;
for caseID = 281 : 304
switch caseID
%%%%%%%%%%%%%%%%%% CARS WANTING TO ENTER THE INNER LANE
%%%%%%%%%%%%%%%%%%%%%%%%%%%

       case 299
           
    if cases(caseID,1)>0
        thisCar=cases(caseID,1);
        if (cases(39,1)==0 && cases(38,1)==0);
            cars(thisCar,2)=caseID; %last position
            cars(thisCar,1)=38; % move into roundabout
            cars(thisCar,5)=0; %not queuing
            cases(38,1)=cases(caseID,1);
            cases(caseID,1)=0;
        elseif cars(thisCar,2)==cars(thisCar,1)
            cars(thisCar,5)=1; %queuing
        else
            cars(thisCar,2)=caseID; %not yet queuing
        end
    end
    
       case 293
    if cases(caseID,1)>0
        thisCar=cases(caseID,1);
        if (cases(59,1)==0 && cases(58,1)==0);
            cars(thisCar,2)=caseID; %last position
            cars(thisCar,1)=58; % move into roundabout
            cars(thisCar,5)=0; %not queuing
            cases(58,1)=cases(caseID,1);
            cases(caseID,1)=0;
        elseif cars(thisCar,2)==cars(thisCar,1)
            cars(thisCar,5)=1; %queuing
        else
            cars(thisCar,2)=caseID; %not yet queuing
        end
    end
       case 287
    if cases(caseID,1)>0
        thisCar=cases(caseID,1);
        if (cases(79,1)==0 && cases(78,1)==0);
            cars(thisCar,2)=caseID; %last position
            cars(thisCar,1)=78; % move into roundabout
            cars(thisCar,5)=0; %not queuing
            cases(78,1)=cases(caseID,1);
            cases(caseID,1)=0;
        elseif cars(thisCar,2)==cars(thisCar,1)
            cars(thisCar,5)=1; %queuing
        else
            cars(thisCar,2)=caseID; %not yet queuing
        end
    end
       case 281
    if cases(caseID,1)>0
        thisCar=cases(caseID,1);
        if (cases(19,1)==0 && cases(18,1)==0);
            cars(thisCar,2)=caseID; %last position
            cars(thisCar,1)=18; % move into roundabout
            cars(thisCar,5)=0; %not queuing
            cases(18,1)=cases(caseID,1);
            cases(caseID,1)=0;
        elseif cars(thisCar,2)==cars(thisCar,1)
            cars(thisCar,5)=1; %queuing
        else
            cars(thisCar,2)=caseID; %not yet queuing
        end
    end
    
%%--------------------------------------------------------------------------    
%%--------------------------------------------------------------------------    
    
  
    
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

for caseID = 121 : 280
switch caseID
%%%%%%%%%%%%%%%%%% CARS WANTING TO ENTER THE INNER LANE
%%%%%%%%%%%%%%%%%%%%%%%%%%%
case 121
    
    if cases(caseID,1)>0
        thisCar=cases(caseID,1);
        if min(sem4)>0
        origencoche=cars(thisCar,3);
    else 
        origencoche=0;
    end 
        if (cases(100,1)==0 && cases(120,1)==0 &&  100*rand()>prob && cases(81,1)==0 && cases(101,1)==0 && sem(s(1))==1 && origencoche==sem4(1));
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
        origencoche=cars(thisCar,3);
    else 
        origencoche=0;
    end 
        if (cases(96,1)==0 && cases(115,1)==0 && cases(95,1)==0 &&  100*rand()>prob && cases(116,1)==0 && sem(s(2))==2 && origencoche==sem4(2));
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
        origencoche=cars(thisCar,3);
    else 
        origencoche=0;
    end 
        if (cases(91,1)==0 && cases(110,1)==0 && cases(90,1)==0 &&  100*rand()>prob && cases(111,1)==0 && sem(s(3))==3 && origencoche==sem4(3));
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
        thisCar=cases(caseID,1);
        if min(sem4)>0
        origencoche=cars(thisCar,3);
    else 
        origencoche=0;
    end 
        if (cases(86,1)==0 && cases(105,1)==0 && cases(85,1)==0 &&  100*rand()>prob && cases(106,1)==0 && sem(s(4))==4 && origencoche==sem4(4));
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
    thisCar=cases(caseID,1);
    if min(sem4)>0
        origencoche=cars(thisCar,3);
    else 
        origencoche=0;
    end 
    if (cases(99,1)==0 && cases(100,1)==0 && sem(s(1))==1 &&  100*rand()>prob && origencoche==sem4(1));
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
    thisCar=cases(caseID,1);
    if min(sem4)>0
        origencoche=cars(thisCar,3);
    else 
        origencoche=0;
    end 
    if (cases(95,1)==0 && cases(94,1)==0 && sem(s(2))==2 &&  100*rand()>prob && origencoche==sem4(2));
        cars(thisCar,2)=caseID; %last positio
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
        thisCar=cases(caseID,1);
        if min(sem4)>0
        origencoche=cars(thisCar,3);
    else 
        origencoche=0;
    end 
        if (cases(90,1)==0 && cases(89,1)==0 && sem(s(3))==3 &&  100*rand()>prob && origencoche==sem4(3));
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
        thisCar=cases(caseID,1);
        if min(sem4)>0
        origencoche=cars(thisCar,3);
    else 
        origencoche=0;
    end 
        if (cases(85,1)==0 && cases(84,1)==0 && sem(s(4))==4 &&  100*rand()>prob && origencoche==sem4(4));
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
    %%--------------------------------------------------------------------------    
    %%--------------------------------------------------------------------------    
    % Aqui empiezan los carriles atajo   
    case 203
    if cases(caseID,1)>0
        thisCar=cases(caseID,1);
            if(cars(thisCar,4)==2)
                            if (cases(304,1)==0 && cars(thisCar,4)==2 &&  100*rand()>prob);
                                cars(thisCar,2)=caseID; %last position
                                cars(thisCar,1)=304; % move into roundabout
                                cars(thisCar,5)=0; %not queuing
                                cases(304,1)=cases(caseID,1);
                                cases(caseID,1)=0;
                            elseif cars(thisCar,2)==cars(thisCar,1)
                                cars(thisCar,5)=1; %queuing
                            else
                                cars(thisCar,2)=caseID; %not yet queuing
                            end
            else
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
    
    case 223
    if cases(caseID,1)>0
        thisCar=cases(caseID,1);
        if(cars(thisCar,4)==3)
                            if (cases(298,1)==0 && cars(thisCar,4)==3 &&  100*rand()>prob);
                                cars(thisCar,2)=caseID; %last position
                                cars(thisCar,1)=298; % move into roundabout
                                cars(thisCar,5)=0; %not queuing
                                cases(298,1)=cases(caseID,1);
                                cases(caseID,1)=0;
                            elseif cars(thisCar,2)==cars(thisCar,1)
                                cars(thisCar,5)=1; %queuing
                            else
                                cars(thisCar,2)=caseID; %not yet queuing
                            end
       else
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
    
    
      case 243
    if cases(caseID,1)>0
        thisCar=cases(caseID,1);
             if(cars(thisCar,4)==4)
                            if (cases(292,1)==0 && cars(thisCar,4)==4 &&  100*rand()>prob);
                                cars(thisCar,2)=caseID; %last position
                                cars(thisCar,1)=292; % move into roundabout
                                cars(thisCar,5)=0; %not queuing
                                cases(292,1)=cases(caseID,1);
                                cases(caseID,1)=0;
                            elseif cars(thisCar,2)==cars(thisCar,1)
                                cars(thisCar,5)=1; %queuing
                            else
                                cars(thisCar,2)=caseID; %not yet queuing
                            end
            else
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
    
 case 263
    if cases(caseID,1)>0
        thisCar=cases(caseID,1);
            if(cars(thisCar,4)==1)
                                    if (cases(286,1)==0 && cars(thisCar,4)==1 &&  100*rand()>prob);
                                        cars(thisCar,2)=caseID; %last position
                                        cars(thisCar,1)=286; % move into roundabout
                                        cars(thisCar,5)=0; %not queuing
                                        cases(286,1)=cases(caseID,1);
                                        cases(caseID,1)=0;
                                    elseif cars(thisCar,2)==cars(thisCar,1)
                                        cars(thisCar,5)=1; %queuing
                                    else
                                        cars(thisCar,2)=caseID; %not yet queuing
                                    end
            else
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

    
%%--------------------------------------------------------------------------    
%%--------------------------------------------------------------------------    

    
    
    
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