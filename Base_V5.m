% Connect 4 Project Notre Dame Spring 2019 
% Brian Donahoe, North Masciopinto, Fred Fisher, Kelso Lumantas, Jason Bourne
% EG 10112 Final Project
% Prof. McWilliams
% Updated: 4/10/2019



% Sets both players to wins of 0
p1WinCount = 0;
p2WinCount = 0;

for(i=1:7)
    aggregateMoves(1:21,i)=i;
end

numSims=600;
games=0;
for(iSims=0:numSims-1)
    ifWon=0;
	while ifWon~=1
		[gameMoves, ifWon]=connect4F(aggregateMoves);
        games=games+1;
    end
  aggregateMoves=[aggregateMoves gameMoves];
end



wins=0;
losses=0;
draws=0;
numSims = 1000;
games = 0;
for(jSims=0:numSims-1)
  [gameMoves, ifWon]=connect4F(aggregateMoves);
  if ifWon==1
      wins=wins+1;
  elseif ifWon==0
      losses=losses+1;
  elseif ifWon==-1
      draws=draws+1;
  end
end




% Sets up introduction to game in command window
disp(' ')
disp('Great! Here we go!!')
disp('At any time press CTRL and C to end game.')
disp(' ')
disp('LET THE GAME BEGIN!')
disp(' ')
difficulty=input('Input difficulty (1 for easy, 2 for intermediate): ');

% Displays array as the game board
field = zeros(6,7);
disp(field)
player = 1;
for i = 1:42
% 'i' goes to 42 because that is the max number of plays to fill the board
    pick = 0;
    while true
        if(player==1)
            pause(.25);
            pick = input('Player ONE: Pick a column number (1-7): ');
            % Asks first player to give a column they want to play into
        else
            pick = AIMove(difficulty, field, 2, aggregateMoves, i/2);
            % Asks second player to give a column they want to play into
        end
        
        % check if valid input
        while pick > 7 || pick < 1
       % Displays statement if input column is not on gameboard
                disp(' ')
                disp('Input must be 1, 2, 3, 4, 5, 6 or 7.')
                if(player==1)
                    pick = input('Player ONE: Pick a column number (1-7): ');
                else
                    pick = input('Player TWO: Pick a column number (1-7): ');
                    % Asks for input again if column not within gameboard
                end
        end
        
        % check if player can actually play here
        row=canPlayHere(pick, field);
        if(row==-1)
            disp('Cannot play here, choose a different column.');
        else
            field(row, pick)=player;
            break;
        end  
    end
    
    % display board
    clc
    disp(' ')
    disp(' ')
    disp(field)
    
    % check if game is over
    if(gameWon(field, player))
        disp(['Player ' num2str(player) ' wins!']);
        % Adds 1 to a players win count if they win
        if player == 1
            p1WinCount = p1WinCount + 1;
        elseif player == 2
            p2WinCount = p2WinCount + 1;
        end
        break;
    end
    
   % switch players
   if(player==1)
       player=2;
   else
       player=1;
   end
end
 
% check if draw
if(~gameWon(field, player))
    disp('The game has ended as a draw!');
end