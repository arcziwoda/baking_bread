:- dynamic can_make_kvass/0.
:- dynamic can_make_lockpick/0.

start_level_two :-
    initialize_level(2),
    decrement_time_left(1),
    write("Jesse: Yo, the door won't open!"), nl,
    write("Walter: Damn it, it can only be unlocked by a key card. I think it's locked in Sus' office."), nl,
    write("Jesse: And how do we get there?"), nl,
    write("Walter: We don't have the key, but we could try to pick the lock."), nl,
    write("Jesse: I ain't no locksmith, we should use some Kvass to melt the lock."), nl,
    write("Walter: We have to pick one of the options, we don't have much time left!"), nl,
    !. 

choosePath(jesse) :-
    current_level(2),
    \+ can_make_lockpick,
    decrement_time_left(1),
    write("Jesse: Yo, Mr. Black, we gotta go back to the lab to make the Kvass, let's go!"), nl,
    assert(can_make_kvass),
    !.

choosePath(walter) :-
    current_level(2),
    \+ can_make_kvass,
    decrement_time_left(1),
    write("Walter: We should be able to make the lockpick out of some scraps left in the lab. Follow me."), nl,
    assert(can_make_lockpick),
    !.

goTo(lab) :-
    current_level(2),
    can_make_kvass,
    start_level_three,
    !.

goTo(lab) :-
    current_level(2),
    can_make_lockpick,
    decrement_time_left(1),
    start_level_four,
    !.