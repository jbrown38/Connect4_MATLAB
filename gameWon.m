function gWin = gameWon(boardArr,playNum)
Bsize = size(boardArr);
cols = Bsize(2);
rows = Bsize(1);
count = 0;
gWin = false;
% checks rows to see if player playNum has won
for i = 1:rows
        for j = 1:cols-1
            if( boardArr(i,j)==playNum && boardArr(i,j+1)==playNum)
                count = count +1;
                if (count >= 3)
                    gWin = true;
                end
            else
                count = 0;
            end
        end
        count = 0;
end


% checks columns to see if player playNum has won
for b = 1:cols
        for c = 1:rows-1
            if( boardArr(c,b)==playNum && boardArr(c+1,b)==playNum)
                count = count +1;
                if (count >= 3)
                    gWin = true;
                end
            else
                count = 0;
            end
        end
        count = 0;
end

%checks up/right diagonals to see if player playNum has won
for i = 7:-1:4
   b = posDCheck(boardArr,1,i,playNum); 
   if( b == true)
     
       gWin = true;
   end
       
end

   if((posDCheck(boardArr,2,7,playNum))|| posDCheck(boardArr,3,7,playNum))
       gWin = true;
   end
%checks left/up diagonals
for j = 1:4
    if(negDCheck(boardArr,1,j,playNum))
        gWin = true;
    end
end
    if(negDCheck(boardArr,2,1,playNum)) || (negDCheck(boardArr,3,1,playNum))
        gWin = true;
    end
    


end






