module EndGame (endGame, checkTimeLeft) where

import Game (GameState(..))
import System.Exit (exitSuccess, exitFailure)

endGame :: GameState -> IO ()
endGame state = do
    putStrLn "[The main door opens]"
    if timeLeft state >= 10
        then playerWon
        else checkPlayerWon state

checkTimeLeft :: GameState -> IO ()
checkTimeLeft state
    | timeLeft state <= 0 = do
        if bakersAreComing state
            then do
                putStrLn "[Walter and Jesse didn't escape in time and the bakers made it to the lab]"
                putStrLn "Jack Welker: We got you now!"
                putStrLn "Walter: We should have taken something to defend ourselves!"
                putStrLn "Jack Welker: You're dead meat!"
                putStrLn "[Jack shoots Walter and Jesse]"
                playerLost
            else if sanepidIsComing state
                then do
                    putStrLn "[Walter and Jesse didn't escape in time and the sanepid inspector made it to the lab]"
                    putStrLn "Hank Schrader: Sanepid inspection! Get out of there now!"
                    putStrLn "Walter: We should have taken something to defend ourselves!"
                    putStrLn "Hank Schrader: You're under arrest!"
                    putStrLn "[Hank arrests Walter and Jesse]"
                    playerLost
                else playerLost
    | otherwise = return ()


checkPlayerWon :: GameState -> IO ()
checkPlayerWon state
    | sanepidIsComing state = do
        putStrLn "[Walter and Jesse didn't escape in time and the sanepid inspector made it to the lab]"
        putStrLn "Hank Schrader: Sanepid inspection! Get out of there now!"
        if pepperSpray state
            then do
                putStrLn "Walter: Quick, Jesse! Use the pepper spray!"
                putStrLn "Jesse: Take this, Hank!"
                putStrLn "[Hank is knocked out by the pepper spray]"
                putStrLn "Walter: We did it, Jesse! We escaped just in time!"
                playerWon
            else if crowbarFound state
                then do
                    putStrLn "Walter: Quick, Jesse! Use the crowbar to block the door!"
                    putStrLn "Jesse: Done! That should hold them off!"
                    putStrLn "[Walter and Jesse block the door and escape just in time!]"
                    playerWon
                else do
                    putStrLn "Walter: We should have taken something to defend ourselves!"
                    putStrLn "Hank Schrader: You're under arrest!"
                    putStrLn "[Hank arrests Walter and Jesse]"
                    playerLost
    | bakersAreComing state = do
        putStrLn "[Walter and Jesse didn't escape in time and the bakers made it to the lab]"
        putStrLn "Jack Welker: We got you now!"
        if pepperSpray state
            then do
                putStrLn "Walter: Quick, Jesse! Use the pepper spray!"
                putStrLn "Jesse: Take this, Jack!"
                putStrLn "[Jack is knocked out by the pepper spray]"
                putStrLn "Walter: We did it, Jesse! We escaped just in time!"
                playerWon
            else if crowbarFound state
                then do
                    putStrLn "Walter: Jesse! Block the door with the crowbar, now!"
                    putStrLn "Jesse: Got it! That'll keep them out for a while."
                    putStrLn "[Walter and Jesse block the door and make their escape!]"
                    playerWon
                else do
                    putStrLn "Walter: We should have taken something to defend ourselves!"
                    putStrLn "Jack Welker: You're dead meat!"
                    putStrLn "[Jack shoots Walter and Jesse]"
                    playerLost
    | otherwise = playerLost

playerWon :: IO ()
playerWon = do
    putStrLn "[Walter and Jesse exit the lab]"
    putStrLn "Jesse: Yesssss! Hell yeah! Ey c'mon baby. C'mon yes!"
    putStrLn "[Jesse awaits Walter to give him a high five]"
    putStrLn "[Walter gives jesse high five]"
    putStrLn "Walter: Ahhhhh!"
    putStrLn "Jesse: Ahhhhh!"
    putStrLn "Jesse: Du'uh!"
    putStrLn "Walter: Let's get out of here!"
    putStrLn "=============================================="
    putStrLn "                  YOU WON                     "
    putStrLn "=============================================="
    exitSuccess

playerLost :: IO ()
playerLost = do
    putStrLn "=============================================="
    putStrLn "                  YOU LOST                    "
    putStrLn "=============================================="
    exitFailure