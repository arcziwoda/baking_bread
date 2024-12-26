Object subclass: GameState [
    | currentLevel timeLeft running countTime bakersAreComing sanepidIsComing muffinsDone canUseMainDoor |

    GameState class >> new [
        ^super new initialize.
    ]

    GameState >> initialize [
        currentLevel := 0.
        timeLeft := 1000.
        running := true.
        countTime := false.
        bakersAreComing := false.
        sanepidIsComing := false.
        muffinsDone := false.
        canUseMainDoor := false.
    ]

    GameState >> currentLevel [
        ^currentLevel
    ]

    GameState >> currentLevel: aLevel [
        currentLevel := aLevel.
    ]

    GameState >> timeLeft [
        ^timeLeft
    ]

    GameState >> timeLeft: aTime [
        timeLeft := aTime.
    ]

    GameState >> running [
        ^running
    ]

    GameState >> running: aFlag [
        running := aFlag.
    ]

    GameState >> countTime [
        ^countTime
    ]

    GameState >> countTime: aFlag [
        countTime := aFlag.
    ]

    GameState >> bakersAreComing [
        ^bakersAreComing
    ]

    GameState >> bakersAreComing: aFlag [
        bakersAreComing := aFlag.
    ]

    GameState >> sanepidIsComing [
        ^sanepidIsComing
    ]

    GameState >> sanepidIsComing: aFlag [
        sanepidIsComing := aFlag.
    ]

    GameState >> muffinsDone [
        ^muffinsDone
    ]

    GameState >> muffinsDone: aFlag [
        muffinsDone := aFlag.
    ]

    GameState >> canUseMainDoor [
        ^canUseMainDoor
    ]

    GameState >> canUseMainDoor: aFlag [
        canUseMainDoor := aFlag.
    ]
]