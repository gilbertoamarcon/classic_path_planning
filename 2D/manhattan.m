% function h = manhattan(a, b)
% Manhattan distance

function h = manhattan(a, b, map)

    % coordinates for a
    [xa,ya] = state_from_index(map,a);
    
    % coordinates for b
    [xb,yb] = state_from_index(map,b);
    
    % Manhattan distance
    h = abs(xa-xb) + abs(ya-yb);

end