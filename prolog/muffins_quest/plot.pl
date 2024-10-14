muffins_quest :-
    write("Walter: Yo, Jesse, you there?"), nl,
    write("Jesse: Yeah, Mr. Black, what's up?"), nl,
    write("Walter: It's been a rough day, huh?"), nl,
    write("Jesse: You bet. These \"Blue muffins\" are no joke."), nl,
    write("Walter: We need to finish them up."), nl.

talkTo(jesse) :-
    \+ sanepid_is_coming,
    \+ police_is_coming,
    decrement_round,
    write("Jesse: Man, I never thought baking could be this intense."), nl,
    write("Walter: It's all about precision, Jesse. One wrong move and it's all over."), nl,
    write("Jesse: Yeah, yeah, I get it. But these muffins... they're something else."), nl,
    write("Walter: They have to be perfect. Our reputation depends on it."), nl,
    write("Jesse: Yo, Mr. Black, what's the final ingredient for the cake?"), nl,
    write("Jesse: I totally forgot, man. Maybe you should look around to see what's on the table."), 
    !.

talkTo(saul) :-
    sanepid_is_coming,
    decrement_round,
    write("<Saul Badman>: Hey, Walter! It's Saul. Listen, the sanepid is on their way. You gotta get outta there, man!"), nl,
    write("Walter: Damn it, Saul! How much time do we have?"), nl,
    write("<Saul Badman>: Not much, maybe a few minutes. You need to move!"), nl,
    write("Jesse: Yo, Mr. Black, this is bad. What do we do?"), nl,
    write("Walter: We need to get to the main door, Jesse. Now!"), nl,
    write("Jesse: Alright, let's go!"), nl.

talkTo(saul) :-
    police_is_coming,
    decrement_round,
    write("<Saul Badman>: Hey, genius! What did you do? The cops are on their way! You better run!"), nl,
    write("Walter: Damn it, Saul. How much time do we have?"), nl,
    write("<Saul Badman>: Not much, Walter. You need to get out of there, fast!"), nl,
    write("Jesse: Mr. Black, we gotta move! What now?"), nl,
    write("Walter: Head to the main door, Jesse. We don't have much time!"), nl,
    write("Jesse: Got it, let's get outta here!"), nl.

goTo(main_door) :-
    muffins_done,
    decrement_round,
    shell(clear),
    start_level_two.