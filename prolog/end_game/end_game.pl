:- dynamic time_left/1.
:- dynamic sanepid_is_coming/0.
:- dynamic bakers_are_coming/0.
:- dynamic pepper_spray/0.

ending :-
    write("[The main door opens]"), nl,
    time_left(TimeLeft),
    (TimeLeft >= 10 ->
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
            write("Walter: We should have taken this pepper spray!"), nl,
            write("Hank Schrader: You're under arrest!"), nl,
            write("[Hank arrests Walter and Jesse]"), nl,
            player_lost
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
            write("Walter: We should have taken this pepper spray!"), nl,
            write("Jack Welker: You're dead meat!"), nl,
            write("[Jack shoots Walter and Jesse]"), nl,
            player_lost
        )
    ),
    !.

player_won :-
    write("[Walter and Jesse exit the lab]"), nl,
    write("Jesse: Yesssss! Hell yeah! Ey c'mon baby. C'mon yes!"), nl,
    write("[Jesse awaits Walter to give him a high five]"), nl,
    write("[Walter gives jesse high five]"), nl,
    write("Walter: Ahhhhh!"), nl,
    write("Jesse: Ahhhhh!"), nl,
    write("Jesse: Du'uh!"), nl,
    write("Walter: Let's get out of here!"), nl,
    write("=============================================="), nl,
    write("                  YOU WON                     "), nl,
    write("=============================================="), nl,
    halt.

player_lost :-
    write("=============================================="), nl,
    write("                  YOU LOST                    "), nl,
    write("=============================================="), nl,
    halt.
