function move=immediateWin(board, player)

% Connect 4 Project Notre Dame Spring 2019 
% Brian Donahoe, Jack Masciopinto, Thomas Fisher, Kenan Lumantas, Jason Brown
% EG 10112 Final Project
% Prof. McWilliams
% Updated: 4/10/2019


originalBoard=zeros(6, 7);
originalBoard=board;

for(i =1:7)
	if(canPlayHere(i,board)~=-1)
		board(canPlayHere(i,board),i)=player;
    if(gameWon(board,player))
    		move = i;
    		return;
    else
    	board = originalBoard;
    end
  end
end
move = -1;