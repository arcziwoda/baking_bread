% Define the encrypted message
encrypted_password("ebiil").
decrypted_password("hello").

% Caesar cipher encryption function
caesar_encrypt([], _, []).
caesar_encrypt([H|T], Shift, [E|ET]) :-
    char_code(H, Code),
    EncryptedCode is Code + Shift,
    char_code(E, EncryptedCode),
    caesar_encrypt(T, Shift, ET).

% Predicate to print the shifted string
talk_to(cesar) :-
    current_level(5),
    decrement_time_left(1),
    write("Jesse: Let's see if Cesar picks up..."), nl,
    write("Cesar: Hello?"), nl,
    write("Jesse: Yo Cesar, it's Jesse, I don't have time to explain, but can you help us decrypt a computer password?"), nl,
    write("Cesar: Um... sure, what's the encrypted password?"), nl,
    read_string(user_input, "\n", "", _, String),
    write("Jesse: The encrypted password is "), write(String), write("."), nl,
    write("Cesar: Alright, now I need you to tell me by how much to shift the letters."), nl,
    read_string(user_input, "\n", "", _, ShiftInput),
    atom_number(ShiftInput, Shift),
    write("Jesse: Eee... I don't know, but maybe "), write(Shift), write("."), nl,
    string_chars(String, Chars),
    caesar_encrypt(Chars, Shift, EncryptedChars),
    string_chars(EncryptedString, EncryptedChars),
    write("Cesar: "), write(String), write(" shifted by "), write(Shift), write(" is "), write(EncryptedString), write("."), nl.