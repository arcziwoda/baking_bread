% lab_escape game
:- multifile look_around/0.
:- multifile add/2.
:- multifile go_to/1.
:- multifile use/1.

:- consult('misc/introduction.pl').
:- consult('misc/quit.pl').
:- consult('misc/time.pl').
:- consult('misc/rules.pl').
:- consult('misc/level.pl').
:- consult('level_one/plot.pl').
:- consult('level_one/actions.pl').
:- consult('level_one/ingredients.pl').
:- consult('level_two/plot.pl').
:- consult('level_three/plot.pl').
:- consult('level_three/actions.pl').
:- consult('level_three/ingredients.pl').
:- consult('level_four/plot.pl').
:- consult('level_four/crowbar.pl').
:- consult('level_four/lockpick.pl').
:- consult('level_five/plot.pl').
:- consult('level_five/actions.pl').
:- consult('level_five/cesar.pl').
:- consult('end_game/end_game.pl').

start :-
    shell(clear),
    help,
    print_introduction.

play :-
    start_level_one.
