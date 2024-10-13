% lab_escape game
:- consult('misc/introduction.pl').
:- consult('misc/quit.pl').
:- consult('misc/rounds.pl').
:- consult('misc/rules.pl').
:- consult('muffins_quest/plot.pl').
:- consult('muffins_quest/actions.pl').
:- consult('muffins_quest/ingredients.pl').

start :-
    shell(clear),
    initialize_rounds(30),
    help,
    print_introduction.

play :-
    shell(clear),
    start_level_one.