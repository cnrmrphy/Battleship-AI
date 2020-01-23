function [nturnstotal] = targetingPlot(handles)

%% Initialize All Variables

nturnstotal(1) = 0;

for i = 1:str2double(handles.trialsText.String)

% Call the random board generating function
array = randomPlacement;

arrayOrig = array;

% Initialize variable for number of turns
nTurns = 0;

% Initialize variable for number of spaces still occupied
nOccupied = 17;

% Initialize variables for number of spaces occupied by specific ships
nCarrier = 5;
nBattleship = 4;
nCruiser = 3;
nSubmarine = 3;
nDestroyer = 2;

carrierCounter = 0;
battleshipCounter = 0;
cruiserCounter = 0;
submarineCounter = 0;
destroyerCounter = 0;

turnCounter = 0;

%% Play the Game

while nOccupied > 0 && turnCounter < 100
    
    turnCounter = turnCounter + 1;
    
    nTurnsActual = nTurns;
    
    loopCounter = 0;
    
    % Randomly select a space
    randRow = randi(10);
    randCol = randi(10);
    
    % Make a variable for the specific space
    space = array(randRow,randCol);
    
    if space == 0
        
        % Change space value to shot(6)
        array(randRow,randCol) = 6;
        
        % Update turns
        nTurns = nTurns + 1;
    
    % Checking if it hit the Carrier
    elseif space == 1
        
        % Change space value to shot(6)
        array(randRow,randCol) = 6;
        
        % Update Turns
        nTurns = nTurns + 1;
        
        % Reduce number of squares occupied by the Carrier
        nCarrier = nCarrier - 1;
        
        % Reduce number of occupied squares
        nOccupied = nOccupied - 1;
        
        % WHILE loop to ensure Carrier is sunk before moving on
        while nCarrier > 0 && carrierCounter < 15
            
            carrierCounter = carrierCounter + 1;
            battleshipCounter = 0;
            cruiserCounter = 0;
            submarineCounter = 0;
            destroyerCounter = 0;
            
            % Generate a random integer for the direction it will search
            randDirection = randi(4);       % 1 = up
                                            % 2 = right
                                            % 3 = down
                                            % 4 = left
            
            % SWITCH conditional to execute targeting based on direction
            switch randDirection
                
                % If the first search is up(1)
                case 1
                    
                    loopCounter = loopCounter + 1;
                    
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                            
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 4 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 4 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Brute force fix for glitch
                        
                        if nTurns > 100 || loopCounter > 20
                            
                            nTurns = nTurnsActual;
                            
                            array(randRow + nDown,randCol) = 1;
                            
                            nCarrier = nCarrier + 1;
                            
                            down = true;
                            
                            loopCounter = 0;
                        end
                        
                        if nTurns > 100 && loopCounter > 20
                            
                            nTurns = nTurnsActual;
                            
                            array(randRow + nDown,randCol) = 1;
                            
                            nCarrier = nCarrier + 1;
                            
                            down = true;
                            
                            loopCounter = 0;
                        end
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make down false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                           % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 4 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 4 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                
                % If the first search is right(2)
                case 2
                    
                    loopCounter = loopCounter + 1;
                    
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 4 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Brute force fix for glitch
                        if nTurns > 100 || loopCounter > 20
                            
                            nTurns = nTurnsActual;
                            
                            array(randRow + nDown,randCol) = 1;
                            
                            nCarrier = nCarrier + 1;
                            
                            down = true;
                            
                            loopCounter = 0;
                        end
                        
                        if nTurns > 100 && loopCounter > 20
                            
                            nTurns = nTurnsActual;
                            
                            array(randRow + nDown,randCol) = 1;
                            
                            nCarrier = nCarrier + 1;
                            
                            down = true;
                            
                            loopCounter = 0;
                        end
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make down false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 4 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 4 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                            
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 4 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                
                % If first search is down(3)
                case 3
                    
                    loopCounter = loopCounter + 1;
                         
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check downwards
                    while down
                        
                        % Brute force fix for glitch
                        if nTurns > 100 || loopCounter > 20
                            
                            nTurns = nTurnsActual;
                            
                            array(randRow + nDown,randCol) = 1;
                            
                            nCarrier = nCarrier + 1;
                            
                            down = true;
                            
                            loopCounter = 0;
                        end
                        
                        if nTurns > 100 && loopCounter > 20
                            
                            nTurns = nTurnsActual;
                            
                            array(randRow + nDown,randCol) = 1;
                            
                            nCarrier = nCarrier + 1;
                            
                            down = true;
                            
                            loopCounter = 0;
                        end
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make down false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 4 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 4 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                            
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 4 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 4 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                %If first search is down(3)
                case 4
                    
                    loopCounter = loopCounter + 1;
                         
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 4 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                  
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 4 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 4 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Brute force fix for glitch
                        if nTurns > 100 || loopCounter > 20
                            
                            nTurns = nTurnsActual;
                            
                            array(randRow + nDown,randCol) = 1;
                            
                            nCarrier = nCarrier + 1;
                            
                            down = true;
                            
                            loopCounter = 0;
                        end
                        
                        if nTurns > 100 && loopCounter > 20
                            
                            nTurns = nTurnsActual;
                            
                            array(randRow + nDown,randCol) = 1;
                            
                            nCarrier = nCarrier + 1;
                            
                            down = true;
                            
                            loopCounter = 0;
                        end
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Carrier
                        nCarrier = nCarrier - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 4 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
            end
        end
        
    % Checking if it hit the Battleship(2)
    elseif space == 2
        
        % Change space value to shot(6)
        array(randRow,randCol) = 6;
        
        % Update Turns
        nTurns = nTurns + 1;
        
        % Reduce number of squares occupied by the Battleship
        nBattleship = nBattleship - 1;
        
        % Reduce number of occupied squares
        nOccupied = nOccupied - 1;
        
        % WHILE loop to ensure Battleship is sunk before moving on
        while nBattleship > 0 && battleshipCounter < 15
            
            battleshipCounter = battleshipCounter + 1;
            cruiserCounter = 0;
            submarineCounter = 0;
            destroyerCounter = 0;
            carrierCounter = 0;
            
            % Generate a random integer for the direction it will search
            randDirection = randi(4);       % 1 = up
                                            % 2 = right
                                            % 3 = down
                                            % 4 = left
            
            % SWITCH conditional to execute targeting based on direction
            switch randDirection
                
                % If the first search is up(1)
                case 1
                    
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 4 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 4 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 4 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 4 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                
                % If the first search is right(2)
                case 2
                    
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 4 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 4 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 4 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 4 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                
                % If first search is down(3)
                case 3
                         
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 4 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 4 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 4 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 4 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                %If first search is down(3)
                case 4
                         
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 4 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 4 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 4 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 2
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Battleship
                        nBattleship = nBattleship - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 4 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
            end
        end
        
    % Checking if it hit the Cruiser(3)
    elseif space == 3
        
        % Change space value to shot(6)
        array(randRow,randCol) = 6;
        
        % Update Turns
        nTurns = nTurns + 1;
        
        % Reduce number of squares occupied by the Cruiser
        nCruiser = nCruiser - 1;
        
        % Reduce number of occupied squares
        nOccupied = nOccupied - 1;
        
        % WHILE loop to ensure Cruiser is sunk before moving on
        while nCruiser > 0 && cruiserCounter < 15
            
            cruiserCounter = cruiserCounter + 1;
            submarineCounter = 0;
            destroyerCounter = 0;
            carrierCounter = 0;
            battleshipCounter = 0;
            
            % Generate a random integer for the direction it will search
            randDirection = randi(4);       % 1 = up
                                            % 2 = right
                                            % 3 = down
                                            % 4 = left
            
            % SWITCH conditional to execute targeting based on direction
            switch randDirection
                
                % If the first search is up(1)
                case 1
                    
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 4 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 4 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 4 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 4 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                
                % If the first search is right(2)
                case 2
                    
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 4 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 4 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 4 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 4 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                
                % If first search is down(3)
                case 3
                         
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 4 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 4 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 4 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 4 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                %If first search is down(3)
                case 4
                         
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 4 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 4 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 4 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 3
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Cruiser
                        nCruiser = nCruiser - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 4 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
            end
        end
        
    % Checking if it hit the Submarine(4)
    elseif space == 4
        
        % Change space value to shot(6)
        array(randRow,randCol) = 6;
        
        % Update Turns
        nTurns = nTurns + 1;
        
        % Reduce number of squares occupied by the Submarine
        nSubmarine = nSubmarine - 1;
        
        % Reduce number of occupied squares
        nOccupied = nOccupied - 1;
        
        % WHILE loop to ensure Submarine is sunk before moving on
        while nSubmarine > 0 && submarineCounter < 15
 
            submarineCounter = submarineCounter + 1;
            destroyerCounter = 0;
            carrierCounter = 0;
            battleshipCounter = 0;
            cruiserCounter = 0;
            
            % Generate a random integer for the direction it will search
            randDirection = randi(4);       % 1 = up
                                            % 2 = right
                                            % 3 = down
                                            % 4 = left
            
            % SWITCH conditional to execute targeting based on direction
            switch randDirection
                
                % If the first search is up(1)
                case 1
                    
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                
                % If the first search is right(2)
                case 2
                    
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                
                % If first search is down(3)
                case 3
                         
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                %If first search is down(3)
                case 4
                         
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 5
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 5
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 5
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 4
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Submarine
                        nSubmarine = nSubmarine - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 5
                           
                            % Make down false
                            down = false;
                        end
                    end
            end
        end
        
        % Checking if it hit the Destroyer(5)
    elseif space == 5
        
        % Change space value to shot(6)
        array(randRow,randCol) = 6;
        
        % Update Turns
        nTurns = nTurns + 1;
        
        % Reduce number of squares occupied by the Destroyer
        nDestroyer = nDestroyer - 1;
        
        % Reduce number of occupied squares
        nOccupied = nOccupied - 1;
        
        % WHILE loop to ensure Submarine is sunk before moving on
        while nDestroyer > 0 && destroyerCounter < 15
            
            destroyerCounter = destroyerCounter + 1;
            carrierCounter = 0;
            battleshipCounter = 0;
            cruiserCounter = 0;
            submarineCounter = 0;
            
            % Generate a random integer for the direction it will search
            randDirection = randi(4);       % 1 = up
                                            % 2 = right
                                            % 3 = down
                                            % 4 = left
            
            % SWITCH conditional to execute targeting based on direction
            switch randDirection
                
                % If the first search is up(1)
                case 1
                    
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 4
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 4
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 4
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 4
                           
                            % Make left false
                            left = false;
                        end
                    end
                
                % If the first search is right(2)
                case 2
                    
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 4
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 4
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 4
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 4
                           
                            % Make up false
                            up = false;
                        end
                    end
                
                % If first search is down(3)
                case 3
                         
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 4
                           
                            % Make down false
                            down = false;
                        end
                    end
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 4
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 4
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 4
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                %If first search is down(3)
                case 4
                         
                    % Initialize logical variables for whether to keep
                    % checking in a certain direction
                    up = true;
                    right = true;
                    down = true;
                    left = true;
                    
                    % Initialize variables for amount of spaces checked in
                    % a certain direction
                    nUp = 1;
                    nRight = 1;
                    nDown = 1;
                    nLeft = 1;
                    
                    % Check to the left
                    while left
                        
                        % Check if space is on the leftmost column
                        % Can't check left if on the leftmost column
                        if randCol == 1
                            
                            % Make left false
                            left = false;
                            
                        elseif randCol - nLeft == 0
                            
                            % Make left false
                            left = false;
                        
                        elseif array(randRow,randCol - nLeft) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol - nLeft) = 6;
                        
                        % Increase nLeft
                        nLeft = nLeft + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol - nLeft) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            left = false;
                            
                            % Update space to be hit
                            array(randRow,randCol - nLeft) = 6;
                            
                        elseif array(randRow,randCol - nLeft) == 6
                            
                            % Make up false
                            left = false;
                            
                        elseif array(randRow,randCol - nLeft) == 1 ||...
                               array(randRow,randCol - nLeft) == 2 ||...
                               array(randRow,randCol - nLeft) == 3 ||...
                               array(randRow,randCol - nLeft) == 4
                           
                            % Make left false
                            left = false;
                        end
                    end
                    
                    % Check upwards
                    while up
                        
                        % Check if the space is in the top row
                        % Can't go up if in the top row
                        if randRow == 1
                            
                            % Make up false
                            up = false;
                                
                        elseif randRow - nUp == 0
                            
                            % Make up false
                            up = false;
                        
                        elseif array(randRow - nUp,randCol) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow - nUp,randCol) = 6;
                        
                        % Increase nUp
                        nUp = nUp + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow - nUp,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            up = false;
                            
                            % Update space to be hit
                            array(randRow - nUp,randCol) = 6;
                            
                        elseif array(randRow - nUp,randCol) == 6
                            
                            % Make up false
                            up = false;
                            
                        elseif array(randRow - nUp,randCol) == 1 ||...
                               array(randRow - nUp,randCol) == 2 ||...
                               array(randRow - nUp,randCol) == 3 ||...
                               array(randRow - nUp,randCol) == 4
                           
                            % Make up false
                            up = false;
                        end
                    end
                    
                    % Check to the right
                    while right
                        
                        % Check if the space is on the rightmost column
                        % Can't check right if on the rightmost column
                        if randCol == 10
                            
                            % Make right false
                            right = false;
                            
                        elseif randCol + nRight == 11
                        
                            % Make right false
                            right = false;
                        
                        elseif array(randRow,randCol + nRight) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow,randCol + nRight) = 6;
                        
                        % Increase nRight
                        nRight = nRight + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make up and down false
                        % Already know ship is horizontally oriented
                        up = false;
                        down = false;
                        
                        elseif array(randRow,randCol + nRight) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            right = false;
                            
                            % Update space to be hit
                            array(randRow,randCol + nRight) = 6;
                            
                        elseif array(randRow,randCol + nRight) == 6
                            
                            % Make up false
                            right = false;
                            
                        elseif array(randRow,randCol + nRight) == 1 ||...
                               array(randRow,randCol + nRight) == 2 ||...
                               array(randRow,randCol + nRight) == 3 ||...
                               array(randRow,randCol + nRight) == 4
                           
                            % Make right false
                            right = false;
                        end
                    end
                    
                    % Check downwards
                    while down
                        
                        % Check if the space is on the bottom row
                        % Can't check downwards if on the bottom row
                        if randRow == 10
                            
                            % Make right false
                            down = false;
                            
                        elseif randRow + nDown == 11
                            
                            % Make down false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 5
                        
                        % Update Turns
                        nTurns = nTurns + 1;
                        
                        % Change space value to shot(6)
                        array(randRow + nDown,randCol) = 6;
                        
                        % Increase nDown
                        nDown = nDown + 1;
                        
                        % Reduce number of spaces occupied by Destroyer
                        nDestroyer = nDestroyer - 1;
                        
                        % Reduce number of occupied spaces
                        nOccupied = nOccupied - 1;
                        
                        % Make right and left false
                        % Already know ship is vertically oriented
                        right = false;
                        left = false;
                        
                        elseif array(randRow + nDown,randCol) == 0
                            
                            % Update Turns
                            nTurns = nTurns + 1;
                            
                            % Make up false
                            down = false;
                            
                            % Update space to be hit
                            array(randRow + nDown,randCol) = 6;
                            
                        elseif array(randRow + nDown,randCol) == 6
                            
                            % Make up false
                            down = false;
                        
                        elseif array(randRow + nDown,randCol) == 1 ||...
                               array(randRow + nDown,randCol) == 2 ||...
                               array(randRow + nDown,randCol) == 3 ||...
                               array(randRow + nDown,randCol) == 4
                           
                            % Make down false
                            down = false;
                        end
                    end
            end
        end
    end
    
    if turnCounter == 100
        nTurns = 62;
    end
    
    nturnstotal(i) = nTurns;
    
end
end
end