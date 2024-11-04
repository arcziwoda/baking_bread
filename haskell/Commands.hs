-- Commands.hs
module Commands where

import Game

executeCommand :: Command -> GameState -> IO GameState
executeCommand (TalkTo name) state = do
    putStrLn $ "Talking to " ++ name
    return state
executeCommand LookAround state = do
    putStrLn "Looking around..."
    return state
executeCommand (Add location what) state = do
    putStrLn $ "Adding " ++ what ++ " to " ++ location
    return state
executeCommand (Use what) state = do
    putStrLn $ "Using " ++ what
    return state
executeCommand (GoTo destination) state = do
    putStrLn $ "Going to " ++ destination
    return state
executeCommand (ChoosePath name) state = do
    putStrLn $ "Choosing path " ++ name
    return state
executeCommand (Search what) state = do
    putStrLn $ "Searching for " ++ what
    return state
executeCommand (Hack what) state = do
    putStrLn $ "Hacking " ++ what
    return state
executeCommand (CreatePick tool1 tool2) state = do
    putStrLn $ "Creating pick with " ++ tool1 ++ " and " ++ tool2
    return state
executeCommand (MovePick direction) state = do
    putStrLn $ "Moving pick " ++ direction
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
executeCommand Quit state = do
    putStrLn "Quitting the game..."
    return state