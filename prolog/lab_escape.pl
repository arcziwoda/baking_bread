% lab_escape game
:- consult('misc/introduction.pl').
:- consult('misc/quit.pl').
:- consult('misc/time.pl').
:- consult('misc/rules.pl').
:- consult('misc/level.pl').
:- consult('level_one/plot.pl').
:- consult('level_one/actions.pl').
:- consult('level_one/ingredients.pl').
:- consult('level_two/plot.pl').

start :-
    shell(clear),
    initialize_time_left(30),
    help,
    print_introduction.

play :-
    start_level_one.
