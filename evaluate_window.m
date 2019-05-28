function [score]= evaluate_window(window, piece)
	score = 0;
    numPiece = 0;
    numOpp = 0;
    numEmpt = 0;
    
	if(piece == 1)
        opp_piece = 2;
    else
        opp_piece =1;
    end
        
    
    for i = 1:4
        if(window(i) == piece)
            numPiece = numPiece +1;
        elseif(window(i) == opp_piece)
            numOpp = numOpp +1;
        else
            numEmpt = numEmpt +1;
        end
    end
    
    
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
    
