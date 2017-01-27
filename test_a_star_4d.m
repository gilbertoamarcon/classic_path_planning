clear all;
close all;
clc;

% Global parameters
FILE_NAME	= 'maze1.pgm';
EPSILON     = 1.000;

% Libraries
addpath(genpath('4D'));
addpath(genpath('pq'));

% Reading map file
map = read_map_for_dynamics(FILE_NAME);
close all;

% Getting start node
start = get_start_dynamic(map);

% Getting goal node
goal = get_goal_dynamic(map);

% A* 4D
[num_expanded_nodes, path_size, path] = a_star_4d(map, start, goal, EPSILON);

% Results
num_expanded_nodes
path_size

% % Plotting path
plot_path(map,path,'A-star');
