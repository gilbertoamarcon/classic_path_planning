% function h = euclidian(a, b)
% Euclidian distance

function h = euclidian(a, b, map)

    % coordinates for a
    [xa,ya] = state_from_index(map,a);
    posa = [xa,ya];
    
    % coordinates for b
    [xb,yb] = state_from_index(map,b);
    posb = [xb,yb];
    
    % Euclidian distance
    h = norm(posb - posa);

end