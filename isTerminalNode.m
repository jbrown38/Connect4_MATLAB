function isTerminal=isTerminalNode(board)
    isTerminal = gameWon(board, 1) || gameWon(board, 2) || size(getValidLocations(board), 2)==-1;