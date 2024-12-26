Object subclass: Game [
    | gameState helpInstance levelOneInstance |

    Game class >> new [
        ^super new initialize.
    ]

    Game >> initialize [
        gameState := GameState new.
        helpInstance := Help new.
        levelOneInstance := LevelOne new.
    ]

    Game >> start [
        'Welcome to Baking B(re)ad: The Lab Escape!' displayNl.
        helpInstance printIntroduction.
        'Type "help" to see the possible commands.' displayNl.
        self gameLoop.
    ]

    Game >> gameLoop [
        | input |
        [gameState running] whileTrue: [
            input := self getUserInput.
            gameState := self processCommand: input withState: gameState.
            gameState countTime ifTrue: [
                gameState := self decrementTime: gameState.
                self printTimeLeft: gameState.
            ].
        ].
        'Game over!' displayNl.
    ]

    Game >> getUserInput [
        '>: ' display.
        ^FileStream stdin nextLine
    ]

    Game >> processCommand: input withState: state [
        | newState ingredient target |
        newState := state copy.
        input = 'quit' ifTrue: [newState running: false].
        input = 'help' ifTrue: [Help new printHelp].
        (input = 'start' and: [state currentLevel = 0]) ifTrue: [
            newState := levelOneInstance startLevelOne: state.
            newState currentLevel: 1.
        ].
        (state currentLevel = 1) ifTrue: [
            input = 'look_around' ifTrue: [newState := levelOneInstance lookAround: state].
            (input startsWith: 'talk_to') ifTrue: [
                target := input copyFrom: 9.
                target = 'Jesse' ifTrue: [newState := levelOneInstance talkToJesse: state].
                target = 'Saul' ifTrue: [newState := levelOneInstance talkToSaul: state].
            ].
            (input startsWith: 'go_to') ifTrue: [
                target := input copyFrom: 7.
                target = 'main_door' ifTrue: [newState := levelOneInstance goToMainDoor: state].
            ].
            (input startsWith: 'add') ifTrue: [
                ingredient := input copyFrom: 5.
                newState := levelOneInstance addIngredient: ingredient toState: state.
            ].
        ].
        ^newState.
    ]    

    Game >> printTimeLeft: state [
        'Time left: ' display.
        state timeLeft displayNl.
    ]

    Game >> decrementTime: state [
        | newState |
        newState := state copy.
        newState timeLeft: (state timeLeft - 1).
        (newState timeLeft <= 0) ifTrue: [newState running: false].
        ^newState.
    ]
]

"Run the game"
| gameInstance |
gameInstance := Game new.
gameInstance start.