% targeting.m
% Alejandro Gutierrez
% Section 10
% Battleship AI Proyect

% Function that targets spaces around previous hit.
% REMEMBER: For now, it only works if there are no other ships around
% the initial hit.

function [board,turns,nhits,rowVector,colVector,hitVector] = targetingGUI(board,hit,rowVector,colVector,hitVector)

[~,initial] = size(rowVector);
tic;
% Initializes variable for number of "accidents"
naccidents = 0;
v = 1;

% Initializes number of hits
nhits = 0;

% Initializes variable for turns
turns = 0;

accidents = [0,0];

while 1
    
    % Would assign a random direction relative to hit
    % For now direction will be up
    % 1 is up
    % 2 is right
    % 3 is down
    % 4 is left
    direction = 1;
    
    % 1 is carrier 5 spaces
    % 2 is battleship 4 spaces
    % 3 is crusier 3 spaces
    % 4 is sub 3 spaces
    % 5 is destroyer 2 spaces
    
    % Checks which ship was hit
    ship = (board(hit(1),hit(2),1));
    if toc > 1
        return
    end
    % Based on hit ship asigns a number of remaining hits needed
    % to sink the ship
    if ship == 1
        remaining = 4;
    elseif ship == 2
        remaining = 3;
    elseif ship == 3
        remaining = 2;
    elseif ship == 4
        remaining = 2;
    elseif ship == 5
        remaining = 1;
    end
    
    % Initializes a variable for number of hits
    hitcount = 0;
    if toc > 1
        return
    end
    % If the first shot is up proceeds
    % Again for now it will start shooting north of the hit
    % and proceed clockwise
    if direction == 1
        % Runs until a break
        % The code will break from the while loop if hitcount = remaining
        while 1
            % If the hit was in the upper edge of the board there would
            % not be any spaces north of the hit to shoot at
            % This if statement checks if the hit is not in the upper edge
            if hit(1) ~= 1
                % Would shoot at every space above the hit unless it
                % runs into a break
                for ix = 1:hit(1)-1
                    % Records possible shot a number of spaces above hit
                    shot = [hit(1) - ix,hit(2)];
                    % Checks if space has already been shot at in the
                    % cell array
                    if (board(shot(1),shot(2),2)) == 0 && (hitcount ~= remaining)
                        % If space is unshot records shot in cell array as 1
                        board(shot(1),shot(2),2) = (1);
                        turns = turns + 1;
                        
                        rowVector(initial+turns) = shot(1);
                        colVector(initial+turns) = shot(2);
                        hitVector(initial+turns) = 0;
                        
                        % If the shot is a hit increases hitcount by 1
                        if (board(shot(1),shot(2),1)) ~= 0
                            nhits = nhits + 1;
                            if board(shot(1),shot(2),1) == ship
                                hitcount = hitcount + 1;
                                rowVector(initial+turns) = shot(1);
                                colVector(initial+turns) = shot(2);
                                hitVector(initial+turns) = 1;
                            else
                                naccidents = naccidents + 1;
                                accidents(naccidents+1,1) = shot(1);
                                accidents(naccidents+1,2) = shot(2);
                                rowVector(initial+turns) = shot(1);
                                colVector(initial+turns) = shot(2);
                                hitVector(initial+turns) = 1;
                                break
                            end
                        end
                    end
                    if toc > 1
                        return
                    end
                    % if shot is unsuccesful and hitcount = 0
                    % breaks from for loop and proceeds to shoot clockwise
                    if (board(shot(1),shot(2),1)) == 0
                        % However if there was another hit above the
                        % initial hit and the ship has not already been
                        % sunk that means the next shot should be
                        % south of the initial hit
                        % Therefore, if statement checks for that possibility
                        if hitcount ~= 0 && hitcount ~= remaining
                            % Would cycle through all spaces south of
                            % initial hit unless it runs into a break
                            for iy = 1:10-hit(1)
                                % Records possible shot in vector
                                shot = [hit(1) + iy,hit(2)];
                                % If space is unshot records shot in cell
                                % array as 1
                                if (board(shot(1),shot(2),2)) == 0
                                    board(shot(1),shot(2),2) = (1);
                                    turns = turns + 1;
                                    rowVector(initial+turns) = shot(1);
                                    colVector(initial+turns) = shot(2);
                                    hitVector(initial+turns) = 0;
                                    % If shot is a hit increases hitcount
                                    if (board(shot(1),shot(2),1)) ~= 0
                                        nhits = nhits + 1;
                                        hitcount = hitcount + 1;
                                        rowVector(initial+turns) = shot(1);
                                        colVector(initial+turns) = shot(2);
                                        hitVector(initial+turns) = 1;
                                    end
                                end
                                % If ship is sunk breaks from loop
                                if hitcount == remaining
                                    break
                                end
                            end
                        end
                        % Breaks from previous for loop if conditions are met
                        break
                    end
                end
            end
            % If ship is sunk while loop ends
            if hitcount == remaining
                break
            end
            if toc > 1
                return
            end
            % If code above is unsuccesful in sinking the ship proceeds in
            % clockwise cycle
            % If the hit was in the right edge of the board there would
            % not be any spaces east of the hit to shoot at
            % This if statement checks if the hit is not in the right edge
            if hit(2) ~= 10
                % Would shoot at every space right of the hit unless
                % it runs into a break
                for ix = 1:10-hit(2)
                    % Records possible shot as vector
                    shot = [hit(1),hit(2)+ix];
                    % If space is unshot takes the shot and records it
                    % in cell array as a 1
                    if (board(shot(1),shot(2),2)) == 0 && hitcount ~= remaining
                        board(shot(1),shot(2),2) = (1);
                        turns = turns + 1;
                        
                        rowVector(initial+turns) = shot(1);
                        colVector(initial+turns) = shot(2);
                        hitVector(initial+turns) = 0;
                        % If shot is a hit increases hitcount by 1
                        if (board(shot(1),shot(2),1)) ~= 0
                            nhits = nhits + 1;
                            if board(shot(1),shot(2),1) == ship
                                hitcount = hitcount + 1;
                                rowVector(initial+turns) = shot(1);
                                colVector(initial+turns) = shot(2);
                                hitVector(initial+turns) = 1;
                            else
                                naccidents = naccidents + 1;
                                accidents(naccidents+1,1) = shot(1);
                                accidents(naccidents+1,2) = shot(2);
                                rowVector(initial+turns) = shot(1);
                                colVector(initial+turns) = shot(2);
                                hitVector(initial+turns) = 1;
                                break
                            end
                        end
                    end
                    if toc > 1
                        return
                    end
                    % if shot is unsuccesful and hitcount = 0
                    % breaks from for loop and proceeds to shoot clockwise
                    if (board(shot(1),shot(2),1)) == 0
                        % However if there was another hit right of the
                        % initial hit and the ship has not already been
                        % sunk that means the next shot should be
                        % west of the initial hit
                        % Therefore, if statement checks for that possibility
                        if toc > 1
                            return
                        end
                        if hitcount ~= 0 && hitcount ~= remaining
                            % Would cycle through all spaces west of
                            % initial hit unless it runs into a break
                            for iy = 1:hit(2)-1
                                % Records possible shot as vector
                                shot = [hit(1),hit(2) - iy];
                                turns = turns + 1;
                                
                                % If spaces is unshot takes the shot
                                if (board(shot(1),shot(2),2)) == 0
                                    rowVector(initial+turns) = shot(1);
                                    colVector(initial+turns) = shot(2);
                                    hitVector(initial+turns) = 0;
                                    % Records shot in cell array
                                    board(shot(1),shot(2),2) = (1);
                                    % If shot is hit increases hitcount by 1
                                    if (board(shot(1),shot(2),1)) ~= 0
                                        hitcount = hitcount + 1;
                                        nhits = nhits + 1;
                                        rowVector(initial+turns) = shot(1);
                                        colVector(initial+turns) = shot(2);
                                        hitVector(initial+turns) = 1;
                                    end
                                end
                                % If ship is sunk breaks from loop
                                if hitcount == remaining
                                    break
                                end
                                if toc > 1
                                    return
                                end
                            end
                        end
                        % Breaks from previous loop if conditions are met
                        break
                    end
                end
            end
            if toc > 1
                return
            end
            % If ship is sunk while loop ends
            if hitcount == remaining
                break
            end
            % If code above is unsuccesful in sinking the ship proceeds in
            % clockwise cycle
            % If the hit was in the lower edge of the board there would
            % not be any spaces south of the hit to shoot at
            % This if statement checks if the hit is not in the lower edge
            if hit(1) ~= 10
                if toc > 1
                    return
                end
                % Would shoot at every space below the hit unless
                % it runs into a break
                for ix = 1:10-hit(1)
                    % Records possible shot as a vector
                    shot = [hit(1) + ix,hit(2)];
                    if toc > 1
                        return
                    end
                    % If space is unshot takes the shot
                    if (board(shot(1),shot(2),2)) == 0 && hitcount ~= remaining
                        % Records the shot in cell array
                        turns = turns + 1;
                        board(shot(1),shot(2),2) = (1);
                        
                        rowVector(initial+turns) = shot(1);
                        colVector(initial+turns) = shot(2);
                        hitVector(initial+turns) = 0;
                        if toc > 1
                            return
                        end
                        % If shot is a hit increases hitcount by 1
                        if (board(shot(1),shot(2),1)) ~= 0
                            nhits = nhits + 1;
                            if board(shot(1),shot(2),1) == ship
                                hitcount = hitcount + 1;
                                rowVector(initial+turns) = shot(1);
                                colVector(initial+turns) = shot(2);
                                hitVector(initial+turns) = 1;
                                if toc > 1
                                    return
                                end
                            else
                                naccidents = naccidents + 1;
                                accidents(naccidents+1,1) = shot(1);
                                accidents(naccidents+1,2) = shot(2);
                                rowVector(initial+turns) = shot(1);
                                colVector(initial+turns) = shot(2);
                                hitVector(initial+turns) = 1;
                                break
                            end
                        end
                    end
                    % if shot is unsuccesful and hitcount = 0
                    % breaks from for loop and proceeds to shoot clockwise
                    if (board(shot(1),shot(2),1)) == 0
                        if toc > 1
                            return
                        end
                        % However if there was another hit south of the
                        % initial hit and the ship has not already been
                        % sunk that means the next shot should be
                        % north of the initial hit
                        % This part of the code is unncesessary if we stick to
                        % always firing north of the hit first
                        % However, it would be necessary if we change to a
                        % random initial shot
                        % Therefore, if statement checks for that possibility
                        if hitcount ~= 0 && hitcount ~= remaining
                            if toc > 1
                                return
                            end
                            % Would cycle through all spaces north of
                            % initial hit unless it runs into a break
                            for iy = 1:hit(1)-1
                                % Records possible shot
                                shot = [hit(1) - iy,hit(2)];
                                if toc > 1
                                    return
                                end
                                % If space is unshot takes the shot
                                if (board(shot(1),shot(2),2)) == 0
                                    % Records shot in cell array
                                    turns = turns + 1;
                                    board(shot(1),shot(2),2) = (1);
                                    rowVector(initial+turns) = shot(1);
                                    colVector(initial+turns) = shot(2);
                                    hitVector(initial+turns) = 0;
                                    % if shot is hit increase hitcount by 1
                                    if (board(shot(1),shot(2),1)) ~= 0
                                        hitcount = hitcount + 1;
                                        nhits = nhits + 1;
                                        rowVector(initial+turns) = shot(1);
                                        colVector(initial+turns) = shot(2);
                                        hitVector(initial+turns) = 1;
                                        if toc > 1
                                            return
                                        end
                                    end
                                end
                                % If ship is sunk breaks from loop
                                if hitcount == remaining
                                    break
                                end
                            end
                            if toc > 1
                                return
                            end
                        end
                        % If conditions are met breaks from loop
                        break
                    end
                end
                if toc > 1
                    return
                end
            end
            % If ship is sunk while loop ends
            if hitcount == remaining
                break
            end
            if toc > 1
                return
            end
            % If code above is unsuccesful in sinking the ship proceeds in
            % clockwise cycle
            % If the hit was in the left edge of the board there would
            % not be any spaces west of the hit to shoot at
            % This if statement checks if the hit is not in the left edge
            if hit(2) ~= 1
                % Would at every space left of the hit unless
                % it runs into a break
                for ix = 1:hit(2)-1
                    if toc > 1
                        return
                    end
                    
                    % Records possible shot
                    shot = [hit(1),hit(2) - ix];
                    % If space is unshot takes the shot
                    if (board(shot(1),shot(2),2)) == 0 && hitcount ~= remaining
                        % Records shot in cell array as 1
                        board(shot(1),shot(2),2) = (1);
                        turns = turns + 1;
                        rowVector(initial+turns) = shot(1);
                        colVector(initial+turns) = shot(2);
                        hitVector(initial+turns) = 0;
                        % If shot is a hit increases hitcount by 1
                        if (board(shot(1),shot(2),1)) ~= 0
                            if toc > 1
                                return
                            end
                            nhits = nhits + 1;
                            if board(shot(1),shot(2),1) == ship
                                hitcount = hitcount + 1;
                                rowVector(initial+turns) = shot(1);
                                colVector(initial+turns) = shot(2);
                                hitVector(initial+turns) = 1;
                                if toc > 1
                                    return
                                end
                            else
                                naccidents = naccidents + 1;
                                accidents(naccidents+1,1) = shot(1);
                                accidents(naccidents+1,2) = shot(2);
                                rowVector(initial+turns) = shot(1);
                                colVector(initial+turns) = shot(2);
                                hitVector(initial+turns) = 1;
                                break
                                if toc > 1
                                    return
                                end
                            end
                        end
                    end
                    % if shot is unsuccesful and hitcount = 0
                    % breaks from for loop and proceeds to shoot clockwise
                    if (board(shot(1),shot(2),1)) == 0
                        if toc > 1
                            return
                        end
                        % However if there was another hit left of the
                        % initial hit and the ship has not already been
                        % sunk that means the next shot should be
                        % right of the initial hit
                        % This part of the code is unncesessary if we stick to
                        % always firing north of the hit first
                        % However, it would be necessary if we change to a
                        % random initial shot
                        % Therefore, if statement checks for that possibility
                        if hitcount ~= 0 && hitcount ~= remaining
                            if toc > 1
                                return
                            end
                            % Would cycle through all spaces right of
                            % initial hit unless it runs into a break
                            for iy = 1:10-hit(2)
                                % Records possible shot in vector
                                shot = [hit(1),hit(2)+iy];
                                % If space is unshot takes the shot
                                if (board(shot(1),shot(2),2)) == 0
                                    if toc > 1
                                        return
                                    end
                                    % Records shot in cell array as 1
                                    board(shot(1),shot(2),2) = (1);
                                    turns = turns + 1;
                                    rowVector(initial+turns) = shot(1);
                                    colVector(initial+turns) = shot(2);
                                    hitVector(initial+turns) = 0;
                                    % If shot is a hit increases hitcount by 1
                                    if (board(shot(1),shot(2),1)) ~= 0
                                        hitcount = hitcount + 1;
                                        nhits = nhits + 1;
                                        rowVector(initial+turns) = shot(1);
                                        colVector(initial+turns) = shot(2);
                                        hitVector(initial+turns) = 1;
                                        if toc > 1
                                            return
                                        end
                                    end
                                end
                                % If ship is sunk breaks out of loop
                                if hitcount == remaining
                                    break
                                end
                                if toc > 1
                                    return
                                end
                            end
                        end
                        % If conditions are met breaks from loop
                        break
                    end
                end
            end
            if toc > 1
                return
            end
            % If ship is sunk breaks out of while loop
            if hitcount == remaining
                break
            end
        end
    end
    if toc > 1
        return
    end
    vSize = size(accidents);
    if v >= vSize(1)
        break
    else
        v = v + 1;
        hit(1) = accidents(v,1);
        hit(2) = accidents(v,2);
    end
end

