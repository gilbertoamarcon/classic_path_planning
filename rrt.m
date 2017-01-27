% function [path_size, path] = rrt(map, start, goal, step_size, eps_greedy)
% RRT with epsilon-greedy sampling

function [path_size, path] = rrt(map, start, goal, step_size, eps_greedy)

    % Global parameters
    MAX_IT    	= 10000;
    DEBUG    	= 0;

    % Libraries
    addpath(genpath('2D'));

    % Getting start node
    [x,y] = state_from_index(map,start);
    start = [x,y];

    % Getting goal node
    [x,y] = state_from_index(map,goal);
    goal = [x,y];

    % Initializing tree with start node
    ns(1,:) = start;

    % Tree expansion
    for i = 2:MAX_IT

        % Getting valid random sample
        while 1

            % Random sample
            if rand > eps_greedy
                sample = [1+rand*(map.R-1),1+rand*(map.C-1)];
            else
                sample = goal;
            end

            % Closest graph node to sample      
            closest_index = knnsearch(ns,sample,'dist','euclidean','k',1);
            closest = ns(closest_index,:);

            % Delta
            delta = sample - closest;
            delta = step_size*delta/norm(delta);

            % If valid, break
            if ~check_hit(map, closest(1), closest(2), delta(1), delta(2))
                break;
            end

        end

        % New node     
        new = closest + delta;

        % Adding new node to graph     
        ns(i,:) = new;
        np(i-1) = closest_index;

        % Stop condition
        if norm(new - goal) < 1
            break;
        end    

    end

    % Path gathering loop
    i = size(ns,1);
    for p=1:size(ns,1)

        % Inserting coordinates into path
        path(p,:) = ns(i,:);

        % Start reached
        if ns(i,:) == start
            break;
        end

        % Getting parent node
        i = np(i-1);

    end

    % Path size 
    path_size = step_size*size(path,1);

    % Plotting graph
    if DEBUG == 1
        hold on;
        axis([0 map.R+1 0 map.C+1]);
        axis square;
        axis ij;
        % Tree
        for i = 2:size(ns,1)
            x = [ns(i,1) ns(np(i-1),1)];
            y = [ns(i,2) ns(np(i-1),2)];
            plot(x,y,'k');
        end
        % Path
        plot(path(:,1),path(:,2),'r');
    end

end
