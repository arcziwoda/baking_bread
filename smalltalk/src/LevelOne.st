Level subclass: LevelOne [
    LevelOne >> init: aGame [
        game := aGame.
        Transcript show: 'Walter: Yo, Jesse, you there?'; cr.
        Transcript show: 'Jesse: Yeah, Mr. Black, what''s up?'; cr.
        Transcript show: 'Walter: It''s been a rough day, huh?'; cr.
        Transcript show: 'Jesse: You bet. These blue muffins are no joke.'; cr.
        Transcript show: 'Walter: We need to finish them up.'; cr.
        ^self
    ]
    LevelOne >> processInput [
        (action = 'look_around') ifTrue: [
            Transcript show: 'Walter: Let''s see what''s on the table...'; cr.
            Transcript show: '[sees sugar, blue food coloring, baking soda and los pollos hermanos sauce]'; cr.
            ^0
        ].
        (action = 'add') ifTrue: [
            (arguments size >= 2) ifTrue: [
                (arguments first = 'muffins') ifTrue: [
                    (game getMuffinsDone) ifTrue: [
                        Transcript show: 'Jesse: Yo, the muffins are done!!! Answer that phone!'; cr.
                    ] ifFalse: [
                        (arguments second = 'blue_food_coloring') ifTrue: [
                            Transcript show: 'Walter: That''s it! The final ingredient for the muffins is blue_food_coloring!'; cr.
                            Transcript show: 'Jesse: Yo, Mr. Black! These muffins are gonna be tight!'; cr.
                            Transcript show: 'Walter: Yes, Jesse. Now let''s finish these muffins and move on.'; cr.
                            Transcript show: '[The phone rings]'; cr.
                            Transcript show: 'Jesse: Yo, Mr. Black! It''s Saul! Better pick that up!'; cr.
                            game setBakersAreComing.
                            game setMuffinsDone.
                            ^0
                        ].
                        (arguments second = 'los_pollos_hermanos_sauce') ifTrue: [
                            Transcript show: 'Walter: Damn it! The oven overheated! The alarms are going off!'; cr.
                            Transcript show: 'Jesse: The sanepid will come soon, they will know about the secret bakery!'; cr.
                            Transcript show: '[The phone rings]'; cr.
                            Transcript show: 'Jesse: Yo, Mr. Black! It''s Saul! Better pick that up!'; cr.
                            game setSanepidIsComing.
                            game setMuffinsDone.
                            ^0
                        ].
                        Transcript show: 'Walter: No, that''s not right. We need to add the correct ingredient to the muffins.'; cr.
                        Transcript show: 'Jesse: Come on, think! What was it again?'; cr.
                    ].
                ] ifFalse: [
                    Transcript show: 'Walter: We are not adding ingredients to that! Focus on the muffins!'; cr.
                ].
            ] ifFalse: [
                Transcript show: 'Walter: We need to add an ingredient to the muffins!'; cr.
            ].
            ^0
        ].
        (action = 'talk_to' and: [arguments size >= 1 and: [arguments first = 'jesse']]) ifTrue: [
            Transcript show: 'Jesse: Man, I never thought baking could be this intense.'; cr.
            Transcript show: 'Walter: It''s all about precision, Jesse. One wrong move and it''s all over.'; cr.
            Transcript show: 'Jesse: Yeah, yeah, I get it. But these muffins... they''re something else.'; cr.
            Transcript show: 'Walter: They have to be perfect. Our reputation depends on it.'; cr.
            Transcript show: 'Jesse: Yo, Mr. Black, what''s the final ingredient for the cake?'; cr.
            Transcript show: 'Jesse: I totally forgot, man. Maybe you should look around to see what''s on the table.'; cr.
            ^0
        ].
        (action = 'talk_to' and: [arguments size >= 1 and: [arguments first = 'saul' and: [game getMuffinsDone]]]) ifTrue: [
            (game getBakersAreComing) ifTrue: [
                Transcript show: 'Saul Badman: Hey, Walter! It''s Saul. Listen, the rival bakers are on their way. You gotta get outta there, man!'; cr.
                Transcript show: 'Walter: Damn it, Saul! How much time do we have?'; cr.
                Transcript show: 'Saul Badman: Not much, maybe a few minutes. You need to move!'; cr.
                Transcript show: 'Jesse: Yo, Mr. Black, this is bad. What do we do?'; cr.
                Transcript show: 'Walter: We need to get to the main door, Jesse. Now!'; cr.
                Transcript show: 'Jesse: Alright, let''s go!'; cr.
                game setTimeLeft: 25.
                game setCanUseMainDoor.
            ].
            (game getSanepidIsComing) ifTrue: [
                Transcript show: 'Saul Badman: Hey, genius! What did you do? The sanepid is coming! You better run!'; cr.
                Transcript show: 'Walter: Damn it, Saul. How much time do we have?'; cr.
                Transcript show: 'Saul Badman: Not much, Walter. You need to get out of there, fast!'; cr.
                Transcript show: 'Jesse: Mr. Black, we gotta move! What now?'; cr.
                Transcript show: 'Walter: Head to the main door, Jesse. We don''t have much time!'; cr.
                Transcript show: 'Jesse: Got it, let''s get outta here!'; cr.
                game setTimeLeft: 20.
                game setCanUseMainDoor.
            ].
            ^0
        ].
        (action = 'go_to' and: [arguments size >= 1 and: [arguments first = 'main_door' and: [game getCanUseMainDoor]]]) ifTrue: [
            game setCurrentLevel: (LevelTwo new).
            ^1
        ].
        Transcript show: 'This is not a valid command.'; cr.
        ^1
    ]

]