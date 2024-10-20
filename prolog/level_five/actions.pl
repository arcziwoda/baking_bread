:- dynamic has_keycard/0.
:- dynamic has_PIN_code/0.
:- dynamic by_the_door/0.

lookAround :-
    current_level(5),
    decrement_time_left(1),
    write("Walter: Let's find that keycard..."), nl,
    write("[The office is small. There are shelves and desk with computer on it]"), nl,
    !.

search(shelves) :-
    current_level(5),
    \+ has_keycard,
    \+ has_PIN_code,
    decrement_time_left(1),
    write("Jesse: Nothing here, let's keep looking"), nl,
    !.

search(desk) :-
    current_level(5),
    \+ has_keycard,
    \+ has_PIN_code,
    decrement_time_left(1),
    assert(has_keycard),
    write("Walter: Found it!"), nl,
    write("Jesse: That's the stuff, Mr. Black!"), nl,
    write("[Reads the keycard: `In order to open the main door you need to provide the PIN code]"), nl,
    write("Walter: Damn it Jesse, we need to hack the computer to get the PIN code!"), nl,
    write("Jesse: Let's do it!"), nl,
    !.

hack(computer) :-
    current_level(5),
    has_keycard,
    \+ has_PIN_code,
    encrypted_password(Encrypted),
    decrypted_password(Decrypted),
    write("The encrypted password is: "), write(Encrypted), nl,
    write("Enter the decrypted password: "), nl,
    read_string(user_input, "\n", "", _, Guess),
    (Guess = Decrypted ->
        decrement_time_left(1),
        assert(has_PIN_code),
        write("Walter: We did it!"), nl,
        write("Jesse: Yeah, science!"), nl,
        write("[The computer displays the PIN code: 997420]"), nl,
        write("Walter: Let's go to the main door and get out of here!"), nl
    ;
        decrement_time_left(1),
        write("Walter: Wrong password!"), nl,
        write("Jesse: My friend Cesar can help us with that task!"), nl,
        write("Jesse: Just call him and tell him the encryption with your shift guess!"), nl
    ).