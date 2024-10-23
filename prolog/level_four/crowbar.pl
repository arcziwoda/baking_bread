:- dynamic crowbar_found/0.

valid_crowbar_location(metal_barrel).

search_for(crowbar, Location) :-
    current_level(4),
    \+ crowbar_found,
    valid_crowbar_location(Location),
    decrement_time_left(1),
    assert(crowbar_found),
    write("Jesse: B****! We found a crowbar!"), nl,
    write("**Now you can use() the crowbar**"), nl,
    !.

search_for(crowbar, _) :-
    current_level(4),
    \+ crowbar_found,
    decrement_time_left(1),
    write("Walter: No luck here. Let's keep searching."), nl,
    !.

search_for(_, _) :-
    current_level(4),
    \+ crowbar_found,
    decrement_time_left(1),
    write("Jesse: We ain't looking for that now! Hurry!"), nl,
    !.

use(crowbar) :-
    current_level(4),
    crowbar_found,
    decrement_time_left(3),
    write("Walter: Let's use the crowbar to force the door open."), nl,
    write("[The door opens with a loud noise]"), nl,
    write("Jesse: Yes b****! Let's go through them man!"), nl,
    write("**Now you can go_to() the door**"), nl,
    assert(lock_picked),
    !.
