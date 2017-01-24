% function g = pq_g(pq, id)
% Returns cost to reach from start node (g)
% Adapted from Yang Gu, 2006, ported from Geoff's pathplan code

function g = pq_g(pq, id)

    ind = find(pq.ids == id);

    g = pq.g(ind);

end