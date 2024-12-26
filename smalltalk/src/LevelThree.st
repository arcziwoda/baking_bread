Object subclass: LevelThree [
    LevelThree >> init: aGame [
        game := aGame.
        Transcript show: 'Jesse: I think we have some leftover Kvass from the last batch of bread.'; cr.
        Transcript show: 'Watler: Yes, over there, but it''s pretty weak, it won''t dissolve the lock quickly.'; cr.
        Transcript show: 'Jesse: Aight, then maybe we could add something to make it stronger or go straight to the office door and use it.'; cr.
        ^self
    ]

    LevelThree >> processInput: action withArguments: arguments forGame: game [
        (action = 'look_around') ifTrue: [
            Transcript show: 'Walter: What do we have here that could be useful...'; cr.
            Transcript show: '[sees some whole grain bread, water, and some yeast]'; cr.
            ^1
        ].
        (action = 'go_to' and: [arguments size >= 1 and: [arguments first = 'office_door']]) ifTrue: [
            Transcript show: 'Walter: Ok, the Kvass is ready, now let''s take it to the office''s door.'; cr.
            Transcript show: 'Jesse: Yo, I remember there was a pepper spray in the lab. Maybe we should take it?'; cr.
            Transcript show: 'Walter: I don''t know Jesse, it will take some time to find it...'; cr.
            ^1
        ].
        (action = 'add') ifTrue: [
            (game byTheOfficeDoor) ifTrue: [
                (arguments size >= 2) ifTrue: [
                    (arguments first = 'kvass') ifTrue: [
                        | ingredient |
                        ingredient := arguments second.
                        (game addedWholeGrainBread and: [ingredient = 'whole_grain_bread']) ifTrue: [
                            Transcript show: 'Jesse: Yo! You already added whole grain bread! Stop wasting time!'; cr.
                            ^1
                        ].
                        (game addedYeast and: [ingredient = 'yeast']) ifTrue: [
                            Transcript show: 'Jesse: Yo! You already added yeast! Stop wasting time!'; cr.
                            ^1
                        ].
                        (game addedWater and: [ingredient = 'water']) ifTrue: [
                            Transcript show: 'Jesse: Yo! You already added water! Stop wasting time!'; cr.
                            ^1
                        ].
                        (ingredient = 'whole_grain_bread') ifTrue: [
                            Transcript show: 'Jesse: Do you want to add anything else or we good to go?'; cr.
                            game addedWholeGrainBread: true.
                            game kvassDisolveTime: (game kvassDisolveTime - 2).
                            ^1
                        ].
                        (ingredient = 'yeast') ifTrue: [
                            Transcript show: 'Jesse: Do you want to add anything else or we good to go?'; cr.
                            game addedYeast: true.
                            game kvassDisolveTime: (game kvassDisolveTime - 1).
                            ^1
                        ].
                        (ingredient = 'water') ifTrue: [
                            Transcript show: 'Jesse: Do you want to add anything else or we good to go?'; cr.
                            game addedWater: true.
                            game kvassDisolveTime: (game kvassDisolveTime + 1).
                            ^1
                        ].
                        Transcript show: 'Jesse: Come on! We''re not adding this to the kvass!'; cr.
                        Transcript show: 'Walter: Sorry! I got distracted!'; cr.
                        ^1
                    ].
                    Transcript show: 'Jesse: Come on! We''re adding ingredients to the kvass, not that!'; cr.
                    Transcript show: 'Walter: Sorry! I got distracted!'; cr.
                    ^1
                ] ifFalse: [
                    Transcript show: 'Walter: We need to add an ingredient to the Kvass!'; cr.
                    ^1
                ].
            ] ifFalse: [
                Transcript show: 'Walter: We need to be by the office door to add ingredients to the Kvass!'; cr.
                ^1
            ].
        ].
        (action = 'take' and: [arguments size >= 1 and: [arguments first = 'pepper_spray']]) ifTrue: [
            (game lockPicked not) ifTrue: [
                Transcript show: 'Jesse: Yo Mr. Black, there''s still some left in the can, this might come in handy later...'; cr.
                Transcript show: 'Walter: Great, now let''s use the Kvass, we don''t have time, remember?'; cr.
                game pepperSpray: true.
            ].
            ^1
        ].
        (action = 'use' and: [arguments size >= 1 and: [arguments first = 'kvass']]) ifTrue: [
            (game byTheOfficeDoor) ifTrue: [
                Transcript show: 'Jesse: Aight, now let''s pour this bad boy on the lock!'; cr.
                Transcript show: 'Walter: Here goes nothing...'; cr.
                (game kvassDisolveTime = 1) ifTrue: [
                    Transcript show: 'It took 1 minute to dissolve the lock'; cr.
                ] ifFalse: [
                    Transcript show: 'It took ', game kvassDisolveTime printString, ' minutes to dissolve the lock'; cr.
                ].
                Transcript show: '[Office door slowly opens]'; cr.
                game lockPicked: true.
            ].
            ^1
        ].
        (action = 'go_to' and: [arguments size >= 1 and: [arguments first = 'office']]) ifTrue: [
            (game currentLevel = 3 and: [game lockPicked]) ifTrue: [
                game setCurrentLevel: (LevelFive new).
            ].
            ^1
        ].
        Transcript show: 'This is not a valid command.'; cr.
        ^1
    ]
]