module LevelTwo (
    startLevelTwo,
    choosePathJesse,
    choosePathWalter
) where

import Game(GameState, currentLevel, timeLeft, bakersAreComing, sanepidIsComing, canMakeKvass, canMakeLockpick)

startLevelTwo :: IO ()
startLevelTwo = do
    putStrLn "Jesse: Yo, the door won't open!"
    putStrLn "Walter: Damn it, it can only be unlocked by a key card. I think it's locked in Sus' office."
    putStrLn "Jesse: And how do we get there?"
    putStrLn "Walter: We don't have the key, but we could try to pick the lock."
    putStrLn "Jesse: I ain't no locksmith, we should use some Kvass to melt the lock."
    putStrLn "Walter: We have to pick one of the options, we don't have much time left!"

choosePathJesse :: GameState -> IO GameState
choosePathJesse state = do
    putStrLn "Jesse: Yo, Mr. Black, we gotta go back to the lab to make the Kvass, let's go!"
    return state { canMakeKvass = True }

choosePathWalter :: GameState -> IO GameState
choosePathWalter state = do
    putStrLn "Walter: We should be able to make the lockpick out of some scraps left in the storage. Follow me."
    return state { canMakeLockpick = True }