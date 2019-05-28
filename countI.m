function num = countI(arr, piece)
num = 0;
for i = 1:length(arr)
        if(arr(i) == piece)
            num = num +1;
        end
end