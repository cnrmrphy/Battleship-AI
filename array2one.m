function array = array2one(old)

% This function inputs an array with multiple numbers and converts
% all non zeros numbers into a 1

[row,column] = size(old);
array = zeros(row,column);

for i = 1:row
    for ix = 1:column
        if old(i,ix) ~= 0
            array(i,ix) = 1;
        end
    end
end
