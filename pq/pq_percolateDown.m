% function pq = pq_percolateDown(pq, i)
% We have just made the priority at the given heap index
% numerically larger.  Swap nodes to restore the heap property.
% Adapted from Yang Gu, 2006, ported from Geoff's pathplan code

function pq = pq_percolateDown(pq, i)
    child = i*2;
    while (child < pq.size)
        if (child < pq.size - 1 & pq.f(child) > pq.f(child + 1))
            child = child + 1;
        end
        if ( pq.f(i) <= pq.f(child))
            break;
        end
        pq = pq_swap(pq, i, child);
        i = child;
        child = i*2;
    end
end
