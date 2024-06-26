set alist to {1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0}
set med to medi(alist)

on medi(alist)

    set temp to {}
    set lcount to count alist
    if lcount is equal to 2 then
        return ((item 1 of alist) + (item 2 of alist)) / 2
    else if lcount is less than 2 then
        return item 1 of alist
    else --if lcount is greater than 2
        set min to findmin(alist)
        set max to findmax(alist)
        repeat with x from 1 to lcount
            if x is not equal to min and x is not equal to max then set end of temp to item x of alist
        end repeat
        set med to medi(temp)
    end if
    return med

end medi

on findmin(alist)

    set min to 1
    set alength to count every item of alist
    repeat with x from 1 to alength
        if item x of alist is less than item min of alist then set min to x
    end repeat
    return min

end findmin

on findmax(alist)

    set max to 1
    set alength to count every item of alist
    repeat with x from 1 to alength
        if item x of alist is greater than item max of alist then set max to x
    end repeat
    return max

end findmax
