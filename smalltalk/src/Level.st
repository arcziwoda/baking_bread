Object subclass: Level [
    | game parts action arguments |
    Level >> init: aGame [
        self subclassResponsibility
    ]
    Level >> parseInput: input [
        (input includes: $ ) 
            ifTrue: [
                parts := input substrings: ' '.
                action := parts first.
                arguments := parts allButFirst.
            ] ifFalse: [
                action := input.
                arguments := #().
            ].
        (action = 'help') ifTrue: [
            game help.
            ^0
        ].
        (action = 'quit') ifTrue: [
            game setPlaying: false.
            ^0
        ].
        ^self processInput.
    ]
    Level >> processInput [
        self subclassResponsibility
    ]
]
