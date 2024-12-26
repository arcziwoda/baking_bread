Level subclass: LevelFive [
    LevelFive >> init: aGame [
        game := aGame.
        Transcript show: ''; cr.
        ^self
    ]
    LevelFive >> processInput [
        ^1
    ]
]