:- dynamic time_left/1.
:- dynamic sanepid_is_coming/0.
:- dynamic bakers_are_coming/0.
:- dynamic pepper_spray/0.

ending :-
    write("[The main door opens]"), nl,
    time_left(TimeLeft),
    (TimeLeft > 10 ->
        player_won
    ;
        check_player_won
    ),
    !.

check_player_won :-
    (sanepid_is_coming ->
        write("[Walter and Jesse didn't escape in time and the sanepid inspector made it to the lab]"), nl,
        write("Hank Schrader: Sanepid inspection! Get out of there now!"), nl,
        (pepper_spray ->
            write("Walter: Quick, Jesse! Use the pepper spray!"), nl,
            write("Jesse: Take this, Hank!"), nl,
            write("[Hank is knocked out by the pepper spray]"), nl,
            write("Walter: We did it, Jesse! We escaped just in time!"), nl,
            player_won
        ;
            write("Walter: We don't have any pepper spray! We're done for!"), nl,
            write("Hank Schrader: You're under arrest!"), nl,
            write("Game over!"), nl
        )
    ;
    bakers_are_coming ->
        write("[Walter and Jesse didn't escape in time and the bakers made it to the lab]"), nl,
        write("Jack Welker: We got you now!"), nl,
        (pepper_spray ->
            write("Walter: Quick, Jesse! Use the pepper spray!"), nl,
            write("Jesse: Take this, Jack!"), nl, 
            write("[Jack is knocked out by the pepper spray]"), nl,
            write("Walter: We did it, Jesse! We escaped just in time!"), nl, 
            player_won
        ;
            write("Walter: We don't have any pepper spray! We're done for!"), nl,
            write("Jack Welker: You're dead meat!"), nl,
            write("Game over!"), nl
        )
    ),
    !.

player_won :-
    write("Jesse: Yesssss! Hell yeah! Ey c'mon baby. C'mon yes!"), nl,
    write("[Jesse awaits Walter to give him a high five]"), nl,
    write("[Walter gives jesse high five]"), nl,
    write("Walter: Ahhhhh!"), nl,
    write("Jesse: Ahhhhh!"), nl,
    (sanepid_is_coming ->
        write("Walter: The best part is this stupid sanpid inspector didn't make it!"), nl
    ;
    bakers_are_coming ->
        write("Walter: The best part is these stupid bakers didn't make it!"), nl
    ),
    write("Jesse: Du'uh!"), nl,
    write("Walter: Let's get out of here!"), nl,
    write("=============================================="), nl,
    write("                  YOU WON                     "), nl,
    write("=============================================="), nl,
    % halt.
    !.