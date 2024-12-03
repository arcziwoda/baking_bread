module LevelFour where

import Game (GameState, crowbarFound, currentLevel, lockPicked, pickCreated)
import LevelFive (startLevelFive)

startLevelFour :: IO ()
startLevelFour = do
    putStrLn "Jesse: We need to find tools for making a lockpick!"
    putStrLn "Walter: Or we could try to find a crowbar somewhere."

lookAround :: GameState -> IO GameState
lookAround state
    | currentLevel state /= 4 || pickCreated state = return state
    | otherwise = do
        putStrLn "Walter: Let's see what we can find here..."
        putStrLn "[sees some metal wires, a screwdriver, a hammer, and a wrench]"
        putStrLn "Walter: These tools could help us make a lockpick. I belive it is made from two things."
        putStrLn "[sees a hatch, a tool cabinet, a metal barrel, and a dumpster]"
        putStrLn "Walter: We could search these places for the crowbar."
        return state

goToOffice :: GameState -> IO GameState
goToOffice state
    | currentLevel state /= 4 || not (lockPicked state) = return state
    | otherwise = do
        startLevelFive
        return state{currentLevel = 5}

correctToolsForPick :: String -> String -> Bool
correctToolsForPick "metal_wires" "hammer" = True
correctToolsForPick "hammer" "metal_wires" = True
correctToolsForPick _ _ = False

createPick :: String -> String -> GameState -> IO GameState
createPick tool1 tool2 state
    | currentLevel state /= 4 || pickCreated state = return state
    | otherwise = case () of
        _
            | correctToolsForPick tool1 tool2 -> do
                putStrLn "Walter: Perfect! Now we can try to use the lockpick."
                return state{pickCreated = True}
            | otherwise -> do
                putStrLn "Walter: Damn, that didn't work. We're wasting time!"
                return state

validCrowbarLocation :: String -> Bool
validCrowbarLocation "metal_barrel" = True
validCrowbarLocation _ = False

search :: String -> GameState -> IO GameState
search where_ state
    | currentLevel state /= 4 || crowbarFound state = return state
    | otherwise = case () of
        _
            | validCrowbarLocation where_ -> do
                putStrLn "Jesse: B****! We found a crowbar!"
                return state{crowbarFound = True}
            | otherwise -> do
                putStrLn "Walter: No luck here. Let's keep searching."
                return state

use :: String -> GameState -> IO GameState
use "crowbar" state = useCrowbar state
use "lockpick" state = useLockpick state
use _ state = return state

useCrowbar :: GameState -> IO GameState
useCrowbar state
    | currentLevel state /= 4 || not (crowbarFound state) = return state
    | otherwise = do
        putStrLn "Walter: Let's use the crowbar to force the door open."
        putStrLn "[The door opens with a loud noise]"
        putStrLn "Jesse: Yes b****! Let's go through them man!"
        return state{lockPicked = True}

useLockpick :: GameState -> IO GameState
useLockpick state
    | currentLevel state /= 4 || not (pickCreated state) || lockPicked state = return state
    | otherwise = do
        putStrLn "Walter: Alright, let's try to pick the lock."
        initializePickSequence state

initializePickSequence :: GameState -> IO GameState
initializePickSequence state = do
    putStrLn "Walter: We need to move the pick carefully: up, right, down, or left."
    putStrLn "Walter: If we make a mistake, we'll have to start over."
    playPickSequence [] state

playPickSequence :: [String] -> GameState -> IO GameState
playPickSequence sequence state = do
    if sequence == ["up", "right", "down"]
        then do
            putStrLn "Walter: We did it! The lock is open!"
            putStrLn "[The office door slowly opens]"
            return state{lockPicked = True}
        else do
            putStrLn "Enter a direction: (up, right, down, left)"
            direction <- getLine
            let newSequence = sequence ++ [direction]
            if isValidMove newSequence
                then do
                    putStrLn "Walter: Keep going, the lock is almost there!"
                    playPickSequence newSequence state
                else do
                    putStrLn "Walter: Damn, that was the wrong move. We lost some time!"
                    return state

isValidMove :: [String] -> Bool
isValidMove sequence = sequence == take (length sequence) ["up", "right", "down"]
