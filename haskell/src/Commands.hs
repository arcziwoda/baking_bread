module Commands where

import Game
import LevelOne (startLevelOne)

printIntroduction :: IO ()
printIntroduction = do
    putStrLn "### Introduction ###"
    putStrLn "---------------------------------------------"
    putStrLn "Welcome to Baking B(re)ad: The Lab Escape!"
    putStrLn "You are Walter Black, a brilliant baker working in Sus' bakery."
    putStrLn "You work in a secret lab under the laundromat."
    putStrLn "You are famous for your signature blue muffins, which rival bakers envy."
    putStrLn "Your partner, known as Jesse Yellowman, is with you."
    putStrLn "He is not as smart as you, but he is loyal and can help you."
    putStrLn "If you type \"help\" Jesse will remind you of the possible commands."
    putStrLn "After a botched deal, your situation has become dire."
    putStrLn "You feel like one mistake could be your last."
    putStrLn "After a long day of work it is time to add the last ingredient to your product."
    putStrLn "Good luck!"
    putStrLn "---------------------------------------------"

executeCommand :: Command -> GameState -> IO GameState

executeCommand Quit state = do
    putStrLn "Quitting the game..."
    return state

executeCommand Help state = do
    putStrLn "### Game rules ###"
    putStrLn "1. talk_to(name?) - Talk to someone."
    putStrLn "2. look_around - Look around."
    putStrLn "3. add(where?, what?) - Add something to something."
    putStrLn "4. use(what?) - Use something."
    putStrLn "5. go_to(where?) - Go to a place."
    putStrLn "6. choose_path(name?) - Choose a path."
    putStrLn "7. search(what?) - Search for something."
    putStrLn "8. hack(what?) - Hack something."
    putStrLn "9. create_pick(first tool, second tool) - Create a lockpick."
    putStrLn "10. move_pick(direction?) - Move the lockpick."
    putStrLn "Type \"help\" to see this message again."
    return state

executeCommand Start state = do
    startLevelOne
    return state

executeCommand _ state = do
    putStrLn "Unknown command."
    return state
