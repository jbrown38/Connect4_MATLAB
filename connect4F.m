function [gameMoves, ifWon]=connect4F(aggregateMoves)
%clc
%clear
gameMoves = zeros(1, 21);
ifWon =0;

 
%disp(' ')
%disp('Great! Here we go!!')
%disp('At any time press CTRL and C to end game.')
%disp(' ')
%disp('LET THE GAME BEGIN!')
%disp(' ')
field = zeros(6,7);
%disp(field)
player = 1;

for i = 1:42
    %pick = -1;
        if(player==1)
          	%pause(.25)
            %pick = input('Player ONE: Pick a column number (1-7): ');
            pick=AIMove(1, field, 1,0,0);
%             while true
%             pick=randi(7);
%             if canPlayHere(pick,field) ~=-1
%                 break;
%             end
%             end
        else
            %pause(.25);
             while(true)
            	pick = AIMove(2,field,2,aggregateMoves,i/2);
%               aggregateMoves(i/2, randi(numTimesWon+7)); 
                %input('Player TWO: Pick a column number (1-7): ');
                if(canPlayHere(pick, field)~=-1)
                     break;
                end
             end
             gameMoves(i/2)=pick;
%            pick=AIMove(1, field, 2,0,0);
        end

        
        % check if player can actually play here
        row=canPlayHere(pick, field);
        field(row, pick)=player;
%    display board
%    clc
%    disp(' ')
%    disp(' ')
%    disp(field)
    
    % check if game is over
    if(gameWon(field, player))
        %disp(['Player ' num2str(player) ' wins!']);
        if player == 1
           	ifWon = 0;
        elseif player == 2
            ifWon=1;
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

if ~gameWon(field,1) && ~gameWon(field,2)
    ifWon=-1;
end

gameMoves=gameMoves';