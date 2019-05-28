% Connect 4 Project Notre Dame Spring 2019
% Brian Donahoe, North Masciopinto, Fred Fisher, Kelso Lumantas, Jason Bourne
% EG 10112 Final Project
% Prof. McWilliams
% Updated: 4/20/2019

function handles1 = Base_V6(handles)

%can improve boolean logic for if statements
player=1;
difficulty=handles.difficulty;
aggregateMoves=handles.aggregateMoves;
row=canPlayHere(handles.pick,handles.field);
if row ~= -1 && ~gameWon(handles.field,1) && ~gameWon(handles.field,2) && difficulty ~= 0 && handles.moveNum <= 21
    handles.field(row,handles.pick)=player;
    piece = handles.redPiece;
    
    %handles.axesArray(row,handles.pick).Visible;
    axes(handles.axesArray(row,handles.pick))
    image(piece, 'AlphaData',handles.Palpha);
    axis image
    axis off
    
    if gameWon(handles.field,player)
        handles.text2.String = 'You Win!';
        handles1=handles;
        return;
    end
    
    player=2;
    pick = AIMove(difficulty, handles.field, player, aggregateMoves, handles.moveNum);
    row=canPlayHere(pick,handles.field);
    while row==-1
        pick = AIMove(difficulty, handles.field, player, aggregateMoves, handles.moveNum);
        row=canPlayHere(pick,handles.field);
    end
    if ~gameWon(handles.field,1) && ~gameWon(handles.field,2) && difficulty ~= 0
        handles.field(row,pick)=player;
        handles.moveNum = handles.moveNum+1;
        piece = handles.yellowPiece;
        
        %handles.axesArray(row,handles.pick).Visible;
        axes(handles.axesArray(row,pick))
        image(piece,'AlphaData',handles.Palpha);
        axis image
        axis off
        if gameWon(handles.field,player)
            handles.text2.String = 'You Lose!';
            handles1=handles;
            return;
        elseif handles.moveNum > 21
            handles.text2.String = 'It''s a Draw!';
            handles1=handles;
            return;
        end
    end
end
handles1=handles;
