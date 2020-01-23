function ChoiceArray=CreateChoiceArray(handles)
% This function can be called to to bring the ChoiceArray into a function. It is used so far in the StrategyOne function. 
ChoiceArray=zeros(10,10);
Alphabet = 'abcdefghij';
number=[1 2 3 4 5 6 7 8 9 10];

for ix = 1:10
    for i = 1:10
        Handles2ChoiceArray=(['ChoiceArray(',num2str(ix),',',num2str(i),')=','handles.',Alphabet(ix),num2str(i),'Button.Value;']);
        eval(Handles2ChoiceArray);

    end
end