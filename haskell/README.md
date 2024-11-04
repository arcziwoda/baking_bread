# Baking B(re)ad: The Lab Escape (Haskell Adventure Game)

**Baking B(re)ad: The Lab Escape** is a text-based adventure game where you play as a chemistry teacher turned baker who is trapped in their secret bread lab. Your objective is to navigate through the perilous lab, avoid traps, use your bakery skills to solve puzzles, and escape before authorities or rival bakers find you.

This game version is written in **Haskell**, showcasing a functional approach to game logic. The player makes decisions by typing commands, progressing through the story by interacting with various objects and solving challenges.

## Game Concept

As the player, you're locked in a secret bakery filled with hazardous materials and security systems. To escape, you need to collect useful items and make strategic decisions before time runs out. Logical challenges and clever use of resources will be essential for a safe escape.

## How to Play

### 1. Clone the Repository:
First, clone the repository to your local machine using Git.

```bash
git clone https://gitlab-stud.elka.pw.edu.pl/oszypczy/breaking-bad-lab-escape
cd breaking-bad-lab-escape/haskell/
```

### 2. Install GHC (Glasgow Haskell Compiler):
Make sure you have **GHC** and **Cabal** installed. You can download and install them from [Haskell Downloads](https://www.haskell.org/downloads/).

#### For Linux Users:
You can install GHC and Cabal using your package manager. Here are the commands for some common distributions:

- **Ubuntu/Debian:**
  ```bash
  sudo apt update
  sudo apt install ghc cabal-install
  ```

### 3. Build and Run the Game:
To start playing, build and run the game with the following commands:

```bash
cabal build
cabal run
```

Upon starting, you’ll be presented with a description of your surroundings and a set of possible actions. Type your action and press Enter to advance.

### Example:
```plaintext
goTo "officeDoor"

<Remaining time: 16 minutes>

Walter: Ok, the kvass is ready, now let's take it to the office door.
Jesse: Yo, I remember there was a pepper spray in the lab. Maybe we should take it?
Walter: I don't know, Jesse, it will take some time to find it...
```

```plaintext
use "kvass"

<Remaining time: 15 minutes>

Jesse: Aight, now let's pour this bad boy on the lock!
Walter: Here goes nothing...
<It took 1 minute to dissolve the lock.>

[Office door slowly opens]
```

### 4. Quitting the Game:
To exit, type `quit` when prompted for your action.

## Development
This project was originally developed in **Prolog** and has now been rewritten in **Haskell** to explore functional programming concepts. The game’s mechanics and states are modeled using Haskell’s functional structures, providing a unique way to manage game logic.

