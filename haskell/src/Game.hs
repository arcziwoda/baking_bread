module Game where

data Command = Help
             | Quit
             | Start
             deriving (Show, Eq)

data GameState = GameState {
    currentLevel :: Int,
    timeLeft :: Int
} deriving (Show, Eq)

initialState :: GameState
initialState = GameState {
    currentLevel = 0,
    timeLeft = 0
}