-- Game.hs
module Game where

data Command = TalkTo String
             | LookAround
             | Add String String
             | Use String
             | GoTo String
             | ChoosePath String
             | Search String
             | Hack String
             | CreatePick String String
             | MovePick String
             | Help
             | Quit
             deriving (Show, Eq)

data GameState = GameState {
    currentLevel :: Int,
    inventory :: [String],
    location :: String,
    timeLeft :: Int
} deriving (Show, Eq)

initialState :: GameState
initialState = GameState {
    currentLevel = 1,
    inventory = [],
    location = "lab",
    timeLeft = 60
}