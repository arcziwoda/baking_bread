-- Main.hs
module Main where

import Game ( GameState, Command(..), initialState )
import Commands ( executeCommand )
import System.IO (hFlush, stdout)

main :: IO ()
main = do
    putStrLn "Welcome to Baking B(re)ad: The Lab Escape!"
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
    ("talk_to":name:_) -> TalkTo name
    ["look_around"] -> LookAround
    ("add":location:what:_) -> Add location what
    ("use":what:_) -> Use what
    ("go_to":destination:_) -> GoTo destination
    ("choose_path":name:_) -> ChoosePath name
    ("search":what:_) -> Search what
    ("hack":what:_) -> Hack what
    ("create_pick":tool1:tool2:_) -> CreatePick tool1 tool2
    ("move_pick":direction:_) -> MovePick direction
    ["help"] -> Help
    ["quit"] -> Quit
    _ -> Help