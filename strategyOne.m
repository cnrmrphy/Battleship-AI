function [Strat1MoveRowArray,Strat1MoveColArray, Strat1HitMissArray]=strategyOne(handles)
%% Initialize All Variables

Strat1ChoiceArray=CreateChoiceArray(handles);

% Call the random board generating function
Strat1MoveRowArray=zeros(1,100);
Strat1MoveColArray=zeros(1,100);
Strat1HitMissArray=zeros(1,100);
% Initialize variable for number of turns
nTurns = 1;

% Initialize variable for number of spaces still occupied
nOccupied = 17;

%% Play the Game

while nTurns <= 100
    
    % Randomly select a space
    randRow = randi(10);
    randCol = randi(10);
    
    Strat1MoveRowArray(nTurns)=randRow;
    Strat1MoveColArray(nTurns)=randCol;
   
    % Make a variable for the specific space
    space = Strat1ChoiceArray(randRow,randCol);
    
    % Checking if space is occupied and unshot(1)
    if space == 1
        Strat1HitMissArray(nTurns)=1;
        % Change space value to shot(2)
        Strat1ChoiceArray(randRow, randCol)=2;
        % Update turns
        nTurns = nTurns + 1;
        
        % Reduce number of occupied spaces
        nOccupied = nOccupied - 1;
       
    % Checking if space is unnoccupied and unshot(0)
    elseif space == 0
      Strat1HitMissArray(nTurns)=0;
        % Change space value to shot(2)
        Strat1ChoiceArray(randRow,randCol) = 2;
        
        % Update turns
        nTurns = nTurns + 1;

        
       
    end
        
    
    
end
