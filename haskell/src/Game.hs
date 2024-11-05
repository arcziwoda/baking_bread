module Game where

data Command = Help
             | Quit
             | Start
             | TalkTo String
             | LookAround
             | Add String String
             | GoTo String
             deriving (Show, Eq)

data GameState = GameState {
    currentLevel :: Int,
    timeLeft :: Int,
    bakersAreComing :: Bool,
    sanepidIsComing :: Bool,
    muffinsDone :: Bool,
    canUseMainDoor :: Bool,
    playing :: Bool
} deriving (Show, Eq)

initialState :: GameState
initialState = GameState {
    currentLevel = 0,
    timeLeft = 0,
    bakersAreComing = False,
    sanepidIsComing = False,
    muffinsDone = False,
    canUseMainDoor = False,
    playing = False
}