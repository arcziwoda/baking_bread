module Game where

data GameState = GameState
    { currentLevel :: Int
    , timeLeft :: Int
    , playing :: Bool
    , bakersAreComing :: Bool
    , sanepidIsComing :: Bool
    , muffinsDone :: Bool
    , canUseMainDoor :: Bool
    , canMakeKvass :: Bool
    , canMakeLockpick :: Bool
    , kvassDisolveTime :: Int
    , pickCreated :: Bool
    , lockPicked :: Bool
    , crowbarFound :: Bool
    , keycardFound :: Bool
    , pinFound :: Bool
    , byTheDoor :: Bool
    , pepperSpray :: Bool
    }
    deriving (Show, Eq)

initialState :: GameState
initialState =
    GameState
        { currentLevel = 0
        , timeLeft = 0
        , playing = False
        , bakersAreComing = False
        , sanepidIsComing = False
        , muffinsDone = False
        , canUseMainDoor = False
        , canMakeKvass = False
        , canMakeLockpick = False
        , kvassDisolveTime = 3
        , pickCreated = False
        , lockPicked = False
        , crowbarFound = False
        , keycardFound = False
        , pinFound = False
        , byTheDoor = False
        , pepperSpray = False
        }
