% Connect 4 Project Notre Dame Spring 2019 
% Brian Donahoe, Jack Masciopinto, Thomas Fisher, Kenan Lumantas, Jason Brown
% EG 10112 Final Project
% Prof. McWilliams
% Updated: 4/10/2019

function row=canPlayHere(pick, field)
% Given the board and the desired token place location, return the row in
% which the token will be placed in that location, or -1 if the user cannot
% play here.
if(pick<1)
    row=-1;
    return;
end
row=canPlayHereRecursive(6, pick, field);
 
function row=canPlayHereRecursive(i, pick, field)
% Iterates through the specified column to determine if there is an open
% spot in this column, returning the row of the first open spot or -1 if
% no open spots are found.
 
if(field(i,pick)~=0)
    if(i==1)
        row=-1;
    else
        row=canPlayHereRecursive(i-1, pick, field);
    end
else
    row=i;
end