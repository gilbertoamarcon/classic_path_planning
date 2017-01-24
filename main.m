clear all;
close all;
clc;

% Global parameters
FILE_NAME	= 'maze1.pgm';
LIST_LIM	= 10000;
IT_LIM      = 10000;
HEU_INFLA   = 1.00;

% Libraries
addpath(genpath('2D'));
addpath(genpath('pq'));

% Reading map file
map = read_map(FILE_NAME);

% Getting start node
start = get_start(map);

% Getting goal node
goal = get_goal(map);

% Initializing closed list
closed = pq_init(LIST_LIM);

% Initializing open list
open = pq_init(LIST_LIM);

% Starting node on open list
h = manhattan(start, goal, map);
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
        disp('Path found.');
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
        
        % If child on open list with lower cost to reach, drop it
        if pq_test(open, child) == 1 && g > pq_g(open, child)
            continue;
        end
        
        % Child cost to reach from start
        g = node_g+1;
        
        % Admissible heuristic
        h = manhattan(child, goal, map);
        
        % Estimated path cost
        f = g + HEU_INFLA*h;
        
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
num_expanded_nodes = closed.size

% Plotting path
plot_path(map,path,'A-star');
