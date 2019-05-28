function validLocations=getValidLocations(board)
    validLocations =[];
    for(col=1:7)
        if(canPlayHere(col, board)~=-1)
            validLocations(size(validLocations, 2)+1)=col;
        end
    end
    
    if(size(validLocations, 2)==0)
        validLocations=-1;
    end