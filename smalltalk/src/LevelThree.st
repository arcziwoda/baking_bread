Level subclass: LevelThree [
    LevelThree >> init: aGame [
        game := aGame.
        Transcript show: 'Jesse: I think we have some leftover Kvass from the last batch of bread.'; cr.
        Transcript show: 'Watler: Yes, over there, but it''s pretty weak, it won''t dissolve the lock quickly.'; cr.
        Transcript show: 'Jesse: Aight, then maybe we could add something to make it stronger or go straight to the office door and use it.'; cr.
        ^self
    ]
    LevelThree >> processInput [
        ^1
    ]
]
