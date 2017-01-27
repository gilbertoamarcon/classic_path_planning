clear all;
close all;
clc;

% Global parameters
FILE_NAME	= 'maze2.pgm';
STEP_SIZE   = 1.0;
EPS_GREEDY  = 0.50;

% Libraries
addpath(genpath('2D'));

% Reading map file
map = read_map(FILE_NAME);1
close all;

% Getting start node
start = get_start(map);

% Getting goal node
goal = get_goal(map);

% Keeping start time
timerVal = tic;
[path_size, path] = rrt(map, start, goal, STEP_SIZE, EPS_GREEDY);
time = toc(timerVal);

% Results
path_size
time

% Plotting path
plot_path(map,path,'RRT');

