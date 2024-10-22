% Predicate to print the available commands
help :-
    write("### Game rules ###"), nl,
    write("---------------------------------------------"), nl,
    write("Yo, here are the commands you can use, b****:"), nl,
    write("1. talkTo(name?) - Yo, talk to this dude or dudette, keep the convo going, man!"), nl,
    write("2. lookAround - Yo, check out what you can see!"), nl,
    write("3. add(where?, what?) - Yo, add something to something, simple, got it?"), nl,
    write("4. use(what?) - Yo, you can use something you have."), nl,
    write("5. goTo(where?) - Yo, go to a place, or somethin'."), nl,
    write("6. choosePath(name?) - Yo, sometimes you gotta choose who do you want to listen to."), nl,
    write("7. search(what?) - Yo, search for something, maybe you'll find something useful."), nl,
    write("8. hack(what?) - Yo, hack something, if you can."), nl,
    write("9. call(name?) - Yo, call someone, maybe they can help you."), nl,
    write("10. open(what?) - Yo, open something, if you can."), nl,
    write("---------------------------------------------"), nl,
    write("Type \"help.\" to see this message again."), nl,
    write(""), nl.