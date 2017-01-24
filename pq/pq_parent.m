% function parent = pq_parent(pq, id)
% Returns the pointer to parent node
% Adapted from Yang Gu, 2006, ported from Geoff's pathplan code

function parent = pq_parent(pq, id)

    ind = find(pq.ids == id);

    parent = pq.parents(ind);

end