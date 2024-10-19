:- dynamic kvass_time_dissolve/1.
:- dynamic bread_added/0.
:- dynamic water_added/0.
:- dynamic yeast_added/0.

lookAround :-
    current_level(3),

    decrement_time_left(1),
    write("Walter: What do we have here that's useful..."), nl,
    write("[sees some whole grain bread, water, and some yeast]"), nl,
    !.

%The user adds ingredient that makes the kvass the strongest
add(kvass, Ingredient) :-
    current_level(3),
    strong_ingredient(Ingredient),
    \+ bread_added,
    \+ by_the_door,

    decrement_time_left(1),
    assert(bread_added),
    subtract_from_kvass_time(2),
    !.

%The user tries to add bread again
add(kvass, Ingredient) :-
    current_level(3),
    strong_ingredient(Ingredient),
    bread_added,
    \+ by_the_door,

    decrement_time_left(1),
    write("Jesse: Yo! You already added the bread! Stop wasting time!"), nl,
    !.

%The user adds ingredient that makes the kvass a bit stronger
add(kvass, Ingredient) :-
    current_level(3),
    medium_ingredient(Ingredient),
    \+ yeast_added,
    \+ by_the_door,

    decrement_time_left(1),
    assert(yeast_added),
    subtract_from_kvass_time(1),
    !.

%The user tries to add yeast again
add(kvass, Ingredient) :-
    current_level(3),
    medium_ingredient(Ingredient),
    yeast_added,
    \+ by_the_door,

    decrement_time_left(1),
    write("Jesse: Yo! You already added the yeast! Stop wasting time!"), nl,
    !.

%The user adds ingredient that makes the kvass weaker
add(kvass, Ingredient) :-
    current_level(3),
    weak_ingredient(Ingredient),
    \+ water_added,
    \+ by_the_door,
    
    decrement_time_left(1),
    assert(water_added),
    add_to_kvass_time(1),
    !.

%The user tries to add water again
add(kvass, Ingredient) :-
    current_level(3),
    weak_ingredient(Ingredient),
    water_added,
    \+ by_the_door,
    
    decrement_time_left(1),
    write("Jesse: Yo! You already added water! Stop wasting time!"), nl,
    !.

%The user adds incorrect ingredients to the kvass
add(kvass, Ingredient) :-
    current_level(3),
    \+ strong_ingredient(Ingredient),
    \+ medium_ingredient(Ingredient),
    \+ weak_ingredient(Ingredient),
    \+ by_the_door,

    decrement_time_left(1),
    write("Jesse: Yo, that's the wrong ingredient! We gotta add the correct ingredient to make the kvass stronger."), nl,
    write("Walter: You're right, there's not much time left, think!"), nl,
    !.

%The user adds ingredient to the wrong object
add(_, _) :-
    current_level(3),
    \+ by_the_door,

    decrement_time_left(1),
    write("Jesse: Come on! We're adding ingredients to the kvass, not that!"), nl,
    write("Walter: Sorry! Got distracted!"), nl,
    !.

subtract_from_kvass_time(Amount) :-
    kvass_time_dissolve(CurrentValue),
    NewValue is CurrentValue - Amount,
    retract(kvass_time_dissolve(CurrentValue)),
    assert(kvass_time_dissolve(NewValue)).

add_to_kvass_time(Amount) :-
    kvass_time_dissolve(CurrentValue),
    NewValue is CurrentValue + Amount,
    retract(kvass_time_dissolve(CurrentValue)),
    assert(kvass_time_dissolve(NewValue)).