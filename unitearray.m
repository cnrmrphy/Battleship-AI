function array = unitearray(array1,array2)

%Checking the size of both arrays
[row1,column1,k1] = size(array1);
[row2,column2,k2] = size(array2);


% Uniting the arrays
if (row1==row2)&&(column1==column2)
    array = zeros(row1,column1,k1+k2);
    for iy = 1:k1
        for ix = 1:row1
            for i = 1:column1
                array(ix,i,iy) = array1(ix,i,iy);
            end
        end
    end
    for iy = 1:k2
        for ix = 1:row1
            for i = 1:column1
                array(ix,i,iy+k1) = array2(ix,i,iy);
            end
        end
    end
else
    disp('Arrays have different size');
end

