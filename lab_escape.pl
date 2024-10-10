% lab_escape game
:- consult('misc/introduction.pl').
:- consult('misc/quit.pl').

start :-
    print_introduction,
    write('The game starts now...'),
    nl.