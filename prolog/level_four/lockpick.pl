:- dynamic pick_created/0.
:- dynamic by_the_door/0.
:- dynamic current_pick_sequence/1.

correct_tools_for_pick(metal_wires, hammer).
correct_tools_for_pick(hammer, metal_wires).

create_pick(Tool1, Tool2) :-
    current_level(4),
    \+ pick_created,
    correct_tools_for_pick(Tool1, Tool2),
    write("Walter: Perfect! Now we have to get back to the office door."), nl,
    assert(pick_created),
    !.

create_pick(_, _) :-
    current_level(4),
    \+ pick_created,
    decrement_time_left(2),
    write("Walter: Damn, that didn't work. We're wasting time!"), nl,
    !.

go_to(office_door) :-
    current_level(4),
    pick_created,
    decrement_time_left(1),
    assert(by_the_door),
    write("Jesse: How do we use it now?"), nl,
    write("Walter: We just have to try and hope for the best."), nl,
    !.

use(lockpick) :-
    current_level(4),
    by_the_door,
    pick_created,
    \+ lock_picked,
    write("Walter: Alright, let's try to pick the lock."), nl,
    initialize_pick_sequence,
    !.

initialize_pick_sequence :-
    current_level(4),
    by_the_door,
    pick_created,
    retractall(current_pick_sequence(_)),
    assert(current_pick_sequence([])),
    write("Walter: We need to move the pick carefully: up, down, left, or right."), nl,
    write("Walter: If we make a mistake, we'll have to start over."), nl,
    !.

correct_pick_sequence([up, right, down]).

move_pick(Direction) :-
    current_level(4),
    by_the_door,
    pick_created,
    \+ lock_picked,
    current_pick_sequence(Sequence),
    append(Sequence, [Direction], NewSequence),
    check_sequence(NewSequence),
    !.

check_sequence(NewSequence) :-
    correct_pick_sequence(CorrectSequence),
    (   prefix(NewSequence, CorrectSequence) 
    ->  update_pick_sequence(NewSequence)
    ;   fail_pick_attempt
    ).

update_pick_sequence(Sequence) :-
    retract(current_pick_sequence(_)),
    assert(current_pick_sequence(Sequence)),
    (   correct_pick_sequence(Sequence)
    ->  finish_pick_success
    ;   write("Walter: Keep going, the lock is almost there!"), nl
    ),
    !.

finish_pick_success :-
    assert(lock_picked),
    decrement_time_left(1),
    write("Walter: We did it! The lock is open!"), nl,
    write("[Office door slowly opens]"), nl,
    !.

fail_pick_attempt :-
    write("Walter: Damn, that was the wrong move. We lost some time!"), nl,
    decrement_time_left(1),
    initialize_pick_sequence,
    !.

prefix(Prefix, List) :-
    append(Prefix, _, List).
