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
        Transcript show: 'Processing input in Level 2: ', action; cr.
        (action = 'choose_path') ifTrue: [
            
        ].
        (action = 'go_to') ifTrue: [
        ].
        ^1
    ]
]
