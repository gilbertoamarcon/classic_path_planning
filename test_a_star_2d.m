clear all;
close all;
clc;

% Global parameters
FILE_NAME	= 'maze2.pgm';
EPSILON     = 1.000;

% Libraries
addpath(genpath('2D'));
addpath(genpath('pq'));

% Reading map file
map = read_map(FILE_NAME);
close all;

% Getting start node
start = get_start(map);

% Getting goal node
goal = get_goal(map);

% A*
[num_expanded_nodes, path_size, path] = a_star_2d(map, start, goal, EPSILON);

% Results
num_expanded_nodes
path_size

% Plotting path
plot_path(map,path,'A-star');
