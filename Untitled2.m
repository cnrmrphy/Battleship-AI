nTurnsActual = 1;
TotalTurns(1) = 0;
for j = 1:1000

% Loading the random probability array created using the randomProbability
% function
board = randomPlacement;
% board = CreatRandArray(handles);
Structure = load('randomProbability.mat');
prob = Structure.Probability1000000;
% A function to attack a board by using an array of probability placement

% Number of turns taken
nTurns = 1;
% The amount to reduce when a empty cell is hsot close by
Mclose = 0.0704; % These numbers were calculated by using the probabilitymiss function
Mfar = 0.03985;

% Creating an array to record the shots made
shots = zeros(10,10);

turnCounter = 0;
    
nCarrier = 5;
nBattleship = 4;
nCruiser = 3;
nSubmarine = 3;
nDestroyer = 2;
nOccupied = 17;

while nOccupied > 0 && turnCounter < 100
    
    turnCounter = turnCounter + 1;
    
    % Finds the location of the highest probability cell
    [rowMax, columnMax] = find(prob == max(prob(:)));
    % If the cell found is empty
    if board (rowMax, columnMax) == 0
        % Increasing the amount of turns
        nTurns = nTurns + 1;
        % Recording the shot made
        shots(rowMax,columnMax) = 1;
        % Decreasing the probability to 0
        prob(rowMax, columnMax) = -100;
        
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
    if board (rowMax,columnMax) ~= 0
        % Adjusting all the variable with the new hit
        % nTurns = nTurns + 1;
        % Hits missing reduced
        % nOccupied = nOccupied - 1;
        % Marking the shot
        % shots(rowMax,columnMax) = 1;
        
        temp  = board;
        for i = 1:10
            for ix = 1:10
                if shots(i,ix) == 1
                    temp(i,ix) = 6;
                end
            end
        end
        
        
        % Adjusting all the variables with the information from the
        % targeting function
        [Nboard,nTurns,nOccupied,nCarrier,nBattleship,nCruiser,nSubmarine,nDestroyer] = target3(temp,nTurns,nOccupied,rowMax,columnMax,nCarrier,nBattleship,nCruiser,nSubmarine,nDestroyer);
        
        
        % Adding the turns made by targeting
        %nturns = nturns + turnsmade;
        % substracting the amount of hits made by targeting
        %nhits = nhits - hitsmade;
        
        % Creating a new array which containts the update shots made by the
        % targeting
        for i = 1:10
            for ix = 1:10
                if Nboard(i,ix) == 6
                    newshots(i,ix) = 1;
                else
                    newshots(i,ix) = 0;
                end
            end
        end
        
        
        
        % If there was a miss lowering the probability to 0 as well as
        % neighboring ones
        for i = 1:10
            for ix = 1:10
                if ((shots(i,ix) == 0) && (newshots(i,ix) == 1) && (board(i,ix) == 0))
                    % Decreasing the probability to 0
                    prob(i, ix) = -100;
                    
                    % Decreasing the neighboring cells
                    if (i - 2) > 0
                        prob(i-2,ix) = prob(i-2,ix) - Mfar;
                        prob(i-1,ix) = prob(i-1,ix) - Mclose;
                    elseif (i - 1) > 0
                        prob(i-1,ix) = prob(i-1,ix) - Mclose;
                    end
                    if (i + 2) < 11
                        prob(i+2,ix) = prob(i+2,ix) - Mfar;
                        prob(i+1,ix) = prob(i+1,ix) - Mclose;
                    elseif (i + 1) < 11
                        prob(i+1,ix) = prob(i+1,ix) - Mclose;
                    end
                    if (ix - 2) > 0
                        prob(i,ix-2) = prob(i,ix-2) - Mfar;
                        prob(i,ix-2) = prob(i,ix-1) - Mclose;
                    elseif (ix - 1) > 0
                        prob(i,ix-1) = prob(i,ix-1) - Mclose;
                    end
                    if (ix + 2) < 11
                        prob(i,ix+2) = prob(i,ix+2) - Mfar;
                        prob(i,ix+1) = prob(i,ix+1) - Mclose;
                    elseif (ix + 1) < 11
                        prob(i,ix+1) = prob(i,ix+1) - Mclose;
                    end
                end
            end
        end
        
        % If there was a hit lowering the probability of this cell to 0
        for i = 1:10
            for ix = 1:10
                if (newshots(i,ix) == 1) && (board(i,ix) ~= 0)
                    prob(i,ix) = -100;
                end
            end
        end
        % Making the new shot array the current shot array to continue
        % targeting
        shots = newshots;
        
    end


end

    if turnCounter == 100
        nTurns = 40;
    end

    TotalTurns(j) = nTurns;
    
end