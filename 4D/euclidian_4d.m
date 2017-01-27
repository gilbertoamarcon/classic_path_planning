% function h = euclidian_4d(a, b, map)
% Euclidian distance, corrected for max speed

function h = euclidian_4d(a, b, map)

    % coordinates for a
    [xa,ya,dxa,dya] = dynamic_state_from_index(map,a);
    posa = [xa,ya];
    
    % coordinates for b
    [xb,yb,dxb,dyb] = dynamic_state_from_index(map,b);
    posb = [xb,yb];
    
    % Euclidian distance, corrected for max speed
    h = norm((posb - posa))/(map.maxV^2);

end