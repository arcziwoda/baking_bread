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
        Transcript show: 'Action: ', action; cr.
        Transcript show: 'Arguments: ', (arguments isEmpty 
        ifTrue: ['None'] 
        ifFalse: [arguments inject: '' into: [:acc :each | acc , ' ', each] ]); cr.
        (action = 'help') ifTrue: [
            game help.
            ^0
        ] ifFalse: [
            ^self processInput.
        ].
    ]
    Level >> processInput [
        self subclassResponsibility
    ]
]
