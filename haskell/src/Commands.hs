module Commands where

import Game
import Help
import LevelFive (goToMainDoor, hackComputer, lookAround, search, talkToCesar, useKeycard)
import LevelFour (createPick, goToOffice, lookAround, search, startLevelFour, goToOfficeDoor, useCrowbar, useLockpick)
import LevelOne (addIngredient, goToMainDoor, lookAround, startLevelOne, talkToJesse, talkToSaul)
import LevelThree (lookAround, addIngredient, goToOfficeDoor, takePepperSpray, useKvass, goToOffice)
import LevelTwo (choosePathJesse, choosePathWalter, goToLab, goToStorage)

data Command
    = Help
    | Quit
    | Start
    | TalkTo String
    | LookAround
    | Add String String
    | GoTo String
    | ChoosePath String
    | Take String
    | Search String
    | Use String
    | CreatePick String String
    | Hack String
    deriving (Show, Eq)

parseCommand :: String -> Command
parseCommand input = case words input of
    ["help"] -> Help
    ["quit"] -> Quit
    ["start"] -> Start
    ["talk_to", name] -> TalkTo name
    ["look_around"] -> LookAround
    ["add", where_, what] -> Add where_ what
    ["go_to", where_] -> GoTo where_
    ["choose_path", name] -> ChoosePath name
    ["search", where_] -> Search where_
    ["take", what] -> Take what
    ["use", what] -> Use what
    ["create_pick", tool1, tool2] -> CreatePick tool1 tool2
    ["hack", what] -> Hack what
    _ -> Help

executeCommand :: Command -> GameState -> IO GameState

executeCommand Quit state = do
    putStrLn "Quitting the game..."
    return state

executeCommand Help state = do
    printHelp
    return state

executeCommand Start state = do
    startLevelOne
    return state{currentLevel = 1, playing = True}

executeCommand (TalkTo "jesse") state = talkToJesse state

executeCommand (TalkTo "saul") state = talkToSaul state

executeCommand (TalkTo "cesar") state = talkToCesar state

executeCommand LookAround state = do
    newState <- case currentLevel state of
        1 -> LevelOne.lookAround state
        3 -> LevelThree.lookAround state
        4 -> LevelFour.lookAround state
        5 -> LevelFive.lookAround state
        _ -> return state
    return newState

executeCommand (Add where_ what) state = do
    newState <- case currentLevel state of
        1 -> LevelOne.addIngredient where_ what state
        3 -> LevelThree.addIngredient where_ what state
        _ -> return state
    return newState

executeCommand (GoTo "main_door") state = do
    newState <- case currentLevel state of
        1 -> LevelOne.goToMainDoor state
        5 -> LevelFive.goToMainDoor state
        _ -> return state
    return newState

executeCommand (GoTo "office_door") state = do
    newState <- case currentLevel state of
        3 -> LevelThree.goToOfficeDoor state
        4 -> LevelFour.goToOfficeDoor state
        _ -> return state
    return newState

executeCommand (Take "pepper_spray") state = takePepperSpray state

executeCommand (ChoosePath "jesse") state = choosePathJesse state

executeCommand (ChoosePath "walter") state = choosePathWalter state

executeCommand (GoTo "lab") state = goToLab state

executeCommand (GoTo "storage") state = goToStorage state

executeCommand (GoTo "office") state = do
    newState <- case currentLevel state of
        3 -> LevelThree.goToOffice state
        4 -> LevelFour.goToOffice state
        _ -> return state
    return newState

executeCommand (Search where_) state = do
    newState <- case currentLevel state of
        4 -> LevelFour.search where_ state
        5 -> LevelFive.search where_ state
        _ -> return state
    return newState

executeCommand (Use "keycard") state = useKeycard state

executeCommand (Use "kvass") state = useKvass state

executeCommand (Use "crowbar") state = useCrowbar state

executeCommand (Use "lockpick") state = useLockpick state

executeCommand (CreatePick tool1 tool2) state = createPick tool1 tool2 state

executeCommand (Hack "computer") state = hackComputer state

executeCommand _ state = do
    putStrLn "Unknown command."
    return state
