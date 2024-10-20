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
    % TODO: Implement working game_over checking
    % check_game_over(NewTimeLeft),
    print_time_left,
    !.

check_game_over(TimeLeft) :-
    TimeLeft =< 0,
    sanepid_is_coming,
    write('Game over! The sanepid came to the lab when you were still there and closed down your lab.'), nl,
    halt.

check_game_over(TimeLeft) :-
    TimeLeft =< 0,
    \+ sanepid_is_coming,
    write('Game over! The bakers came to the lab and beat you up after stealing your recipe.'), nl,
    halt.

print_time_left :-
    time_left(CurrentTimeLeft),
    nl, write('<Remaining time: '), write(CurrentTimeLeft), write(' minutes>'), nl, nl,
    !.
