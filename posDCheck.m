function gWinDp = posDCheck(boardArr,startRow,startCol,playNum)
    k = startRow;
    l = startCol;
    countDp = 0;
    gWinDp = false;
    while(k < 6 && l >= 2)
        if( boardArr(k,l)==playNum && boardArr(k+1,l-1)==playNum)
                countDp = countDp +1;
                
                if (countDp >= 3)
                    gWinDp = true;
                    return;
                end
            else
                countDp = 0;
        end
        k = k+1;
        l = l-1;
    end
end