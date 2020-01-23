% Battleship AI Project
% Section 10, Group 5
% Random Attack Strategy

function [nTurnsTotal] = randomPlot(handles)

nTurnsTotal(1) = 0;

for i = 1:str2double(handles.trialsText.String)

%% Initialize All Variables

% Call the random board generating function
array = CreateRandArray(handles);

arrayOnes = array2one(array);

% Initialize variable for number of turns
nTurns = 0;

% Initialize variable for number of spaces still occupied
nOccupied = 17;

%% Play the Game

while nOccupied > 0
    
    % Randomly select a space
    randRow = randi(10);
    randCol = randi(10);
    
    % Make a variable for the specific space
    space = arrayOnes(randRow,randCol);
    
    % Checking if space is occupied and unshot(1)
    if space == 1
        
        % Change space value to shot(2)
        arrayOnes(randRow,randCol) = 2;
        
        % Update turns
        nTurns = nTurns + 1;
        
        % Reduce number of occupied spaces
        nOccupied = nOccupied - 1;
        
    % Checking if space is unnoccupied and unshot(0)
    elseif space == 0
        
        % Change space value to shot(2)
        arrayOnes(randRow,randCol) = 2;
        
        % Update turns
        nTurns = nTurns + 1;
    end
end

nTurnsTotal(i) = nTurns;

end
end