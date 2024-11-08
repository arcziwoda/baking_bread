module LevelOne (
    startLevelOne,
    talkToJesse,
    talkToSaul,
    lookAround,
    addIngredient,
    goToMainDoor
) where

import Game (GameState, currentLevel, timeLeft, canUseMainDoor, muffinsDone, bakersAreComing, sanepidIsComing)
import LevelTwo (startLevelTwo)

startLevelOne :: IO ()
startLevelOne = do
    putStrLn "Walter: Yo, Jesse, you there?"
    putStrLn "Jesse: Yeah, Mr. Black, what's up?"
    putStrLn "Walter: It's been a rough day, huh?"
    putStrLn "Jesse: You bet. These blue muffins are no joke."
    putStrLn "Walter: We need to finish them up."

talkToJesse :: GameState -> IO GameState
talkToJesse state = do
    putStrLn "Jesse: Man, I never thought baking could be this intense."
    putStrLn "Walter: It's all about precision, Jesse. One wrong move and it's all over."
    putStrLn "Jesse: Yeah, yeah, I get it. But these muffins... they're something else."
    putStrLn "Walter: They have to be perfect. Our reputation depends on it."
    putStrLn "Jesse: Yo, Mr. Black, what's the final ingredient for the cake?"
    putStrLn "Jesse: I totally forgot, man. Maybe you should look around to see what's on the table."
    return state

talkToSaul :: GameState -> IO GameState
talkToSaul state
    | bakersAreComing state = do
        putStrLn "Saul Badman: Hey, Walter! It's Saul. Listen, the rival bakers are on their way. You gotta get outta there, man!"
        putStrLn "Walter: Damn it, Saul! How much time do we have?"
        putStrLn "Saul Badman: Not much, maybe a few minutes. You need to move!"
        putStrLn "Jesse: Yo, Mr. Black, this is bad. What do we do?"
        putStrLn "Walter: We need to get to the main door, Jesse. Now!"
        putStrLn "Jesse: Alright, let's go!"
        return state { canUseMainDoor = True, timeLeft = 25 }
    | sanepidIsComing state = do
        putStrLn "Saul Badman: Hey, genius! What did you do? The sanepid is coming! You better run!"
        putStrLn "Walter: Damn it, Saul. How much time do we have?"
        putStrLn "Saul Badman: Not much, Walter. You need to get out of there, fast!"
        putStrLn "Jesse: Mr. Black, we gotta move! What now?"
        putStrLn "Walter: Head to the main door, Jesse. We don't have much time!"
        putStrLn "Jesse: Got it, let's get outta here!"
        return state { canUseMainDoor = True, timeLeft = 20 }
    | otherwise = return state

lookAround :: GameState -> IO GameState
lookAround state = do
    putStrLn "Walter: Let's see what's on the table..."
    putStrLn "[sees sugar, blue food coloring, baking soda and los pollos hermanos sauce]"
    return state

addIngredient :: String -> String -> GameState -> IO GameState
addIngredient "muffins" ingredient state
    | muffinsDone state = do
        putStrLn "Jesse: Yo, the muffins are done, b****! Answer that phone!"
        return state
    | ingredient == "blue_food_coloring" = do
        putStrLn "Walter: That's it! The final ingredient for the muffins is blue_food_coloring!"
        putStrLn "Jesse: Yo, Mr. Black! These muffins are gonna be tight!"
        putStrLn "Walter: Yes, Jesse. Now let's finish these muffins and move on."
        putStrLn "[The phone rings]"
        putStrLn "Jesse: Yo, Mr. Black! It's Saul! Better pick that up!"
        return state { muffinsDone = True, bakersAreComing = True }
    | ingredient == "los_pollos_hermanos_sauce" = do
        putStrLn "Walter: Damn it! The oven overheated! The alarms are going off!"
        putStrLn "Jesse: The sanepid will come soon, they will know about the secret bakery!"
        putStrLn "[The phone rings]"
        putStrLn "Jesse: Yo, Mr. Black! It's Saul! Better pick that up!"
        return state { muffinsDone = True, sanepidIsComing = True }
    | otherwise = do
        putStrLn "Walter: No, that's not right. We need to add the correct ingredient to the muffins."
        putStrLn "Jesse: Come on, think! What was it again?"
        return state
addIngredient _ _ state = do
    putStrLn "Walter: We are not adding ingredients to that! Focus on the muffins!"
    return state

goToMainDoor :: GameState -> IO GameState
goToMainDoor state
    | canUseMainDoor state = do
        putStrLn "Moving to Level Two..."
        startLevelTwo
        return state { currentLevel = 2 }
    | otherwise = do
        putStrLn "Walter: We can't use the main door yet!"
        return state