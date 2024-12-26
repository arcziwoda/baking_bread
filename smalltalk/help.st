Object subclass: Help [
    Help class >> new [
        ^super new initialize.
    ]

    Help >> initialize [
        ^self
    ]

    Help >> printIntroduction [
        '### Introduction ###' displayNl.
        '---------------------------------------------' displayNl.
        'Welcome to Baking B(re)ad: The Lab Escape!' displayNl.
        'You are Walter Black, a brilliant baker working in Sus'' bakery.' displayNl.
        'You work in a secret lab under the laundromat.' displayNl.
        'You are famous for your signature blue muffins, which rival bakers envy.' displayNl.
        'Your partner, known as Jesse Yellowman, is with you.' displayNl.
        'He is not as smart as you, but he is loyal and can help you.' displayNl.
        'If you type "help" Jesse will remind you of the possible commands.' displayNl.
        'After a botched deal, your situation has become dire.' displayNl.
        'You feel like one mistake could be your last.' displayNl.
        'After a long day of work it is time to add the last ingredient to your product.' displayNl.
        'Good luck!' displayNl.
        '---------------------------------------------' displayNl.
    ]

    Help >> printHelp [
        '### Game rules ###' displayNl.
        '1. talk_to [name?] - Talk to someone.' displayNl.
        '2. look_around - Look around.' displayNl.
        '3. add [what?] - Add something to muffins.' displayNl.
        '4. use [what?]  - Use something.' displayNl.
        '5. go_to [where?] - Go to a place.' displayNl.
        '6. choose_path [name?] - Choose a path.' displayNl.
        '7. search [what?] - Search for something.' displayNl.
        '8. hack [what?] - Hack something.' displayNl.
        '9. create_pick [first tool] [second tool] - Create a lockpick.' displayNl.
        'Type "help" to see this message again.' displayNl.
    ]
]