:- dynamic by_the_door/0.
:- dynamic pepper_spray/0.
:- dynamic lock_dissolved/0.

start_level_three :-
    initialize_level(3),
    current_level(3),
    decrement_time_left(1),
    write("Jesse: I think we have some leftover Kvass from the last batch of bread."), nl,
    write("Watler: Yes, over there, but it's pretty weak, it won't dissolve the lock quickly."), nl,
    write("Jesse: Aight, then maybe we could add something to make it stronger or go straight to the office door and use it."), nl,
    assert(kvass_time_dissolve(3)),
    !. 

go_to(office_door) :-
    current_level(3),
    \+ by_the_door,

    decrement_time_left(1),
    assert(by_the_door),
    write("Walter: Ok, the kvass is ready, now let's take it to the office's door."), nl,
    write("Jesse: Yo, I remember there was a pepper spray in the lab. Maybe we should take it?"), nl,
    write("Walter: I don't know Jesse, it will take some time to find it..."), nl,
    !.

take(pepper_spray) :-
    current_level(3),
    by_the_door,

    decrement_time_left(2),
    assert(pepper_spray),
    write("Jesse: Yo Mr. Black, there's still some left in the can, this might come in handy later..."), nl,
    !.

%User uses kvass on the door lock
use(kvass) :-
    current_level(3),
    by_the_door,

    kvass_time_dissolve(TimeDissolve),
    decrement_time_left(TimeDissolve),
    write("Jesse: Aight, now let's pour this bad boy on the lock!"), nl,
    write("Walter: Here goes nothing..."),
    nl, write('<It took '), write(TimeDissolve), 
    (TimeDissolve =:= 1 -> write(' minute') ; write(' minutes')),
    write(' to dissolve the lock.>'), nl, nl,
    write("[Office door slowly opens]"), nl,
    assert(lock_dissolved),
    !.

go_to(office) :-
    current_level(3),
    by_the_door,
    lock_dissolved,
    start_level_five,
    !.
