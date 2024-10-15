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
    check_game_over(NewTimeLeft),
    print_time_left,
    !.

check_game_over(TimeLeft) :-
    TimeLeft =< 0,
    % TODO: Implement dirrerent game overs (police or the other gang catches you)
    write('Game over! You have run out of time.'), nl,
    halt.

check_game_over(_).

print_time_left :-
    time_left(CurrentTimeLeft),
    nl, write('<Remaining time: '), write(CurrentTimeLeft), write(' minutes>'), nl, nl,
    !.
