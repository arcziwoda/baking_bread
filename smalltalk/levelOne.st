Object subclass: LevelOne [
    LevelOne class >> new [
        ^super new initialize.
    ]

    LevelOne >> initialize [
        "Initialization code if needed"
    ]

    LevelOne >> startLevelOne: state [
        'Walter: Yo, Jesse, you there?' displayNl.
        'Jesse: Yeah, Mr. Black, what''s up?' displayNl.
        'Walter: It''s been a rough day, huh?' displayNl.
        'Jesse: You bet. These blue muffins are no joke.' displayNl.
        'Walter: We need to finish them up.' displayNl.
        ^state
    ]

    LevelOne >> talkToJesse: state [
        state currentLevel = 1 ifTrue: [
            'Jesse: Man, I never thought baking could be this intense.' displayNl.
            'Walter: It''s all about precision, Jesse. One wrong move and it''s all over.' displayNl.
            'Jesse: Yeah, yeah, I get it. But these muffins... they''re something else.' displayNl.
            'Walter: They have to be perfect. Our reputation depends on it.' displayNl.
            'Jesse: Yo, Mr. Black, what''s the final ingredient for the cake?' displayNl.
            'Jesse: I totally forgot, man. Maybe you should look around to see what''s on the table.' displayNl.
        ].
        ^state
    ]

    LevelOne >> talkToSaul: state [
        state currentLevel = 1 ifTrue: [
            state bakersAreComing ifTrue: [
                'Saul Badman: Hey, Walter! It''s Saul. Listen, the rival bakers are on their way. You gotta get outta there, man!' displayNl.
                'Walter: Damn it, Saul! How much time do we have?' displayNl.
                'Saul Badman: Not much, maybe a few minutes. You need to move!' displayNl.
                'Jesse: Yo, Mr. Black, this is bad. What do we do?' displayNl.
                'Walter: We need to get to the main door, Jesse. Now!' displayNl.
                'Jesse: Alright, let''s go!' displayNl.
                state canUseMainDoor: true.
                state timeLeft: 25.
                state countTime: true.
            ].
            state sanepidIsComing ifTrue: [
                'Saul Badman: Hey, genius! What did you do? The sanepid is coming! You better run!' displayNl.
                'Walter: Damn it, Saul. How much time do we have?' displayNl.
                'Saul Badman: Not much, Walter. You need to get out of there, fast!' displayNl.
                'Jesse: Mr. Black, we gotta move! What now?' displayNl.
                'Walter: Head to the main door, Jesse. We don''t have much time!' displayNl.
                'Jesse: Got it, let''s get outta here!' displayNl.
                state canUseMainDoor: true.
                state timeLeft: 20.
                state countTime: true.
            ].
        ].
        ^state
    ]

    LevelOne >> lookAround: state [
        state currentLevel = 1 ifTrue: [
            'Walter: Let''s see what''s on the table...' displayNl.
            '[sees sugar, blue food coloring, baking soda and los pollos hermanos sauce]' displayNl.
        ].
        ^state
    ]

    LevelOne >> addIngredient: ingredient toState: state [
        state currentLevel = 1 ifTrue: [
            state muffinsDone ifTrue: [
                'Jesse: Yo, the muffins are done, b****! Answer that phone!' displayNl.
            ] ifFalse: [
                ingredient = 'blue_food_coloring' ifTrue: [
                    'Walter: That''s it! The final ingredient for the muffins is blue_food_coloring!' displayNl.
                    'Jesse: Yo, Mr. Black! These muffins are gonna be tight!' displayNl.
                    'Walter: Yes, Jesse. Now let''s finish these muffins and move on.' displayNl.
                    '[The phone rings]' displayNl.
                    'Jesse: Yo, Mr. Black! It''s Saul! Better pick that up!' displayNl.
                    state muffinsDone: true.
                    state bakersAreComing: true.
                ].
                ingredient = 'los_pollos_hermanos_sauce' ifTrue: [
                    'Walter: Damn it! The oven overheated! The alarms are going off!' displayNl.
                    'Jesse: The sanepid will come soon, they will know about the secret bakery!' displayNl.
                    '[The phone rings]' displayNl.
                    'Jesse: Yo, Mr. Black! It''s Saul! Better pick that up!' displayNl.
                    state muffinsDone: true.
                    state sanepidIsComing: true.
                ].
                (ingredient ~= 'blue_food_coloring' and: [ingredient ~= 'los_pollos_hermanos_sauce']) ifTrue: [
                    'Walter: No, that''s not right. We need to add the correct ingredient to the muffins.' displayNl.
                    'Jesse: Come on, think! What was it again?' displayNl.
                ].
            ].
        ].
        ^state
    ]

    LevelOne >> goToMainDoor: state [
        state currentLevel = 1 ifTrue: [
            state canUseMainDoor ifTrue: [
                'Starting level two...' displayNl.
                state currentLevel: 2.
            ] ifFalse: [
                'Walter: We can''t use the main door yet!' displayNl.
            ].
        ].
        ^state
    ]
]