clear all;
close all;
clc;

% Global parameters
FILE_NAME	= 'maze1.pgm';
LIST_LIM	= 10000;
IT_LIM      = 10000;

% Libraries
addpath(genpath('2D'));
addpath(genpath('pq'));

% Reading map file
map = read_map(FILE_NAME);

% Getting start node
[start,~] = get_start(map);

% Getting goal node
goal = get_goal(map);

% Initializing closed list
closed = pq_init(LIST_LIM);

% Initializing open list
open = pq_init(LIST_LIM);

% Starting node on open list
open = pq_set(open,start,0,0);

% Search loop
for i=1:IT_LIM
    
    % Impossible path 
    if open.size == 0
        error('Path not possible.');
    end
    
    % Getting best node from open list attributes
    node = open.ids(1);
    [node_g] = pq_priority(open, node);
    [node_parent] = pq_parent(open, node);

    % Popping best node from open list
    open = pq_pop(open);
    
    % Inserting expanded node into the closed list
    closed = pq_insert(closed,node,node_g,node_parent);
    
    % Path found 
    if node == goal
        disp('Path found.');
        break;
    end
    
    % Expanding neighbors
    [nbrs, ~] = get_neighbors(map, node);
    
    % For each child neighbor
    for child = nbrs'
        
        % Child cost
        g = node_g+1;
        
        % If child on closed list, drop it
        if pq_test(closed, child) == 1
            continue;
        end
        
        % If child on open list with lower cost, drop it
        if pq_test(open, child) == 1 && g > pq_priority(open, child)
            continue;
        end
        
        % Insert child into open list 
        open = pq_set(open,child,g,node);
        
    end
    
end

% Goal node
[node] = pq_last(closed);

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
    [node] = pq_parent(closed,node);

end

% Plotting path
plot_path(map,path,'A-star');
