:- dynamic has_keycard/0.
:- dynamic has_PIN_code/0.
:- dynamic by_the_door/0.

look_around :-
    current_level(5),
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
    write("[Reads the keycard: In order to open the main door you need to provide the PIN code]"), nl,
    write("Walter: Damn it Jesse, we need to hack the computer to get the PIN code!"), nl,
    write("Jesse: Let's do it!"), nl,
    !.

hack(computer) :-
    current_level(5),
    has_keycard,
    \+ has_PIN_code,
    encrypted_password(Encrypted),
    decrypted_password(Decrypted),
    decrement_time_left(1),
    write("The encrypted password is: "), write(Encrypted), nl,
    write("Enter the decrypted password: "), nl,
    read_string(user_input, "\n", "", _, Guess),
    (Guess = Decrypted ->
        assert(has_PIN_code),
        write("Walter: We did it!"), nl,
        write("Jesse: Yeah, science!"), nl,
        write("[The computer displays the PIN code: 997420]"), nl,
        write("Walter: Let's go to the main door and get out of here!"), nl
    ;
        write("Walter: Wrong password!"), nl,
        write("Jesse: My friend Cesar can help us with that task!"), nl,
        write("Jesse: Just call him and tell him the encryption with your shift guess!"), nl
    ).

go_to(main_door) :-
    current_level(5),
    has_keycard,
    has_PIN_code,
    decrement_time_left(1),
    assert(by_the_door),
    write("Jesse: Finally Mr. Black, we are getting out of here!"), nl,
    write("Jesse: Quick, use the keycard and enter the PIN code!"), nl,
    !.

use(keycard) :-
    current_level(5),
    has_keycard,
    has_PIN_code,
    by_the_door,
    decrement_time_left(1),
    write("[Walter swipes the keycard. The PIN prompt appears]"), nl,
    write("Enter the PIN code: "), nl,
    read_string(user_input, "\n", "", _, PIN),
    (PIN = "997420" ->
        ending
    ;
        write("FAILURE! The PIN code is incorrect!"), nl,
        write("Jesse: C'mon Mr. Black. Enter the PIN code we got from the computer, yo!"), nl
    ).
