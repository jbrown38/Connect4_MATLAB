function [column, value]=minimax(board, depth, alpha, beta, maximizingPlayer,piece)
    validLocations=getValidLocations(board);
    isTerminal=isTerminalNode(board);
    b = 0;
    AIPiece=piece;
    if(piece == 1)
        playerPiece =2;
    else 
        playerPiece = 1;
    end
    if depth==0 || isTerminal
        if isTerminal
            if(gameWon(board, AIPiece))
                column=-1;
                value=100000000000000;
                return
            elseif(gameWon(board, playerPiece))
                column=-1;
                value=-100000000000000;
                return
            else % game is over, no more valid moves
                column=-1;
                value=0;
                return
            end
        else % depth is 0
            column=-1;
            value=scorePosition(board, AIPiece);
            return
        end
    end
    
    if maximizingPlayer
        value=-Inf;
        column = validLocations(randi(size(validLocations,2)));
        for col=validLocations
            row=canPlayHere(col, board);
            if(row == -1)
                column =-1;
                value = -1;
                return
            end
            boardCopy=board;
            boardCopy(row, col)=AIPiece;
            [b,newScore]=minimax(boardCopy, depth-1, alpha, beta, false, piece);
            if newScore>value
                value=newScore;
                column=col;
            end
            alpha=max(alpha, value);
            if alpha>=beta
                break
            end
        end
        return
    else % minimizing player
        
        value=Inf;
        column = validLocations(randi(size(validLocations,2)));
        for col=validLocations
            row=canPlayHere(col, board);
            if(row == -1)
                column =-1;
                value = -1;
                return
            end
            boardCopy=board;
            boardCopy(row, col)=playerPiece;
            [b,newScore]=minimax(boardCopy, depth-1, alpha, beta, true, piece);
            if newScore<value
                value=newScore;
                column=col;
            end
            beta=min(beta, value);
            if alpha>=beta
                break
            end
        end
        return
    end