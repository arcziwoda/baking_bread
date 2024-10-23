:- dynamic lock_picked/0.

start_level_four :-
    initialize_level(4),
    write("Jesse: We need to find tools for making a lock pick!"), nl,
    write("Walter: Or we could try to find a crowbar somewhere."), nl,
    !.

look_around :-
    current_level(4),
    \+ pick_created,
    write("Walter: Let's see what we can find here..."), nl,
    write("[sees some metal wires, a screwdriver, a hammer, and a wrench]"), nl,
    write("Walter: These tools could help us make a lock pick. I belive it is made from two things"), nl,
    write("[sees a hatch, a tool cabinet, a metal barrel, and a dumpster]"), nl,
    write("Walter: We could search these places for the crowbar"), nl,
    !.


go_to(door) :-
    current_level(4),
    lock_picked,
    start_level_five,
    !.
