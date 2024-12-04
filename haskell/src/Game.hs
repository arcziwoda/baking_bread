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
    , addedWholeGrainBread :: Bool
    , addedYeast :: Bool
    , addedWater :: Bool
    , pickCreated :: Bool
    , lockPicked :: Bool
    , crowbarFound :: Bool
    , byTheOfficeDoor :: Bool
    , keycardFound :: Bool
    , pinFound :: Bool
    , byTheMainDoor :: Bool
    , pepperSpray :: Bool
    }
    deriving (Show, Eq)

initialState :: GameState
initialState =
    GameState
        { currentLevel = 0
        , timeLeft = 10000
        , playing = False
        , bakersAreComing = False
        , sanepidIsComing = False
        , muffinsDone = False
        , canUseMainDoor = False
        , canMakeKvass = False
        , canMakeLockpick = False
        , kvassDisolveTime = 3
        , addedWholeGrainBread = False
        , addedYeast = False
        , addedWater = False
        , pickCreated = False
        , lockPicked = False
        , crowbarFound = False
        , byTheOfficeDoor = False
        , keycardFound = False
        , pinFound = False
        , byTheMainDoor = False
        , pepperSpray = False
        }
