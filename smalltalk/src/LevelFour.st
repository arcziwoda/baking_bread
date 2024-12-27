Level subclass: LevelFour [
    LevelFour >> init: aGame [
        game := aGame.
        Transcript show: ''; cr.
        ^self
    ]
    LevelFour >> processInput [
        Transcript show: 'This is not a valid command.'; cr.
        ^1
    ]
]
