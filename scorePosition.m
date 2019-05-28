function score =  scorePosition(board, piece)
	score = 0;
    numCPiece = 0;
    for i = 1:6
        if( board(i,4) == piece)
            numCPiece = numCPiece +1;
        end
    end
	% Score center column
	score = score + numCPiece * 3;

	% Score Horizontal
    for r = 1:6
        for c = 1:4
            rowArray = board(r,:);
			window = rowArray(c:c+3);
			score = score + evaluateWindow(window, piece);
        end
    end

	% Score Vertical
    for c = 1:7
        for r = 1:3
            colArray = board(:,c);
            window = colArray(r:r+3);
            score = score + evaluateWindow(window, piece);
        end
    end
    
    % Score posiive sloped diagonal
    for r = 1:3
        for c = 1:4
            for i = 0:3
                window(i+1) = board(r+i,c+i);
            end
            score = score + evaluateWindow(window, piece);
        end
    end
    
    for r =1:3
        for c = 1:4
            for i = 0:3
                window(i+1) = board(r+3-i,c+i);
            end
            
            score = score + evaluateWindow(window, piece);
        end
    end
    

