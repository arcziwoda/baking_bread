Level subclass: LevelFour [
    LevelFour >> init: aGame [
        game := aGame.
        Transcript show: ''; cr.
        ^self
    ]
    LevelFour >> processInput [
        ^1
    ]
]
