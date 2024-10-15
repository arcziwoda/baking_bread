:- dynamic current_level/1.

initialize_level(Level) :-
      retractall(current_level(_)),
      assert(current_level(Level)).
