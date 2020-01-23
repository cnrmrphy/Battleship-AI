function BoardClear(handles)

% This is a function that is used when the GUI first opens and then again
% when the clear button is pressed. It clears the board images, the board
% buttons, and the ChoiceArray. 

Alphabet = 'abcdefghij';
for ix = 1:10
        for i = 1:10
            CommandReset=(['handles.',Alphabet(ix),num2str(i),'Button.Value=0;']);
            eval(CommandReset);
        end
end

if handles.strat1Check.Value==1
    imshow('grid.png', 'InitialMagnification', 'fit', 'Parent', handles.strat1Display )
end

if handles.strat2Check.Value==1
    imshow('grid.png', 'InitialMagnification', 'fit', 'Parent', handles.strat2Display )    
end

if handles.strat3Check.Value==1
    imshow('grid.png', 'InitialMagnification', 'fit', 'Parent', handles.strat3Display )
end

if handles.strat4Check.Value==1
    imshow('grid.png', 'InitialMagnification', 'fit', 'Parent', handles.strat4Display )
end

if handles.strat5Check.Value==1
    imshow('grid.png', 'InitialMagnification', 'fit', 'Parent', handles.strat5Display )
end




ChoiceArray=zeros(10,10);

handles.strat1Counter.String=0;
handles.strat2Counter.String=0;
handles.strat3Counter.String=0;
handles.strat4Counter.String=0;
handles.strat5Counter.String=0;