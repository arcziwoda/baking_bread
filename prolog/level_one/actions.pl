:- dynamic bakers_are_coming/0.
:- dynamic sanepid_is_coming/0.
:- dynamic muffins_done/0.

lookAround :-
    current_level(1),

    decrement_time_left(1),
    write("Walter: Let's see what's on the table..."), nl,
    write("[sees sugar, blue food coloring, baking soda and los pollos hermanos sauce]"), nl,
    !.

% The user adds correct ingredients to the muffins
add(muffins, _) :-
    current_level(1),
    muffins_done,

    decrement_time_left(1),
    write("Jesse: Yo, the muffins are done, b****! Anwser that phone!"), nl,
    !.

add(muffins, Ingredient) :-
    current_level(1),
    correct_ingredient(Ingredient),

    decrement_time_left(5),
    write("Walter: That's it! The final ingredient for the muffins is "), write(Ingredient), write("!"), nl,
    write("Jesse: Yo, Mr. Black! These muffins are gonna be tight!"), nl,
    write("Walter: Yes, Jesse. Now let's finish these muffins and move on."), nl,
    write("[The phone rings]"), nl,
    write("Jesse: Yo, Mr. Black! It's Saul! Better pick that up!"), nl,
    assert(correct_ingredient_added),
    assert(bakers_are_coming),
    assert(muffins_done),
    !.

% The user adds explosive ingredients to the muffins
add(muffins, Ingredient) :-
    current_level(1),
    explosive_ingredient(Ingredient),

    decrement_time_left(10),
    write("Walter: Damn it! The oven overheated! The alarms are going off!"), nl,
    write("Jesse: The police will come soon, they will know about the secret bakery!"), nl,
    write("[The phone rings]"), nl,
    write("Jesse: Yo, Mr. Black! It's Saul! Better pick that up!"), nl,
    assert(sanepid_is_coming),
    assert(muffins_done),
    !.

% The user adds incorrect ingredients to the muffins
add(muffins, Ingredient) :-
    current_level(1),
    \+ correct_ingredient(Ingredient),
    \+ explosive_ingredient(Ingredient),

    decrement_time_left(1),
    write("Walter: No, that's not right. We need to add the correct ingredient to the muffins."), nl,
    write("Jesse: Come on, think! What was it again?"), nl,
    !.

% The user adds ingredients to the wrong object
add(_, _) :-
    current_level(1),

    decrement_time_left(1),
    write("Walter: We are not adding ingredients to that! Focus on the muffins!"), nl,
    !.
