% lab_escape game
:- consult('misc/introduction.pl').
:- consult('misc/quit.pl').
:- consult('misc/rounds.pl').
:- consult('misc/rules.pl').
:- consult('level_one/plot.pl').
:- consult('level_one/actions.pl').
:- consult('level_one/ingredients.pl').

start :-
    shell(clear),
    initialize_rounds(30),
    help,
    print_introduction.

play :-
    shell(clear),
    start_level_one.