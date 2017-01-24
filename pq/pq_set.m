% function pq = pq_set(pq, id, f)
% /**
%      * Reset the f of an element, or insert it if it's not
%      * already there.
%      * @param id The element ID.
%      * @param f The element f.
%      */
% Adapted from Yang Gu, 2006, ported from Geoff's pathplan code

function pq = pq_set(pq, id, g, f, parent)

    elemID = pq.directory(id);
    if elemID == pq.emptyID
        pq = pq_insert(pq, id, g, f, parent);
    elseif pq.f(elemID) < f
        pq.f(elemID) = f;
        pq= pq_percolateDown(pq, elemID);
    else
        pq.f(elemID) = f;
        pq = pq_percolateUp(pq, elemID);
    end
    
end





     
     
