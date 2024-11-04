module Main where

import Game ( GameState, Command(..), initialState )
import Commands ( executeCommand, printIntroduction )
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
    newState <- executeCommand command state
    if command == Quit
        then putStrLn "Game Over"
        else gameLoop newState

parseCommand :: String -> Command
parseCommand input = case words input of
    ["help"] -> Help
    ["quit"] -> Quit
    ["start"] -> Start
    _ -> Help