clear all;
close all;
clc;

% Global parameters
OUT_FILE1	= 'out_2d1.csv';
OUT_FILE2	= 'out_2d2.csv';
FILE_NAME1	= 'maze1.pgm';1
FILE_NAME2	= 'maze2.pgm';
EPSILON     = 10.00;
IT_LIM      = 10000;

% Test cases
file_names = {FILE_NAME1,FILE_NAME2};
out_names = {OUT_FILE1,OUT_FILE2};
time_lim = [0.050, 0.250, 1.000];

% Libraries
addpath(genpath('2D'));
addpath(genpath('pq'));

% Testing each map
for k=1:size(file_names,2)
    
    clearvars final_epsilon exp_nodes path_len;

    % Reading map file
    map = read_map(file_names{k});
    close all;

    % Getting start node
    start = get_start(map);
1
    % Getting goal node
    goal = get_goal(map);

    % Testing each time limit
    for j=1:size(time_lim,2)

        % Starting value for epsilon
        epsilon = EPSILON;

        % Keeping start time
        timerVal = tic;

        for i=1:IT_LIM

            % A*
            [num_expanded_nodes, path_size, path] = a_star_2d(map, start, goal, epsilon);

            % Data collection
            final_epsilon(i) = epsilon;
            exp_nodes(i,j) = num_expanded_nodes;
            path_len(i,j) = path_size;

            % Termination condition
            if epsilon == 1.000 || toc(timerVal) > time_lim(j)
                break;
            end

            % Updating epsilon
            epsilon = epsilon - 0.5*(epsilon-1);
            if epsilon < 1.001
                epsilon = 1.000;
            end

        end

    end

    % Table results
    epsilon_names = strread(num2str(final_epsilon,'%3.3f\n'),'%s');
    file_names{k}
    t = table(epsilon_names,exp_nodes,path_len)
    writetable(t,out_names{k});

end

