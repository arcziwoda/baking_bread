Object subclass: Game [
    | currentLevel timeLeft playing bakersAreComing sanepidIsComing muffinsDone 
      canUseMainDoor canMakeKvass canMakeLockpick kvassDisolveTime addedWholeGrainBread 
      addedYeast addedWater pickCreated lockPicked crowbarFound byTheOfficeDoor 
      keycardFound pinFound byTheMainDoor pepperSpray |

    Game class >> new [
        ^super new init
    ]

    Game >> init [
        currentLevel := nil.
        timeLeft := 10000.
        playing := false.
        bakersAreComing := false.
        sanepidIsComing := false.
        muffinsDone := false.
        canUseMainDoor := false.
        canMakeKvass := false.
        canMakeLockpick := false.
        kvassDisolveTime := 3.
        addedWholeGrainBread := false.
        addedYeast := false.
        addedWater := false.
        pickCreated := false.
        lockPicked := false.
        crowbarFound := false.
        byTheOfficeDoor := false.
        keycardFound := false.
        pinFound := false.
        byTheMainDoor := false.
        pepperSpray := false.

        self introduction.
        [playing] whileFalse: [
            self processInput: (self getUserInput).
        ].
        self start.
    ]

    Game >> introduction [
        Transcript show: '### Introduction ###'; cr.
        Transcript show: '---------------------------------------------'; cr.
        Transcript show: 'Welcome to Baking B(re)ad: The Lab Escape!'; cr.
        Transcript show: 'You are Walter Black, a brilliant baker working in Sus'' bakery.'; cr.
        Transcript show: 'You work in a secret lab under the laundromat.'; cr.
        Transcript show: 'You are famous for your signature blue muffins, which rival bakers envy.'; cr.
        Transcript show: 'Your partner, known as Jesse Yellowman, is with you.'; cr.
        Transcript show: 'He is not as smart as you, but he is loyal and can help you.'; cr.
        Transcript show: 'If you type "help" Jesse will remind you of the possible commands.'; cr.
        Transcript show: 'After a botched deal, your situation has become dire.'; cr.
        Transcript show: 'You feel like one mistake could be your last.'; cr.
        Transcript show: 'After a long day of work it is time to add the last ingredient to your product.'; cr.
        Transcript show: 'Good luck!'; cr.
        Transcript show: '---------------------------------------------'; cr.
        Transcript show: 'Type "help" to see the game rules.'; cr.
        Transcript show: 'Type "start" to begin the game.'; cr.
    ]

    Game >> help [
        Transcript show: '### Game rules ###'; cr.
        Transcript show: '1. talk_to [name?] - Talk to someone.'; cr.
        Transcript show: '2. look_around - Look around.'; cr.
        Transcript show: '3. add [where?] [what?] - Add something to something.'; cr.
        Transcript show: '4. use [what?]  - Use something.'; cr.
        Transcript show: '5. go_to [where?] - Go to a place.'; cr.
        Transcript show: '6. choose_path [name?] - Choose a path.'; cr.
        Transcript show: '7. search [what?] - Search for something.'; cr.
        Transcript show: '8. hack [what?] - Hack something.'; cr.
        Transcript show: '9. create_pick [first tool] [second tool] - Create a lockpick.'; cr.
        Transcript show: 'Type "help" to see this message again.'; cr.
    ]

    Game >> start [
        self initializeLevels.
        [playing] whileTrue: [
            (canUseMainDoor) ifTrue: [
                Transcript show: 'Time left ', timeLeft asString; cr.
            ].
            self decTimeLeft: (currentLevel parseInput: (self getUserInput)).
        ].
        self setCurrentLevel: (EndGame new).
    ]

    Game >> initializeLevels [
        currentLevel := LevelOne new.
        currentLevel init: self.
    ]

    Game >> setCurrentLevel: aLevel [
        currentLevel := aLevel.
        currentLevel init: self.
    ]

    Game >> setSanepidIsComing [
        sanepidIsComing := true.
    ]

    Game >> setBakersAreComing [
        bakersAreComing := true.
    ]

    Game >> setMuffinsDone [
        muffinsDone := true.
    ]

    Game >> setCanUseMainDoor [
        canUseMainDoor := true.
    ]

    Game >> setCanMakeLockpick [
        canMakeLockpick := true.
    ]

    Game >> setCanMakeKvass [
        canMakeKvass := true.
    ]

    Game >> decTimeLeft: aValue [
        timeLeft := timeLeft - aValue.
        (timeLeft <= 0) ifTrue: [
            timeLeft := 0.
            playing := false.
        ].
    ]

    Game >> setPlaying: aValue [
        playing := aValue.
    ]

    Game >> setTimeLeft: aValue [
        timeLeft := aValue.
    ]

    Game >> decrementKvassDisolveTime: aValue [
        kvassDisolveTime := kvassDisolveTime - aValue.
    ]

    Game >> setByTheOfficeDoor [
        byTheOfficeDoor := true.
    ]

    Game >> setAddedWholeGrainBread [
        addedWholeGrainBread := true.
    ]

    Game >> setAddedYeast [
        addedYeast := true.
    ]

    Game >> setAddedWater [
        addedWater := true.
    ]

    Game >> setPepperSprayTaken [
        pepperSpray := true.
    ]

    Game >> setLockPicked [
        lockPicked := true.
    ]

    Game >> setKeycardFound [
        keycardFound := true.
    ]

    Game >> setPinFound [
        pinFound := true.
    ]

    Game >> setByTheMainDoor [
        byTheMainDoor := true.
    ]

    Game >> getUserInput [
        Transcript show: 'Enter command: '.
        ^(FileStream stdin nextLine)
    ]

    Game >> getTimeLeft [
        ^timeLeft.
    ]

    Game >> getMuffinsDone [
        ^muffinsDone.
    ]

    Game >> getBakersAreComing [
        ^bakersAreComing.
    ]

    Game >> getSanepidIsComing [
        ^sanepidIsComing.
    ]

    Game >> getCanUseMainDoor [
        ^canUseMainDoor.
    ]

    Game >> getCanMakeKvass [
        ^canMakeKvass.
    ]

    Game >> getCanMakeLockpick [
        ^canMakeLockpick.
    ]

    Game >> isByTheOfficeDoor [
        ^byTheOfficeDoor.
    ]

    Game >> getAddedWholeGrainBread [
        ^addedWholeGrainBread.
    ]

    Game >> getAddedYeast [
        ^addedYeast.
    ]

    Game >> getAddedWater [
        ^addedWater.
    ]

    Game >> getLockPicked [
        ^lockPicked.
    ]

    Game >> getKvassDisolveTime [
        ^kvassDisolveTime.
    ]

    Game >> getKeycardFound [
        ^keycardFound.
    ]

    Game >> getPinFound [
        ^pinFound.
    ]

    Game >> getByTheMainDoor [
        ^byTheMainDoor.
    ]

    Game >> getPepperSpray [
        ^pepperSpray.
    ]

    Game >> getCrowbarFound [
        ^crowbarFound.
    ]

    Game >> processInput: input [
        (input = 'start') ifTrue: [
            playing := true.
        ].
        (input = 'help') ifTrue: [
            self help.
        ]
    ]

]

