function score= evaluateWindow(window, piece)
	 score = 0;
    if(piece == 1)
        opp_piece = 2;
    else
        opp_piece =1;
    end
    
    numPiece = countI(window,piece);
    numOpp = countI(window,opp_piece);
    numEmpt = countI(window,0);
    
    if numPiece == 4
		score =score +  100;
    elseif numPiece == 3 && numEmpt == 1
		score = score + 5;  
	elseif numPiece == 2 && numEmpt == 2
		score = score + 2;
    end
    
    
    
	if numOpp == 3 && numEmpt == 1
		score = score -  4;
    end
    
     
end
    
