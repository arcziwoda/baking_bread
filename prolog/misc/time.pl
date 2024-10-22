:- (dynamic time_left/1).

initialize_time_left(Time) :-
    retractall(time_left(_)),
    assert(time_left(Time)),
    !.

decrement_time_left(Amount) :-
    time_left(CurrentTimeLeft),
    NewTimeLeft is CurrentTimeLeft - Amount,
    retract(time_left(CurrentTimeLeft)),
    assert(time_left(NewTimeLeft)),
    check_time_left,
    print_time_left,
    !.

print_time_left :-
    time_left(CurrentTimeLeft),
    nl, write('<Remaining time: '), write(CurrentTimeLeft), write(' minutes>'), nl, nl,
    !.

check_time_left :-
    time_left(CurrentTimeLeft),
    (CurrentTimeLeft =< 0 ->
        (bakers_are_coming ->
            write("[Walter and Jesse didn't escape in time and the bakers made it to the lab]"), nl,
            write("Jack Welker: We got you now!"), nl,
            write("Walter: We should have taken this pepper spray!"), nl,
            write("Jack Welker: You're dead meat!"), nl,
            write("[Jack shoots Walter and Jesse]"), nl
        ;
        sanepid_is_coming ->
            write("[Walter and Jesse didn't escape in time and the sanepid inspector made it to the lab]"), nl,
            write("Hank Schrader: Sanepid inspection! Get out of there now!"), nl,
            write("Walter: We should have taken this pepper spray!"), nl,
            write("Hank Schrader: You're under arrest!"), nl,
            write("[Hank arrests Walter and Jesse]"), nl
        ),
        player_lost
    ;
        true
    ),
    !.