:- (dynamic kvass_time_dissolve/1).

lookAround :-
    current_level(3),

    decrement_time_left(1),
    write("Jesse: What do we have here that's useful..."), nl,
    write("[sees some whole grain bread, water, and some yeast]"), nl,
    !.

%The user adds ingredient that makes the kvass the strongest
add(kvass, Ingredient) :-
    current_level(3),

    decrement_time_left(1),
    strong_ingredient(Ingredient),
    assert(kvass_time_dissolve(1)), 
   !.
