% function [priority] = pq_priority(pq, id)
% Returns the node priority
% Adapted from Yang Gu, 2006, ported from Geoff's pathplan code

function priority = pq_priority(pq, id)

    ind = find(pq.ids == id);

    priority = pq.priorities(ind);

end