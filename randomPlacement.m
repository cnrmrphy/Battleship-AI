function [randomArray] = randomPlacement(handles)

%% A function to create a 10x10 Array of Ship Placements
% With Random ship placements
% A carrier of 5 length
% A ship of 4 length
% Two 3 lenght ships
% One 2 length ships

%% Meaning of the Array
% 0's on the array simbolizes clear water
% 1's represents the Carrier location (length 5)
% 2's represent the Battleships location (length 4)
% 3's represent the Cruisers location (length 3)
% 4's represent the sumbarines lcoation (length 3)
% 5's represent the destroyers location (length 2)


%% Creating the Array

randomArray = zeros(10,10);

%% Creating the Carrier
% R = Row, C = Column, C = Carrier, S = Start, F = Finish
% First cell of ship
RCS = randi(10);
CCS = randi(10);

% Last cell of the ship

%Checking the battlehsip can be placed properly
% A represents to check either vertically or horizontal availability first
% once an open space is found the ship is placed
DC = randi(2); % DC = Direction Carrier
if DC == 1 % Checking vertically first
    if (RCS - 5) > 0
        RCS = RCS - 5;
        RCF = RCS + 5;
    else
        RCF = RCS + 5;
    end
else %% Else try horizontal
    if(CCS - 5) > 0
        CCS = CCS - 5;
        CCF = CCS + 5;
    else
        CCF = CCS + 5;
    end
end
% Filling the array with the Carrier
for ix = 0:4
    if DC == 1
        randomArray((RCS+ix),CCS) = 1;
    else
        randomArray(RCS,(CCS+ix)) = 1;
    end
end

%% Creating the battleship
% R = Row, C = Column, B = Battleship, S = Start, F = Finish
Battleship = false;

% While loop to make sure we dont overlap another ship
while Battleship == false
    Battleship = true;
    % First cell of ship
    RBS = randi(10);
    CBS = randi(10);
    
    % Last cell of the ship
    
    %Checking the battlehsip can be placed properly
    % A represents to check either vertically or horizontal availability first
    % once an open space is found the ship is placed
    
    DB = randi(2); % DB = Direction Battleship
    if DB == 1 % Checking vertically first
        if (RBS - 4) > 0
            RBS = RBS - 4;
            RBF = RBS + 4;
        else
            RBF = RBS + 4;
        end
    else %% Else try horizontal
        if(CBS - 4) > 0
            CBS = CBS - 4;
            CBF = CBS + 4;
        else
            CBF = CBS + 4;
        end
    end
    
    for ix = 0:3
        if DB == 1
            if randomArray((RBS+ix),CBS) ~= 0
                Battleship = false;
            end
        else
            if randomArray(RBS,(CBS+ix)) ~= 0
                Battleship = false;
            end
        end
    end
end
% Filling the array with the Battleship
for ix = 0:3
    if DB == 1
        randomArray((RBS+ix),CBS) = 2;
    else
        randomArray(RBS,(CBS+ix)) = 2;
    end
end


%% Creating the Cruiser
% R = Row, C = Column, CC = Cruiser, S = Start, F = Finish
Cruiser = false;

% While loop to make sure we dont overlap another ship
while Cruiser == false
    Cruiser = true;
    % First cell of ship
    RCCS = randi(10);
    CCCS = randi(10);
    
    % Last cell of the ship
    
    %Checking the Cruiser can be placed properly
    % A represents to check either vertically or horizontal availability first
    % once an open space is found the ship is placed
    
    DC = randi(2); % DB = Direction Cruiser
    if DC == 1 % Checking vertically first
        if (RCCS - 3) > 0
            RCCS = RCCS - 3;
            RCCF = RCCS + 3;
        else
            RCCF = RCCS + 3;
        end
    else %% Else try horizontal
        if(CCCS - 3) > 0
            CCCS = CCCS - 3;
            CCCF = CCCS + 3;
        else
            CCCF = CCCS + 3;
        end
    end
    
    for ix = 0:2
        if DC == 1
            if randomArray((RCCS+ix),CCCS) ~= 0
                Cruiser = false;
            end
        else
            if randomArray(RCCS,(CCCS+ix)) ~= 0
                Cruiser = false;
            end
        end
    end
end
% Filling the array with the Cruiser
for ix = 0:2
    if DC == 1
        randomArray((RCCS+ix),CCCS) = 3;
    else
        randomArray(RCCS,(CCCS+ix)) = 3;
    end
end

%% Creating the Submarine
% R = Row, C = Column, S = Submarine, S = Start, F = Finish
Submarine = false;

% While loop to make sure we dont overlap another ship
while Submarine == false
    Submarine = true;
    % First cell of ship
    RSS = randi(10);
    CSS = randi(10);
    
    % Last cell of the ship
    
    %Checking the Submarine can be placed properly
    % A represents to check either vertically or horizontal availability first
    % once an open space is found the ship is placed
    
    DS = randi(2); % DB = Direction Submarine
    if DS == 1 % Checking vertically first
        if (RSS - 3) > 0
            RSS = RSS - 3;
            RSF = RSS + 3;
        else
            RSF = RSS + 3;
        end
    else %% Else try horizontal
        if(CSS - 3) > 0
            CSS = CSS - 3;
            CSF = CSS + 3;
        else
            CSF = CSS + 3;
        end
    end
    
    for ix = 0:2
        if DS == 1
            if randomArray((RSS+ix),CSS) ~= 0
                Submarine = false;
            end
        else
            if randomArray(RSS,(CSS+ix)) ~= 0
                Submarine = false;
            end
        end
    end
end
% Filling the array with the Submarine
for ix = 0:2
    if DS == 1
        randomArray((RSS+ix),CSS) = 4;
    else
        randomArray(RSS,(CSS+ix)) = 4;
    end
end

%% Creating the Destroyer
% R = Row, C = Column, D = Destroyer, S = Start, F = Finish
Destroyer = false;

% While loop to make sure we dont overlap another ship
while Destroyer == false
    Destroyer = true;
    % First cell of ship
    RDS = randi(10);
    CDS = randi(10);
    
    % Last cell of the ship
    
    %Checking the Destroyer can be placed properly
    % A represents to check either vertically or horizontal availability first
    % once an open space is found the ship is placed
    
    DD = randi(2); % DB = Direction Destroyer
    if DD == 1 % Checking vertically first
        if (RDS - 2) > 0
            RDS = RDS - 2;
            RDF = RDS + 2;
        else
            RDF = RDS + 2;
        end
    else %% Else try horizontal
        if(CDS - 2) > 0
            CDS = CDS - 2;
            CDF = CDS + 2;
        else
            CDF = CDS + 2;
        end
    end
    
    for ix = 0:1
        if DD == 1
            if randomArray((RDS+ix),CDS) ~= 0
                Destroyer = false;
            end
        else
            if randomArray(RDS,(CDS+ix)) ~= 0
                Destroyer = false;
            end
        end
    end
end
% Filling the array with the Destroyer
for ix = 0:1
    if DD == 1
        randomArray((RDS+ix),CDS) = 5;
    else
        randomArray(RDS,(CDS+ix)) = 5;
    end
end

