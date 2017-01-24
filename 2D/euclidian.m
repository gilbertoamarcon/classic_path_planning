% function h = euclidian(a, b)
% Manhattan distance

function h = euclidian(a, b, map)

    % coordinates for a
    [xa,ya] = state_from_index(map,a);
    
    % coordinates for b
    [xb,yb] = state_from_index(map,b);
    
    % Manhattan distance
    h = sqrt((xa-xb)^2+(ya-yb)^2);

end