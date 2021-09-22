% Listing 4: moveCarFromCross.m
function [cars, cases] = moveCarFromCross(cars, cases, time)
for caseID = 1 : 80
    if (caseID==1 ||caseID==21||caseID==41||caseID==61) %empty the exiting cars
        if cases(caseID,1)>0
            cars(cases(caseID,1),7)=2;
            cars(cases(caseID,1),9)=time;
            cases(caseID,1)=0;
        end
    elseif (cases(caseID,1) > 0) % if there is a car in this case number
        thisCar=cases(caseID,1);
        if(cases(caseID-1,1)==0) % if next case empty, drive forward
            cars(thisCar,2)=caseID; %last position
            cars(thisCar,1)=caseID-1; % actual position
            cars(thisCar,5)=0; %not queuing
            cases(caseID-1,1)=thisCar;
            cases(caseID,1)=0;
        elseif cars(thisCar,2)==cars(thisCar,1)
            cars(thisCar,5)=1; %queuing
        else
            cars(thisCar,2)=caseID; %not yet queuing
        end
    end
end

end


    