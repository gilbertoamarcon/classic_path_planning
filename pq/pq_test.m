% function test = pq_test(pq, id)
% /**
%      * Test if an id is in pq. Returns 1 if it is.
%      * @param id The element ID.
%      */
% Adapted from Geoff Hollinger, 2006

function test = pq_test(pq, id)

    ind = find(pq.ids == id);

    if(ind <= pq.size)
        test = 1;
    else
        test = 0;
    end
    
end