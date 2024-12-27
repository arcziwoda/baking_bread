Level subclass: EndGame [
    EndGame >> init: aGame [
        game := aGame.
        (game getTimeLeft >= 10) ifTrue: [
            self playerWon.
        ] ifFalse: [
            self checkPlayerWon.
        ].
        (game getTimeLeft <= 0) ifTrue: [
            self noMoreTimeLeftEnding.
        ].
        ^self
    ]

    EndGame >> checkPlayerWon [
        (game getSanepidIsComing) ifTrue: [
            Transcript show: '[Walter and Jesse didn''t escape in time and the sanepid inspector made it to the lab]'; cr.
            Transcript show: 'Hank Schrader: Sanepid inspection! Get out of there now!'; cr.
            (game getPepperSpray) ifTrue: [
                Transcript show: 'Walter: Quick, Jesse! Use the pepper spray!'; cr.
                Transcript show: 'Jesse: Take this, Hank!'; cr.
                Transcript show: '[Hank is knocked out by the pepper spray]'; cr.
                Transcript show: 'Walter: We did it, Jesse! We escaped just in time!'; cr.
                self playerWon.
                ^self
            ].
            (game getCrowbarFound) ifTrue: [
                Transcript show: 'Walter: Quick, Jesse! Use the crowbar to block the door!'; cr.
                Transcript show: 'Jesse: Done! That should hold them off!'; cr.
                Transcript show: '[Walter and Jesse block the door and escape just in time!]'; cr.
                self playerWon.
                ^self
            ].
            Transcript show: 'Walter: We should have taken something to defend ourselves!'; cr.
            Transcript show: 'Hank Schrader: You''re under arrest!'; cr.
            Transcript show: '[Hank arrests Walter and Jesse]'; cr.
            self playerLost.
            ^self
        ].
        (game getBakersAreComing) ifTrue: [
            Transcript show: '[Walter and Jesse didn''t escape in time and the bakers made it to the lab]'; cr.
            Transcript show: 'Jack Welker: We got you now!'; cr.
            (game getPepperSpray) ifTrue: [
                Transcript show: 'Walter: Quick, Jesse! Use the pepper spray!'; cr.
                Transcript show: 'Jesse: Take this, Jack!'; cr.
                Transcript show: '[Jack is knocked out by the pepper spray]'; cr.
                Transcript show: 'Walter: We did it, Jesse! We escaped just in time!'; cr.
                self playerWon.
                ^self
            ].
            (game getCrowbarFound) ifTrue: [
                Transcript show: 'Walter: Jesse! Block the door with the crowbar, now!'; cr.
                Transcript show: 'Jesse: Got it! That''ll keep them out for a while.'; cr.
                Transcript show: '[Walter and Jesse block the door and make their escape!]'; cr.
                self playerWon.
                ^self
            ].
            Transcript show: 'Walter: We should have taken something to defend ourselves!'; cr.
            Transcript show: 'Jack Welker: You''re dead meat!'; cr.
            Transcript show: '[Jack shoots Walter and Jesse]'; cr.
            self playerLost.
            ^self
        ].
        self playerLost.
    ]

    EndGame >> noMoreTimeLeftEnding [
        (game getBakersAreComing) ifTrue: [
            Transcript show: '[Walter and Jesse didn''t escape in time and the bakers made it to the lab]'; cr.
            Transcript show: 'Jack Welker: We got you now!'; cr.
            Transcript show: 'Walter: We should have taken something to defend ourselves!'; cr.
            Transcript show: 'Jack Welker: You''re dead meat!'; cr.
            Transcript show: '[Jack shoots Walter and Jesse]'; cr.
            self playerLost.
            ^self
        ].
        (game getSanepidIsComing) ifTrue: [
            Transcript show: '[Walter and Jesse didn''t escape in time and the sanepid inspector made it to the lab]'; cr.
            Transcript show: 'Hank Schrader: Sanepid inspection! Get out of there now!'; cr.
            Transcript show: 'Walter: We should have taken something to defend ourselves!'; cr.
            Transcript show: 'Hank Schrader: You''re under arrest!'; cr.
            Transcript show: '[Hank arrests Walter and Jesse]'; cr.
            self playerLost.
            ^self
        ].
        self playerLost.
        ^self
    ]

    EndGame >> playerWon [
        Transcript show: '[Walter and Jesse exit the lab]'; cr.
        Transcript show: 'Jesse: Yesssss! Hell yeah! Ey c''mon baby. C''mon yes!'; cr.
        Transcript show: '[Jesse awaits Walter to give him a high five]'; cr.
        Transcript show: '[Walter gives Jesse high five]'; cr.
        Transcript show: 'Walter: Ahhhhh!'; cr.
        Transcript show: 'Jesse: Ahhhhh!'; cr.
        Transcript show: 'Jesse: Du''uh!'; cr.
        Transcript show: 'Walter: Let''s get out of here!'; cr.
        Transcript show: '=============================================='; cr.
        Transcript show: '                  YOU WON                     '; cr.
        Transcript show: '=============================================='; cr.
        ObjectMemory quit.
    ]

    EndGame >> playerLost [
        Transcript show: '=============================================='; cr.
        Transcript show: '                  YOU LOST                    '; cr.
        Transcript show: '=============================================='; cr.
        ObjectMemory quit.
    ]
]