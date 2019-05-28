% Connect 4 Project Notre Dame Spring 2019 
% Brian Donahoe, Jack Masciopinto, Thomas Fisher, Kenan Lumantas, Jason Brown
% EG 10112 Final Project
% Prof. McWilliams
% Updated: 4/10/2019

% Proof of Concept
% This code is Base_v5 but edited to have 2 easy AI's play eachother
% These AI's are easy because ther use randi(7) to determine where to play,
% no strategy is utilized.
% This code also has a counter to see how often which AI wins, either
% the first AI to play, or the second AI to play.
% Preliminary tests suggest that the first player has a slight advantage.

clc
clear

p1WinCount = 0;
p2WinCount = 0;

while true
disp(' ')
disp('Great! Here we go!!')
disp('At any time press CTRL and C to end game.')
disp(' ')
disp('LET THE GAME BEGIN!')
disp(' ')
field = zeros(6,7);
disp(field)
player = 1;
for i = 1:42
    pick = 0;
    while true
        if(player==1)
            pause(.25);
            pick = randi(7);
        else
            pause(.25);
            pick = randi(7);
        end
        
        % check if valid input
        while pick > 7 || pick < 1
                disp(' ')
                disp('Input must be 1, 2, 3, 4, 5, 6 or 7.')
                if(player==1)
                    pick = input('Player ONE: Pick a column number (1-7): ');
                else
                    pick = input('Player TWO: Pick a column number (1-7): ');
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
pause(2)
end
