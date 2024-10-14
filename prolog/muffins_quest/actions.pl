:- dynamic sanepid_is_coming/0.
:- dynamic police_is_coming/0.
:- dynamic muffins_done/0.

lookAround :-
    decrement_round,
    write("Walter: Let's see what's on the table..."), nl,
    write("[sees sugar, blue food coloring, baking soda and los pollos hermanos sauce]"), nl.

% The user adds correct ingredients to the muffins
add(muffins, Ingredient) :-
    muffins_done,
    decrement_round,
    write("Jesse: Yo, the muffins are done, b****! Anwser that phone!"), nl,
    !.

add(muffins, Ingredient) :-
    correct_ingredient(Ingredient),
    write("Walter: That's it! The final ingredient for the muffins is "), write(Ingredient), write("!"), nl,
    write("Jesse: Yo, Mr. Black! These muffins are gonna be tight!"), nl,
    write("Walter: Yes, Jesse. Now let's finish these muffins and move on."), nl,
    write("[The phone rings]"), nl,
    write("Jesse: Yo, Mr. Black! It's Saul! Better pick that up!"), nl,
    initialize_rounds(25),
    assert(correct_ingredient_added),
    assert(sanepid_is_coming),
    assert(muffins_done),
    !.

% The user adds explosive ingredients to the muffins
add(muffins, Ingredient) :-
    explosive_ingredient(Ingredient),
    write("Walter: Damn it! The oven overheated! The alarms are going off!"), nl,
    write("Jesse: The police will come soon, they will know about the secret bakery!"), nl,
    write("[The phone rings]"), nl,
    write("Jesse: Yo, Mr. Black! It's Saul! Better pick that up!"), nl,
    write("<Saul Badman>: Hey, genius! What did you do? The cops are on their way! You better run!"), nl,
    initialize_rounds(20),
    assert(police_is_coming),
    assert(muffins_done),
    !.

% The user adds incorrect ingredients to the muffins
add(muffins, Ingredient) :-
    \+ correct_ingredient(Ingredient),
    \+ explosive_ingredient(Ingredient),
    decrement_round,
    write("Walter: No, that's not right. We need to add the correct ingredient to the muffins."), nl,
    write("Jesse: Come on, think! What was it again?"), nl,
    !.

% The user adds ingredients to the wrong object
add(_, _) :-
    decrement_round,
    write("Walter: We are not adding ingredients to that! Focus on the muffins!"), nl,
    !.