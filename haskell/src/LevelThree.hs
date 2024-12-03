module LevelThree where

import Game (GameState, currentLevel, timeLeft, kvassDisolveTime, addedWholeGrainBread, addedYeast, addedWater, lockPicked, byTheOfficeDoor, pepperSpray)
import LevelFive (startLevelFive)

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

addIngredient :: String -> String -> GameState -> IO GameState
addIngredient "kvass" ingredient state
    | currentLevel state /= 3 || (byTheOfficeDoor state) = return state
    | otherwise =
        if addedWholeGrainBread state && ingredient == "whole_grain_bread" then do
            putStrLn "Jesse: Yo! You already added the whole grain bread! Stop wasting time!"
            return state
        else if addedYeast state && ingredient == "yeast" then do
            putStrLn "Jesse: Yo! You already added the yeast! Stop wasting time!"
            return state
        else if addedWater state && ingredient == "water" then do
            putStrLn "Jesse: Yo! You already added the water! Stop wasting time!"
            return state
        else if ingredient == "whole_grain_bread" then do
            putStrLn "Jesse: Do you want to add anything else or we good to go?"
            return state { addedWholeGrainBread = True, kvassDisolveTime = kvassDisolveTime state - 2 }
        else if ingredient == "yeast" then do
            putStrLn "Jesse: Do you want to add anything else or we good to go?"
            return state { addedYeast = True, kvassDisolveTime = kvassDisolveTime state - 1 }
        else if ingredient == "water" then do
            putStrLn "Jesse: Do you want to add anything else or we good to go?"
            return state { addedWater = True, kvassDisolveTime = kvassDisolveTime state + 1 }
        else do
            putStrLn "Walter: No, that's not right. We need to add the correct ingredient to the muffins."
            putStrLn "Jesse: Come on, think! What was it again?"
            return state
addIngredient _ _ state
    | currentLevel state /= 3 = return state
    | otherwise = do
        putStrLn "Jesse: Come on! We're adding ingredients to the kvass, not that!"
        putStrLn "Walter: Sorry! I got distracted!"
        return state

goToOfficeDoor :: GameState -> IO GameState
goToOfficeDoor state
    | currentLevel state /= 3 = return state
    | otherwise = do
        putStrLn "Walter: Ok, the Kvass is ready, now let's take it to the office's door."
        putStrLn "Jesse: Yo, I remember there was a pepper spray in the lab. Maybe we should take it?"
        putStrLn "Walter: I don't know Jesse, it will take some time to find it..."
        return state { byTheOfficeDoor = True }

takePepperSpray :: GameState -> IO GameState
takePepperSpray state
    | currentLevel state /= 3 || (lockPicked state) = return state
    | otherwise = do
        putStrLn "Jesse: Yo Mr. Black, there's still some left in the can, this might come in handy later..."
        putStrLn "Walter: Great, now let's use the Kvass, we don't have time, remember?"
        return state { pepperSpray = True }

useKvass :: GameState -> IO GameState
useKvass state
    | currentLevel state /= 3 || not (byTheOfficeDoor state) = return state
    | otherwise = do
        putStrLn "Jesse: Aight, now let's pour this bad boy on the lock!"
        putStrLn "Walter: Here goes nothing..."
        if kvassDisolveTime state == 1 then do
            putStrLn ("It took 1 minute to dissolve the lock")
        else do
            putStrLn ("It took " ++ show (kvassDisolveTime state) ++ " minutes to dissolve the lock")
        putStrLn "[Office door slowly opens]"
        return state { lockPicked = True}

goToOffice :: GameState -> IO GameState
goToOffice state
    | currentLevel state /= 3 || not (lockPicked state) = return state
    | otherwise = do
        startLevelFive
        return state{currentLevel = 5}