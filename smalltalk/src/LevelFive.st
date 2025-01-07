Level subclass: LevelFive [
    LevelFive >> init: aGame [
        game := aGame.
        Transcript show: 'Jesse: Yessss, it worked Mr. Black, we''re in!'; cr.
        ^self
    ]
    LevelFive >> processInput [
        (action = 'look_around') ifTrue: [
            Transcript show: 'Walter: Let''s find that keycard...'; cr.
            Transcript show: '[The office is small. There are shelves and desk with computer on it]'; cr.
            ^0
        ].
        (action = 'search' and: [arguments size >= 1]) ifTrue: [
            (game getKeycardFound) ifFalse: [
                (arguments first = 'shelves') ifTrue: [
                    Transcript show: 'Jesse: Nothing here, let''s keep looking'; cr.
                    ^1
                ].
                (arguments first = 'desk') ifTrue: [
                    Transcript show: 'Jesse: Here it is!'; cr.
                    Transcript show: 'Walter: Found it!'; cr.
                    Transcript show: 'Jesse: That''s the stuff, Mr. Black!'; cr.
                    Transcript show: '[Reads the keycard: In order to open the main door you need to provide the PIN code]'; cr.
                    Transcript show: 'Walter: Damn it Jesse, we need to hack the computer to get the PIN code!'; cr.
                    Transcript show: 'Jesse: Let''s do it!'; cr.
                    game setKeycardFound.
                    ^1
                ].
            ] ifTrue: [
                Transcript show: 'Jesse: We have the keycard, let''s hack this computer'; cr.
                ^1
            ].
        ].
        (action = 'hack' and: [arguments size >= 1 and: [arguments first = 'computer']]) ifTrue: [
            (game getKeycardFound and: [game getPinFound not]) ifTrue: [
                | encrypted decrypted guess |
                encrypted := 'ebiil'.
                decrypted := 'hello'.
                Transcript show: 'The encrypted password is: ', encrypted; cr.
                Transcript show: 'Enter the decrypted password: '; flush.
                guess := FileStream stdin nextLine.
                (guess = decrypted) ifTrue: [
                    Transcript show: 'Walter: We did it!'; cr.
                    Transcript show: 'Jesse: Yeah, science!'; cr.
                    Transcript show: '[The computer displays the PIN code: 997420]'; cr.
                    Transcript show: 'Walter: Let''s go to the main door and get out of here!'; cr.
                    game setPinFound.
                    ^1
                ] ifFalse: [
                    Transcript show: 'Walter: Wrong password!'; cr.
                    Transcript show: 'Jesse: My friend Cesar can help us with that task!'; cr.
                    Transcript show: 'Jesse: Just call him and tell him the encryption with your shift guess!'; cr.
                    ^1
                ].
            ].
        ].
        (action = 'go_to' and: [arguments size >= 1 and: [arguments first = 'main_door']]) ifTrue: [
            (game getPinFound) ifTrue: [
                Transcript show: 'Jesse: Finally Mr. Black, we are getting out of here!'; cr.
                Transcript show: 'Jesse: Quick, use the keycard and enter the PIN code!'; cr.
                game setByTheMainDoor.
                ^1
            ].
        ].
        (action = 'use' and: [arguments size >= 1 and: [arguments first = 'keycard']]) ifTrue: [
            (game getByTheMainDoor) ifTrue: [
                | pin |
                Transcript show: '[Walter swipes the keycard. The PIN prompt appears]'; cr.
                Transcript show: 'Enter the PIN code: '; flush.
                pin := FileStream stdin nextLine.
                (pin = '997420') ifTrue: [
                    Transcript show: 'SUCCESS'; cr.
                    game setCurrentLevel: (EndGame new).
                ] ifFalse: [
                    Transcript show: 'FAILURE! The PIN code is incorrect!'; cr.
                    Transcript show: 'Jesse: C''mon Mr. Black. Enter the PIN code we got from the computer, yo!'; cr.
                    ^1
                ].
            ].
        ].
        (action = 'talk_to' and: [arguments size >= 1 and: [arguments first = 'cesar']]) ifTrue: [
            self talkToCesar: game.
            ^1
        ].
        Transcript show: 'This is not a valid command.'; cr.
        ^1
    ]

    LevelFive >> talkToCesar: game [
        | encrypted shiftInput shift decrypted |
        Transcript show: 'Jesse: Let''s see if Cesar picks up...'; cr.
        Transcript show: 'Cesar: Hello?'; cr.
        Transcript show: 'Jesse: Yo Cesar, it''s Jesse, I don''t have time to explain, but can you help us decrypt a computer password?'; cr.
        Transcript show: 'Cesar: Um... sure, what''s the encrypted password?'; cr.
        Transcript show: 'Enter the encrypted password: '; flush.
        encrypted := FileStream stdin nextLine.
        Transcript show: 'Cesar: Alright, now I need you to tell me by how much to shift the letters.'; cr.
        Transcript show: 'Enter the shift value: '; flush.
        shiftInput := FileStream stdin nextLine.
        shift := shiftInput asInteger.
        decrypted := self caesarEncrypt: encrypted withShift: shift.
        Transcript show: 'Jesse: Eee... I don''t know, but maybe ', shift printString, '.'; cr.
        Transcript show: 'Cesar: ', encrypted, ' shifted by ', shift printString, ' is ', decrypted, '.'; cr.
        ^game
    ]

    LevelFive >> caesarEncrypt: str withShift: shift [
        ^str collect: [:char | self shiftChar: char withShift: shift]
    ]

    LevelFive >> shiftChar: char withShift: shift [
        | baseChar |
        (char isLowercase) ifTrue: [baseChar := $a].
        (char isUppercase) ifTrue: [baseChar := $A].
        (baseChar isNil) ifTrue: [^char].
        ^Character value: (((char asciiValue - baseChar asciiValue + shift) \\ 26) + baseChar asciiValue)
    ]
]
