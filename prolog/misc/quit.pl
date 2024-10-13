% quit_logic.pl
quit :-
    write('Are you sure you want to quit? (yes/no): '),
    flush_output,
    read(Response),
    handle_quit_response(Response).

handle_quit_response(yes) :-
    write('Goodbye!'), nl,
    halt.

handle_quit_response(no) :-
    write('Continuing the game...'), nl.

handle_quit_response(_) :-
    write('Invalid response. Please type "yes" or "no".'), nl,
    quit.