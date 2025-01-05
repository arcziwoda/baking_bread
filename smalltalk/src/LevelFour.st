Level subclass: LevelFour [
    LevelFour >> init: aGame [
        game := aGame.
        Transcript show: 'Jesse: We need to find tools for making a lockpick!'; cr.
        Transcript show: 'Walter: Or we could try to find a crowbar somewhere.'; cr.
        ^self
    ]
    LevelFour >> processInput [
        (action = 'look_around' and: [game getPickCreated not]) ifTrue: [
            Transcript show: 'Walter: Let''s see what we can find here...'; cr.
            Transcript show: '[sees some metal wires, a screwdriver, a hammer, and a wrench]'; cr.
            Transcript show: 'Walter: These tools could help us make a lockpick. I belive it is made from two things.'; cr.
            Transcript show: '[sees a hatch, a tool cabinet, a metal barrel, and a dumpster]'; cr.
            Transcript show: 'Walter: We could search these places for the crowbar.'; cr.
            ^1
        ].
        (action = 'search' and: [arguments size >= 1]) ifTrue: [
            (game getCrowbarFound) ifFalse: [
                (arguments first = 'metal_barrel') ifFalse: [
                    Transcript show: 'Walter: No luck here. Let''s keep searching.'; cr.
                    ^1
                ] ifTrue: [
                    Transcript show: 'Jesse: Yo, Mr. Black! We found a crowbar!'; cr.
                    game setCrowbarFound.
                    ^1
                ].
            ] ifTrue: [
                Transcript show: 'Jesse: We have the crowbar, let''s just go!'; cr.
                ^1
            ].
        ].
        (action = 'create_pick' and: [arguments size = 2]) ifTrue: [
            ((arguments includes: 'metal_wires') and: [arguments includes: 'hammer']) ifTrue: [
                Transcript show: 'Walter: Perfect! Now we can try to use the lockpick.'; cr.
                game setPickCreated.
                ^1
            ] ifFalse: [
                Transcript show: 'Walter: Damn, that didn''t work. We''re wasting time!'; cr.
                ^1
            ]
        ]. 
        (action = 'go_to' and: [arguments size >= 1]) ifTrue: [
            (arguments first = 'office_door') ifTrue: [
                ((game getCrowbarFound or: [game getPickCreated]) and: [game getLockPicked not]) ifTrue: [
                    Transcript show: 'Walter: Now we can try to open the door.'; cr.
                    Transcript show: 'Jesse: Do you know how to do it?'; cr.
                    Transcript show: 'Walter: We just have to try and hope for the best...'; cr.
                    game setByTheOfficeDoor.
                    ^1
                ] ifFalse: [
                    Transcript show: 'Walter: We can''t go there yet. Let''s check what we''re missing.'; cr.
                    ^1
                ]
            ].
        ].
        (action = 'go_to' and: [arguments size >= 1 and: [arguments first = 'office']]) ifTrue: [
            (game getLockPicked) ifTrue: [
                Transcript show: 'Walter: Alright, the office door is open. Let''s move on!'; cr.
                Transcript show: 'Jesse: Let''s go, man!'; cr.
                game setCurrentLevel: (LevelFive new).
                ^1
            ] ifFalse: [
                Transcript show: 'Walter: The office door is still locked. We need to figure this out first.'; cr.
                ^1
            ].
        ].
        (action = 'use' and: [arguments size = 1 and: [arguments first = 'lockpick']]) ifTrue: [
            (game getPickCreated and: [game getLockPicked not and: [game getByTheOfficeDoor]]) ifTrue: [
                self startLockpickingMinigame.
                ^1
            ] ifFalse: [
                Transcript show: 'Walter: We can''t use the lockpick right now.'; cr.
                ^1
            ].
        ].
        (action = 'use' and: [arguments size = 1 and: [arguments first = 'crowbar']]) ifTrue: [
            (game getLockPicked not and: [game getByTheOfficeDoor]) ifTrue: [
                Transcript show: 'Walter: Let''s use the crowbar to force the door open.'; cr.
                Transcript show: '[The door opens with a loud noise]'; cr.
                Transcript show: 'Jesse: Yes b****! Let''s go through them man!'; cr.
                game setLockPicked.
                ^1
            ] ifFalse: [
                Transcript show: 'Walter: We can''t use the crowbar right now.'; cr.
                ^1
            ].
        ].
        Transcript show: 'This is not a valid command.'; cr.
        ^1
    ]

    LevelFour >> startLockpickingMinigame [
        | sequence progress input |
        sequence := #('up' 'right' 'down').
        progress := OrderedCollection new.
        Transcript show: 'Walter: Alright, let''s try to pick the lock.'; cr.
        Transcript show: 'Walter: We need to move the pick carefully: up, right, down.'; cr.
        Transcript show: 'Walter: If we make a mistake, we''ll have to start over.'; cr.

        [progress size < sequence size] whileTrue: [
            Transcript show: 'Enter a direction (up, right, down): '; cr.
            input := FileStream stdin nextLine.
            (input = nil or: [input isEmpty]) ifTrue: [^Transcript show: 'Walter: You gave up on picking the lock.'; cr.].

            (input = (sequence at: (progress size + 1))) ifTrue: [
                progress add: input.
                Transcript show: 'Walter: Keep going, the lock is almost there!'; cr.
            ] ifFalse: [
                Transcript show: 'Walter: Damn, that was the wrong move. We lost some time!'; cr.
                progress := OrderedCollection new. 
            ].
        ].

        Transcript show: 'Walter: We did it! The lock is open!'; cr.
        Transcript show: '[The office door slowly opens]'; cr.
        game setLockPicked.
    ]
]
