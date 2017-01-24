
function [parent] = pq_parent(pq, id)

ind = find(pq.ids == id);

parent=pq.parents(ind);

end