% function f = pq_f(pq, id)
% Returns estimated path cost (f)
% Adapted from Yang Gu, 2006, ported from Geoff's pathplan code

function f = pq_f(pq, id)

    ind = find(pq.ids == id);

    f = pq.f(ind);

end