module Main where

import Commands (Command (..), executeCommand, parseCommand)
import Control.Monad (when)
import Game (GameState (..), initialState)
import Help (printIntroduction)
import System.IO (hFlush, stdout)
import EndGame (checkTimeLeft)

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
    when (currentLevel state > 1 && timeLeft updatedTimeState < timeLeft state) $
        putStrLn $ "Time left: " ++ show (timeLeft updatedTimeState)
    checkTimeLeft updatedTimeState
    newState <- executeCommand command updatedTimeState
    if command == Quit
        then putStrLn "Game Over"
        else gameLoop newState

decrementTime :: GameState -> Command -> GameState
decrementTime state command
    | timeLeft state > 0 =
        let decrementValue = getTimeCostOfCommand command state
         in state{timeLeft = timeLeft state - decrementValue}
    | otherwise = state

getTimeCostOfCommand :: Command -> GameState -> Int
getTimeCostOfCommand command state = case command of
    LookAround -> 0
    CreatePick _ _ -> 2
    Use "kvass" -> kvassDisolveTime state
    _ -> 1

getUserInput :: IO String
getUserInput = do
    putStr "> "
    hFlush stdout
    getLine