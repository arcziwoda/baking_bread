Level subclass: LevelFive [
    LevelFive >> init: aGame [
        game := aGame.
        Transcript show: ''; cr.
        ^self
    ]
    LevelFive >> processInput [
        Transcript show: 'This is not a valid command.'; cr.
        ^1
    ]
]