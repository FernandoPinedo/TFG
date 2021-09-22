% Listing 6: moveCarOuterRoundabout.m
function [cars,cases] = moveCarOuterRoundabout(cars, cases)
% MOVECAROUTERROUNDABOUT Move all cars in the outer line of the roundabout
% cars: n x 7 - Matrix
% (x,1): actual position: cases.ID
% (x,2): last position: cases.ID
% (x,3): origin: [1:4]
% (x,4): destination [1:4]
%
% cases: n x 1 - Matrix
% (x,1): occupied: car.ID if yes, 0 if empty
% Algorithm:
% For each car, determine if it leaves at this exit. If yes,
% put it onto the road such that it can drive away from the roundabout.
% Else, push it forward in the roundabout.
%
%
% Note:
% This algorithm implies that if the car cannot exit, it stops.
for caseID = 81 : 100
    if(cases(caseID, 1) > 0) % if there is a car in this case number
        thisCar = cases(caseID, 1);
        switch caseID
            case 81
            % if car wants to leave here (road 1) and there is free space
            if(cars(thisCar,4) == 1)
                if(cases(20) == 0)
                    cars(thisCar,1) = 20; % new position find(cases(:,1) > 0);
                    cars(thisCar,2) = 81; % old position
                    cases(20) = cases(caseID, 1); % lock new cell
                    cases(81) = 0; % free old cell
                    cars(thisCar,5)=0;
                else
                    if cars(thisCar,2)==cars(thisCar,1)
                        cars(thisCar,5)=1;
                    end
                    cars(thisCar, 2)=cars(thisCar,1);
                end
            else % car doesn’t indicate, hence drives forward inside the roundabout
                if(cases(100) == 0)
                    cars(thisCar,1) = 100; % new position
                    cars(thisCar,2) = 81; % old position
                    cases(100) = cases(caseID, 1); % lock new cell
                    cases(81) = 0; % free old cell
                    cars(thisCar,5)=0; %no queuing
                else
                    if cars(thisCar,2)==cars(thisCar,1)
                       cars(thisCar,5)=1; %queuing
                    end
                    cars(thisCar,2)=cars(thisCar,1);
                end
            end

        case 86
            if(cars(thisCar,4) == 4)
                if(cases(80) == 0)
                    cars(thisCar,1) = 80;
                    cars(thisCar,2) = 86;
                    cases(80) = cases(caseID, 1);
                    cases(86) = 0;
                    cars(thisCar,5)=0; %no queuing
                else
                    if cars(thisCar,2)==cars(thisCar,1)
                        cars(thisCar,5)=1; %queuing
                    end
                    cars(thisCar, 2)=cars(thisCar,1);
                end
            else
                if(cases(85) == 0)
                    cars(thisCar,1) = 85;
                    cars(thisCar,2) = 86;
                    cases(85) = cases(caseID, 1);
                    cases(86) = 0;
                    cars(thisCar,5)=0; %no queuing
                else
                    if cars(thisCar,2)==cars(thisCar,1)
                        cars(thisCar,5)=1; %queuing
                    end
                    cars(thisCar, 2)=cars(thisCar,1);
                end
            end

        case 91
            if(cars(thisCar,4) == 3)
                if(cases(60) == 0)
                    cars(thisCar,1) = 60;
                    cars(thisCar,2) = 91;
                    cases(60) = cases(caseID, 1);
                    cases(91) = 0;
                    cars(thisCar,5)=0; %no queuing
                else
                    if cars(thisCar,2)==cars(thisCar,1)
                        cars(thisCar,5)=1; %queuing
                    end
                    cars(thisCar, 2)=cars(thisCar,1);
                end
            else
                if(cases(90) == 0)
                    cars(thisCar,1) = 90;
                    cars(thisCar,2) = 91;
                    cases(90) = cases(caseID, 1);
                    cases(91) = 0;
                    cars(thisCar,5)=0; %no queuing
                else
                    if cars(thisCar,2)==cars(thisCar,1)
                        cars(thisCar,5)=1; %queuing
                    end
                    cars(thisCar, 2)=cars(thisCar,1);
                end
            end

        case 96
            if(cars(thisCar,4) == 2)
                if(cases(40) == 0)
                    cars(thisCar,1) = 40;
                    cars(thisCar,2) = 96;
                    cases(40) = thisCar;
                    cases(96) = 0;
                    cars(thisCar,5)=0; %no queuing
            else
                if cars(thisCar,2)==cars(thisCar,1)
                    cars(thisCar,5)=1; %queuing
                end
                cars(thisCar, 2)=cars(thisCar,1);
            end
        else
            if(cases(95) == 0)
                cars(thisCar,1) = 95;
                cars(thisCar,2) = 96;
                cases(95) = thisCar;
                cases(96) = 0;
                cars(thisCar,5)=0; %no queuing
            else
                if cars(thisCar,2)==cars(thisCar,1)
                    cars(thisCar,5)=1; %queuing
            end
            cars(thisCar, 2)=cars(thisCar,1);
        end
    end

         otherwise % move forward inside the roundabout
            if(cases(caseID-1) == 0) % if next cell is free
                cars(thisCar,1) = cars(thisCar,1) - 1; % move forward
                cars(thisCar,2) = cars(thisCar,1); % save old position
                cases(caseID-1) = thisCar; % lock new cell
                cases(caseID) = 0; % free old cell
                cars(thisCar,5)=0; %no queuing
            else
                if cars(thisCar,2)==cars(thisCar,1)
                    cars(thisCar,5)=1; %queuing
                end
                cars(thisCar, 2)=cars(thisCar,1);
            end
        end
    end
 end
 end