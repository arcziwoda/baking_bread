module Game where

data Command = Help
             | Quit
             | Start
             | TalkTo String
             | LookAround
             | Add String String
             | GoTo String
             | ChoosePath String
             deriving (Show, Eq)

data GameState = GameState {
    currentLevel :: Int,
    timeLeft :: Int,
    playing :: Bool,
    bakersAreComing :: Bool,
    sanepidIsComing :: Bool,
    muffinsDone :: Bool,
    canUseMainDoor :: Bool,
    canMakeKvass :: Bool,
    canMakeLockpick :: Bool
} deriving (Show, Eq)

initialState :: GameState
initialState = GameState {
    currentLevel = 0,
    timeLeft = 0,
    playing = False,
    bakersAreComing = False,
    sanepidIsComing = False,
    muffinsDone = False,
    canUseMainDoor = False,
    canMakeKvass = False,
    canMakeLockpick = False
}