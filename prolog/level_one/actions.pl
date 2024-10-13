:- dynamic sanepid_is_coming/0.
:- dynamic police_is_coming/0.

lookaround :-
    decrement_round,
    write("Walter: Let's see what's on the table..."), nl,
    write("[sees sugar, blue food coloring, baking soda and los pollos hermanos sauce]"), nl.

add(muffins, Ingredient) :-
    correct_ingredient(Ingredient),
    write("Walter: That's it! The final ingredient for the muffins is "), write(Ingredient), write("!"), nl,
    write("Jesse: Awesome! Let's finish these muffins!"), nl,
    write("[The phone rings]"), nl,
    write("<Paul Badman>: Yo, Walter! It's Paul Badman. The sanepid is on their way, you gotta scram, man!"), nl,
    initialize_rounds(25),
    assert(sanepid_is_coming),
    !.

add(muffins, Ingredient) :-
    explosive_ingredient(Ingredient),
    write("Walter: Oh no! The oven exploded! The alarms are going off!"), nl,
    write("Jesse: The police will come soon, they know about the secret bakery!"), nl,
    write("[The phone rings]"), nl,
    write("<Paul Badman>: Hey, genius! What did you do? The cops are on their way! You better run!"), nl,
    initialize_rounds(20),
    assert(police_is_coming),
    !.

add(muffins, Ingredient) :-
    \+ correct_ingredient(Ingredient),
    \+ explosive_ingredient(Ingredient),
    decrement_round,
    write("Walter: No, that's not right. We need to add the correct ingredient to the muffins."), nl,
    write("Jesse: Come on, think! What was it again?"), nl,
    !.

add(_, _) :-
    decrement_round,
    write("Walter: We are not adding ingredients to that! Focus on the muffins!"), nl,
    !.