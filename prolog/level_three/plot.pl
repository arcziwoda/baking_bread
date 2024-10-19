start_level_three :-
    shell(clear),
    initialize_level(3),
    write("Jesse: I think we have some leftover Kvass from the last batch of bread."), nl,
    write("Watler: Yes, over there, but it's pretty weak, it won't dissolve the lock quickly."), nl,
    write("Jesse: Aight, then maybe we could add something to make it stronger."), nl,
    assert(kvass_time_dissolve(3)),
    !. 

