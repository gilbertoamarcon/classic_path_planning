% function [pq, res] = pq_pop(pq)
% /**
% By Yang Gu, 2006, ported from Geoff's pathplan code
function [res] = pq_last(pq)
if pq.size == 0
    error('popped empty queue');
end
res = pq.ids(pq.size);