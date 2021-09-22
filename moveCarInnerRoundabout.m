% Listing 5: moveCarInnerRoundabout.m
function [cars, cases] = moveCarInnerRoundabout(cars, cases)
% MOVECARINNERROUNDABOUT Move all cars in the inner line of the roundabout
% cars: n x 7 - Matrix
%   (x,1): actual position: cases.ID
%   (x,2): last position: cases.ID
%   (x,3): origin: [1:4]
%   (x,4): destination [1:4]
%
% cases: n x 1 - Matrix
% (x,1): occupied: car.ID if yes, 0 if empty

% Algorithm:
% ...
%
% Note: ???
% This algorithm implies that if the car cannot exit, it has to drive an
% additional turn.
for caseID = 101 : 120
    if(cases(caseID) > 0) % if there is a car in this case number
        thisCar = cases(caseID,1);
    switch caseID
        case 103
            % if car wants to drive to outer line here and there is free space
            if(cars(thisCar,4) == 1)
                if(cases(82) == 0)
                    cars(thisCar,1) = 82; % new position
                    cars(thisCar,2) = 103;% old position
                    cases(82) = thisCar; % lock new cell
                    cases(103) = 0; % free old cell
                    cars(thisCar,5)=0;
                else
                    if cars(thisCar,2)==cars(thisCar,1)
                        cars(thisCar,5)=1;
                    end
                    cars(thisCar, 1)=cars(thisCar,2);
                end
            else % car wants to continue on inner line
                if(cases(102) == 0) % if cell is free, move forward
                    cars(thisCar,1) = 102; % new position
                    cars(thisCar,2) = 103;% old position
                    cases(102) = thisCar; % lock new cell
                    cases(103) = 0; % free old cell
                    cars(thisCar,5)=0;
                else
                   if cars(thisCar,2)==cars(thisCar,1)
                        cars(thisCar,5)=1;
                   end
                   cars(thisCar, 1)=cars(thisCar,2);
                end
            end
        case 118
            if(cars(thisCar,4) == 2)
                if(cases(97) == 0)
                    cars(thisCar,1) = 97;
                    cars(thisCar,2) = 118;
                    cases(97) = thisCar;
                    cases(118) = 0;
                    cars(thisCar,5)=0;
                else
                    if cars(thisCar,2)==cars(thisCar,1)
                    cars(thisCar,5)=1;
                end
                cars(thisCar, 1)=cars(thisCar,2);
                end
            else
                if(cases(117) == 0)
                    cars(thisCar,1) = 117; % new position
                    cars(thisCar,2) = 118;% old position
                    cases(117) = thisCar; % lock new cell
                    cases(118) = 0; % free old cell
                    cars(thisCar,5)=0;
                else
                    if cars(thisCar,2)==cars(thisCar,1)
                        cars(thisCar,5)=1;
                    end
                    cars(thisCar, 1)=cars(thisCar,2);
                end
            end

        case 113
            if(cars(thisCar,4) == 3)
                if(cases(92) == 0)
                    cars(thisCar,1) = 92;
                    cars(thisCar,2) = 113;
                    cases(92) = thisCar;
                    cases(113) = 0;
                    cars(thisCar,5)=0;
                else
                    if cars(thisCar,2)==cars(thisCar,1)
                        cars(thisCar,5)=1;
                end
                cars(thisCar, 1)=cars(thisCar,2);
            end
        else
            if(cases(112) == 0)
                cars(thisCar,1) = 112;
                cars(thisCar,2) = 113;
                cases(112) = thisCar;
                cases(113) = 0;
                cars(thisCar,5)=0;
            else
                if cars(thisCar,2)==cars(thisCar,1)
                    cars(thisCar,5)=1;
                end
                cars(thisCar, 1)=cars(thisCar,2);
              end
            end
          case 108
               if(cars(thisCar,4) == 4)
                    if(cases(87) == 0)
                        cars(thisCar,1) = 87;
                        cars(thisCar,2) = 108;
                        cases(87) = thisCar;
                        cases(108)=0;
                    cars(thisCar,5)=0;
                    else
                    if cars(thisCar,2)==cars(thisCar,1)
                        cars(thisCar,5)=1;
                    end
                    cars(thisCar, 1)=cars(thisCar,2);
                end
               else
                if(cases(107) == 0)
                    cars(thisCar,1) = 107;
                    cars(thisCar,2) = 108;
                    cases(107) = thisCar;
                    cases(108) = 0;
                    cars(thisCar,5)=0;
                else
                    if cars(thisCar,2)==cars(thisCar,1)
                        cars(thisCar,5)=1;
                    end
                    cars(thisCar, 1)=cars(thisCar,2);
                end
             end
        case 101 % car has to drive forward on inner line
            if(cases(120) == 0) % if the next cell is free
                cars(thisCar,1) = 120;
                cars(thisCar,2) = 101;
                cases(120) = thisCar;
                cases(101) = 0;
                cars(thisCar,5)=0;
            else
                if cars(thisCar,2)==cars(thisCar,1)
                    cars(thisCar,5)=1;
                end
                cars(thisCar, 1)=cars(thisCar,2);
            end
        
        otherwise
            if(cases(caseID - 1) == 0) % if next cell is free
                cars(thisCar,1) = caseID-1; % move forward
                cars(thisCar,2) = caseID; % save old position
                cases(caseID-1) = thisCar; % lock new cell
                cases(caseID) = 0; % free old cell
                cars(thisCar,5)=0;
            else
                if cars(thisCar,2)==cars(thisCar,1)
                    cars(thisCar,5)=1;
                end
                cars(thisCar, 1)=cars(thisCar,2);
            end
        end
    end
 end
 end