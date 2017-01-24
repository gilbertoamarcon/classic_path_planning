% function [pq, res] = pq_pop(pq)
% /**
%      * Popping lowest cost element
%      */
% Adapted from Yang Gu, 2006, ported from Geoff's pathplan code

function [pq, id] = pq_pop(pq)
    if pq.size == 0
        error('popped empty queue');
    end
    id = pq.ids(1);
    pq.lastpri = pq.f(1);

    pq.directory(pq.ids(1)) = pq.emptyID;

    if pq.size > 0
        pq = pq_swap(pq, 1, pq.size);
        pq = pq_percolateDown(pq, 1);
    end

    pq.size = pq.size - 1;
end