function [totalturns] = probabilityonly(handles)
totalturns(1) = 0;
for i = 1:str2double(handles.trialsText.String)
% Loading the random probability array created using the randomProbability
% function
board = randomPlacement;
Structure = load('randomProbability.mat');
prob = Structure.Probability1000000;
% A function to attack a board by using an array of probability placement

% Number of turns taken
nTurns = 0;
% The amount to reduce when a empty cell is hsot close by
Mclose = 0.0704; % These numbers were calculated by using the probabilitymiss function
Mfar = 0.03985;


nOccupied  = 17;
while nOccupied > 0
    % Finds the location of the highest probability cell
    [rowMax, columnMax] = find(prob == max(prob(:)));
    % If the cell found is empty
    if board (rowMax, columnMax) == 0
        % Increasing the amount of turns
        nTurns = nTurns + 1;
        % Decreasing the probability to 0
        prob(rowMax, columnMax) = -1000;
        board(rowMax,columnMax) = 6;
        
        %% This removes probability if its a miss of neighboring cells
        if (rowMax - 2) > 0
            prob(rowMax-2,columnMax) = prob(rowMax-2,columnMax) - Mfar;
            prob(rowMax-1,columnMax) = prob(rowMax-1,columnMax) - Mclose;
        elseif (rowMax - 1) > 0
            prob(rowMax-1,columnMax) = prob(rowMax-1,columnMax) - Mclose;
        end
        if (rowMax + 2) < 11
            prob(rowMax+2,columnMax) = prob(rowMax+2,columnMax) - Mfar;
            prob(rowMax+1,columnMax) = prob(rowMax+1,columnMax) - Mclose;
        elseif (rowMax + 1) < 11
            prob(rowMax+1,columnMax) = prob(rowMax+1,columnMax) - Mclose;
        end
        if (columnMax - 2) > 0
            prob(rowMax,columnMax-2) = prob(rowMax,columnMax-2) - Mfar;
            prob(rowMax,columnMax-1) = prob(rowMax,columnMax-1) - Mclose;
        elseif (columnMax - 1) > 0
            prob(rowMax,columnMax-1) = prob(rowMax,columnMax-1) - Mclose;
        end
        if (columnMax + 2) < 11
            prob(rowMax,columnMax+2) = prob(rowMax,columnMax+2) - Mfar;
            prob(rowMax,columnMax+1) = prob(rowMax,columnMax+1) - Mclose;
        elseif (columnMax + 1) < 11
            prob(rowMax,columnMax+1) = prob(rowMax,columnMax+1) - Mclose;
        end
    end
    %% In case it is a hit then call the targeting function
    nnn = board(rowMax,columnMax);
    if (nnn == 1) || (nnn == 2) || (nnn == 3) || (nnn == 4) || (nnn == 5)
        % Adjusting all the variable with the new hit
        % nTurns = nTurns + 1;
        % Hits missing reduced
        % nOccupied = nOccupied - 1;
        % Marking the shot
        % shots(rowMax,columnMax) = 1;
        nTurns = nTurns + 1;
        nOccupied = nOccupied - 1;
        board(rowMax,columnMax) = 6;
        prob(rowMax, columnMax) = -1000;
        % Adjusting all the variables with the information from the
        % targeting function        
        
        % Adding the turns made by targeting
        %nturns = nturns + turnsmade;
        % substracting the amount of hits made by targeting
        %nhits = nhits - hitsmade;
        
        % Creating a new array which containts the update shots made by the
        % targetin
        
        
       
        % Making the new shot array the current shot array to continue
        % targeting

    end
end
    totalturns(i) = nTurns;
end


