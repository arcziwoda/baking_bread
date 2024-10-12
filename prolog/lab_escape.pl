% lab_escape game
:- consult('misc/introduction.pl').
:- consult('misc/quit.pl').
:- consult('misc/rounds.pl').

start :-
    initialize_round,
    print_introduction,
    write('The game starts now...'),
    nl.