% function [num_expanded_nodes, path_size, path] = a_star(map, start, goal, epsilon)
% A* with manhattan distance as admissible heuristic

function [num_expanded_nodes, path_size, path] = a_star(map, start, goal, epsilon)
    
    clearvars closed open;

    % Max list size
    LIST_LIM	= 10000;
    
    % Max iterations
    IT_LIM      = 10000;

    % Libraries
    addpath(genpath('2D'));
    addpath(genpath('pq'));

    % Initializing closed list
    closed = pq_init(LIST_LIM);

    % Initializing open list
    open = pq_init(LIST_LIM);

    % Starting node on open list
    h = euclidian(start, goal, map);
    open = pq_set(open,start,0,h,0);

    % Search loop
    for i=1:IT_LIM

        % Impossible path 
        if open.size == 0
            error('Path not possible.');
        end

        % Getting best node from open list attributes
        node = open.ids(1);
        node_g = pq_g(open, node);
        node_f = pq_f(open, node);
        node_parent = pq_parent(open, node);

        % Popping best node from open list
        open = pq_pop(open);

        % Inserting expanded node into the closed list
        closed = pq_insert(closed,node,node_g,node_f,node_parent);

        % Path found 
        if node == goal
            break;
        end

        % Expanding neighbors
        nbrs = get_neighbors(map, node);

        % For each child neighbor
        for child = nbrs'

            % If child on closed list, drop it
            if pq_test(closed, child) == 1
                continue;
            end

            % Child cost to reach from start
            g = node_g+1;

            % If child on open list with lower cost to reach, drop it
            if pq_test(open, child) == 1 && g >= pq_g(open, child)
                continue;
            end

            % Admissible heuristic
            h = euclidian(child, goal, map);

            % Estimated path cost
            f = g + epsilon*h;

            % Insert child into open list 
            open = pq_set(open,child,g,f,node);

        end

    end

    % Path gathering loop
    for i=1:IT_LIM

        % Getting state coordinates
        [x,y] = state_from_index(map,node);

        % Inserting coordinates into path
        path(i,:) = [x,y];

        % Checking if done     
        if node == start
            break;
        end

        % Getting parent node
        node = pq_parent(closed,node);

    end

    % Number of expanded nodes
    num_expanded_nodes = closed.size;
    
    % Path size
    path_size = size(path,1);

end
