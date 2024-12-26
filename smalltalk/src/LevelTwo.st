Level subclass: LevelTwo [
    LevelTwo >> init: aGame [
        game := aGame.
        Transcript show: 'Jesse: Yo, the door won''t open!'; cr.
        Transcript show: 'Walter: Damn it, it can only be unlocked by a key card. I think it''s locked in Sus'' office.'; cr.
        Transcript show: 'Jesse: And how do we get there?'; cr.
        Transcript show: 'Walter: We don''t have the key, but we could try to pick the lock.'; cr.
        Transcript show: 'Jesse: I ain''t no locksmith, we should use some Kvass to melt the lock.'; cr.
        Transcript show: 'Walter: We have to pick one of the options, we don''t have much time left!'; cr.
        ^self
    ]
    LevelTwo >> processInput [
        (action = 'choose_path' and: [(arguments size >= 1)]) ifTrue: [
            (arguments first = 'walter') ifTrue: [
                Transcript show: 'Walter: We should be able to make the lockpick out of some scraps left in the storage. Follow me.'; cr.
                game setCanMakeLockpick.
            ].
            (arguments first = 'jesse') ifTrue: [
                Transcript show: 'Jesse: Yo, Mr. Black, we gotta go back to the lab to make the Kvass, let''s go!'; cr.
                game setCanMakeKvass.
            ].
        ].
        (action = 'go_to' and: [(arguments size >= 1)]) ifTrue: [
            (arguments first = 'storage' and: [game getCanMakeLockpick.]) ifTrue: [
                game setCurrentLevel: (LevelFour new).
            ].
            (arguments first = 'lab' and: [game getCanMakeKvass.]) ifTrue: [
                game setCurrentLevel: (LevelThree new).
            ].
        ].
        ^1
    ]
]
