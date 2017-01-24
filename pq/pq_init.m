% function pq = pq_init(limit)
% Priority Queue
% /**
%  * Make a new queue.
%  * @param limit The queue can contain at most limit nodes.
%  */
% Adapted from Yang Gu, 2006, ported from Geoff's pathplan code

function pq = pq_init(limit)

    pq.emptyID = -1;
    pq.maxsize = limit;
    
    % Element ID
    pq.ids = zeros(1, limit);

    % Element directory 
    pq.directory = pq.emptyID*ones(1, pq.maxsize);

    % Priority
    pq.priorities = zeros(1, limit);
    
    % Pointer to parent
    pq.parents = zeros(1, limit);

    pq.lastpri = 0;
    pq.size = 0;
    
end


