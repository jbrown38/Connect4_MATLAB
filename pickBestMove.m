function move = pickBestMove(board, piece)

	valid_locations = getValidLocations(board);
	bestScore = -10000;
	bestCol = 1;
	for c = valid_locations
        row=canPlayHere(c, board);
		tempBoard = board;
		tempBoard(row,c) = piece;
		score = score_position(tempBoard, piece);
		if score > best_score
			bestScore = score;
			bestCol = col;
        end
    end
	move = bestCol;
end
    
        
