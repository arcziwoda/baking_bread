module LevelThree (startLevelThree, lookAround) where

import Game (GameState, currentLevel, timeLeft)

startLevelThree :: IO ()
startLevelThree = do
    putStrLn "Jesse: I think we have some leftover Kvass from the last batch of bread."
    putStrLn "Watler: Yes, over there, but it's pretty weak, it won't dissolve the lock quickly."
    putStrLn "Jesse: Aight, then maybe we could add something to make it stronger or go straight to the office door and use it."

lookAround :: GameState -> IO GameState
lookAround state
    | currentLevel state /= 3 = return state
    | otherwise = do
        putStrLn "Walter: What do we have here that could be useful..."
        putStrLn "[sees some whole grain bread, water, and some yeast]"
        return state
