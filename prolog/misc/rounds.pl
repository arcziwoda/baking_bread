% Define dynamic predicate for round counter
:- (dynamic round/1).

% Initialize the round counter with a specified number of rounds
initialize_rounds(Rounds) :-
    retractall(round(_)),
    assert(round(Rounds)).

% Decrement the round counter
decrement_round :-
    round(CurrentRound),
    NewRound is CurrentRound-1,
    retract(round(CurrentRound)),
    assert(round(NewRound)),
    check_game_over(NewRound).

% Check if the game is over
check_game_over(0) :-
    % TODO: Implement dirrerent game overs (police or the other gang catches you)
    write('Game over! You have run out of rounds.'), nl,
    halt.
    check_game_over(_).

% Print the remaining rounds
print_rounds :-
    round(CurrentRound),
    write('Remaining rounds: '), write(CurrentRound), nl.