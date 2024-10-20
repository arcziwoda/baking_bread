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
call_cesar(String, Shift) :-
    decrement_time_left(1),
    string_chars(String, Chars),
    caesar_encrypt(Chars, Shift, EncryptedChars),
    string_chars(EncryptedString, EncryptedChars),
    write("Cesar: "), write(String), write(" shifted by "), write(Shift), write(" characters is "), write(EncryptedString), nl.