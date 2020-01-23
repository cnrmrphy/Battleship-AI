function BoardChoiceDisplayUpdate(handles)
% This function is called whenever a strategy check box is used or whenever
% any of the board buttons is pressed. It calls grid.png and then alters
% ChoiceArray to match the button menu. For every 1 in choice array it
% changes the colors of the pixels of the matching spaces. It then only
% plots them if their check box is checked. 

filename = 'grid.png';
imageChange= imread(filename);
ChoiceArray=zeros(10,10);
Alphabet = 'abcdefghij';
number=[1 2 3 4 5 6 7 8 9 10];

for ix = 1:10
    for i = 1:10
        Handles2ChoiceArray=(['ChoiceArray(',num2str(ix),',',num2str(i),')=','handles.',Alphabet(ix),num2str(i),'Button.Value;']);
        eval(Handles2ChoiceArray);

    end
end

for ix = 1:10
    for i = 1:10
        if(ChoiceArray(ix,i))==1
        imageChange(((ix)*50)-(47):(ix*50)-1,(i)*50-(47):(i*50)-1,1)=146;
        imageChange(((ix)*50)-(47):(ix*50)-1,(i)*50-(47):(i*50)-1,2)=240;
        imageChange(((ix)*50)-(47):(ix*50)-1,(i)*50-(47):(i*50)-1,3)=232;
        
        end
    end
end
if handles.strat1Check.Value==1
    imshow(imageChange, 'InitialMagnification', 'fit', 'Parent', handles.strat1Display );
end

if handles.strat2Check.Value==1
    imshow(imageChange, 'InitialMagnification', 'fit', 'Parent', handles.strat2Display );
end

if handles.strat3Check.Value==1
    imshow(imageChange, 'InitialMagnification', 'fit', 'Parent', handles.strat3Display );
end

if handles.strat4Check.Value==1
    imshow(imageChange, 'InitialMagnification', 'fit', 'Parent', handles.strat4Display );
end

if handles.strat5Check.Value==1
    imshow(imageChange, 'InitialMagnification', 'fit', 'Parent', handles.strat5Display )
end




