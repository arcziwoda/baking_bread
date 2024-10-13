start_level_one :-
    write("Walter: Yo, Jesse, you there?"), nl,
    write("Jesse: Yeah, Mr. Black, what's up?"), nl,
    write("Walter: It's been a rough day, huh?"), nl,
    write("Jesse: You bet. These \"Blue muffins\" are no joke."), nl,
    write("Walter: We need to finish them up."), nl.

talkTo(Jesse) :-
    decrement_round,
    write("Jesse: Man, I never thought baking could be this intense."), nl,
    write("Walter: It's all about precision, Jesse. One wrong move and it's all over."), nl,
    write("Jesse: Yeah, yeah, I get it. But these muffins... they're something else."), nl,
    write("Walter: They have to be perfect. Our reputation depends on it."), nl,
    write("Jesse: Yo, Mr. Black, what's the final ingredient for the cake?"), nl,
    write("Jesse: I totally forgot, man. Maybe you should look around to see what's on the table."), nl.