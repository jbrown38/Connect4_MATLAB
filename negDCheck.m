function gWinDn = negDCheck(boardArr,startRow,startCol,playNum)
    k = startRow;
    l = startCol;
    countDn = 0;
    gWinDn = false;
    while(k < 6 && l <= 6)
        if( boardArr(k,l)==playNum && boardArr(k+1,l+1)==playNum)
                countDn = countDn +1;
                if (countDn >= 3)
                    gWinDn = true;
                    return;
                end
            else
                countDn = 0;
        end
        k = k+1;
        l = l+1;
    end
end