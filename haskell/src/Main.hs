module Main where

import Commands (executeCommand, printIntroduction)
import Game (Command (..), GameState (..), initialState)
import System.IO (hFlush, stdout)

main :: IO ()
main = do
    putStrLn "Welcome to Baking B(re)ad: The Lab Escape!"
    printIntroduction
    putStr "Type \"help\" to see the game rules.\n"
    putStr "Type \"start\" to begin the game.\n"
    gameLoop initialState

gameLoop :: GameState -> IO ()
gameLoop state = do
    putStr "> "
    hFlush stdout
    input <- getLine
    let command = parseCommand input
    let updatedTimeState = decrementTime command state
    if timeLeft updatedTimeState < timeLeft state
        then putStrLn $ "Time left: " ++ show (timeLeft updatedTimeState)
        else return ()
    newState <- executeCommand command updatedTimeState
    if command == Quit
        then putStrLn "Game Over"
        else gameLoop newState

decrementTime :: Command -> GameState -> GameState
decrementTime command state
    | timeLeft state > 0 =
        let decrementValue = case command of
                LookAround -> 0
                _ -> 1
         in state{timeLeft = timeLeft state - decrementValue}
    | otherwise = state

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
    ["use", what] -> Use what
    ["create_pick", tool1, tool2] -> CreatePick tool1 tool2
    _ -> Help
