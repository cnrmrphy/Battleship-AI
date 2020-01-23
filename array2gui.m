function array2gui(handles, array)
Alphabet = 'abcdefghij';

    for ix = 1:10
        for i = 1:10
            CommandReset=(['handles.',Alphabet(ix),num2str(i),'Button.Value=0;']);
           
            eval(CommandReset);
            
        end
    end
    for ix = 1:10
        for i = 1:10
            if array(ix,i) == 1
                ButtonPress = (['handles.',Alphabet(ix),num2str(i),'Button.Value=1;']);

            elseif array(ix,i)==0
                ButtonPress = (['handles.',Alphabet(ix),num2str(i),'Button.Value=0;']);

            end
            eval(ButtonPress);
        end
    end
end


