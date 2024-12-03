module Main where

import Commands (Command (..), executeCommand, parseCommand)
import Game (GameState (..), initialState)
import Help (printIntroduction)
import System.IO (hFlush, stdout)
import Control.Monad (when)

main :: IO ()
main = do
    putStrLn "Welcome to Baking B(re)ad: The Lab Escape!"
    printIntroduction
    putStr "Type \"help\" to see the game rules.\n"
    putStr "Type \"start\" to begin the game.\n"
    gameLoop initialState

gameLoop :: GameState -> IO ()
gameLoop state = do
    input <- getUserInput
    let command = parseCommand input
    let updatedTimeState = decrementTime state command
    when (timeLeft updatedTimeState < timeLeft state) $
        putStrLn $ "Time left: " ++ show (timeLeft updatedTimeState)
    newState <- executeCommand command updatedTimeState
    if command == Quit
        then putStrLn "Game Over"
        else gameLoop newState

decrementTime :: GameState -> Command -> GameState
decrementTime state command
    | timeLeft state > 0 =
        let decrementValue = getTimeCostOfCommand command
         in state{timeLeft = timeLeft state - decrementValue}
    | otherwise = state

getTimeCostOfCommand :: Command -> Int
getTimeCostOfCommand command = case command of
    LookAround -> 0
    _ -> 1

getUserInput :: IO String
getUserInput = do
    putStr "> "
    hFlush stdout
    getLine
