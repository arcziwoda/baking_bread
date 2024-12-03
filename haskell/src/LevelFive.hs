module LevelFive where

import Data.Char (isLower, isUpper)
import EndGame (endGame)
import Game (GameState, byTheMainDoor, currentLevel, keycardFound, pinFound)

startLevelFive :: IO ()
startLevelFive = do
    putStrLn "Jesse: Yessss, it worked Mr. Black, we're in!"

lookAround :: GameState -> IO GameState
lookAround state
    | currentLevel state /= 5 = return state
    | otherwise = do
        putStrLn "Walter: Let's find that keycard..."
        putStrLn "[The office is small. There are shelves and desk with computer on it]"
        return state

search :: String -> GameState -> IO GameState
search "shelves" state = searchShelves state
search "desk" state = searchDesk state
search _ state = return state

searchShelves :: GameState -> IO GameState
searchShelves state
    | currentLevel state /= 5 || keycardFound state = return state
    | otherwise = do
        putStrLn "Jesse: Nothing here, let's keep looking"
        return state

searchDesk :: GameState -> IO GameState
searchDesk state
    | currentLevel state /= 5 || keycardFound state = return state
    | otherwise = do
        putStrLn "Walter: Found it!"
        putStrLn "Jesse: That's the stuff, Mr. Black!"
        putStrLn "[Reads the keycard: In order to open the main door you need to provide the PIN code]"
        putStrLn "Walter: Damn it Jesse, we need to hack the computer to get the PIN code!"
        putStrLn "Jesse: Let's do it!"
        return state{keycardFound = True}

hackComputer :: GameState -> IO GameState
hackComputer state
    | currentLevel state /= 5 || not (keycardFound state) || pinFound state = return state
    | otherwise = do
        let encrypted = "ebiil"
        let decrypted = "hello"
        putStrLn $ "The encrypted password is: " ++ encrypted
        putStrLn "Enter the decrypted password: "
        guess <- getLine
        if guess == decrypted
            then do
                putStrLn "Walter: We did it!"
                putStrLn "Jesse: Yeah, science!"
                putStrLn "[The computer displays the PIN code: 997420]"
                putStrLn "Walter: Let's go to the main door and get out of here!"
                return state{pinFound = True}
            else do
                putStrLn "Walter: Wrong password!"
                putStrLn "Jesse: My friend Cesar can help us with that task!"
                putStrLn "Jesse: Just call him and tell him the encryption with your shift guess!"
                return state

goToMainDoor :: GameState -> IO GameState
goToMainDoor state
    | currentLevel state /= 5 || not (pinFound state) = return state
    | otherwise = do
        putStrLn "Jesse: Finally Mr. Black, we are getting out of here!"
        putStrLn "Jesse: Quick, use the keycard and enter the PIN code!"
        return state{byTheMainDoor = True}

useKeycard :: GameState -> IO GameState
useKeycard state
    | currentLevel state /= 5 || not (byTheMainDoor state) = return state
    | otherwise = do
        putStrLn "[Walter swipes the keycard. The PIN prompt appears]"
        putStrLn "Enter the PIN code: "
        pin <- getLine
        if pin == "997420"
            then do
                putStrLn "SUCCESS"
                endGame state
                return state
            else do
                putStrLn "FAILURE! The PIN code is incorrect!"
                putStrLn "Jesse: C'mon Mr. Black. Enter the PIN code we got from the computer, yo!"
                return state

talkToCesar :: GameState -> IO GameState
talkToCesar state
    | currentLevel state /= 5 = return state
    | otherwise = do
        putStrLn "Jesse: Let's see if Cesar picks up..."
        putStrLn "Cesar: Hello?"
        putStrLn "Jesse: Yo Cesar, it's Jesse, I don't have time to explain, but can you help us decrypt a computer password?"
        putStrLn "Cesar: Um... sure, what's the encrypted password?"
        encrypted <- getLine
        putStrLn "Cesar: Alright, now I need you to tell me by how much to shift the letters."
        putStrLn "Enter the shift value: "
        shiftInput <- getLine
        let shift = read shiftInput :: Int
        let decrypted = caesarEncrypt encrypted (shift)
        putStrLn $ "Jesse: Eee... I don't know, but maybe " ++ show shift ++ "."
        putStrLn $ "Cesar: " ++ encrypted ++ " shifted by " ++ show shift ++ " is " ++ decrypted ++ "."
        return state

caesarEncrypt :: String -> Int -> String
caesarEncrypt str shift = map (shiftChar shift) str

shiftChar :: Int -> Char -> Char
shiftChar shift char
    | isLower char = shiftWithBase shift char 'a'
    | isUpper char = shiftWithBase shift char 'A'
    | otherwise = char

shiftWithBase :: Int -> Char -> Char -> Char
shiftWithBase shift char baseChar =
    toEnum $ ((fromEnum char - fromEnum baseChar + shift) `mod` 26) + fromEnum baseChar
