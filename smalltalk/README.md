# Baking B(re)ad: The Lab Escape (Smalltalk Adventure Game)

**Baking B(re)ad: The Lab Escape** is a text-based adventure game where you play as a chemistry teacher turned baker who is trapped in their secret bread lab. Your objective is to navigate through the perilous lab, avoid traps, use your bakery skills to solve puzzles, and escape before authorities or rival bakers find you.

This game version is written in **Smalltalk**, showcasing a classic object-oriented programming approach.

## Game Concept

As the player, you're locked in a secret bakery filled with hazardous materials and security systems. To escape, you need to collect useful items and make strategic decisions before time runs out. Logical challenges and clever use of resources will be essential for a safe escape.

## How to Play

### 1. Clone the Repository:
First, clone the repository to your local machine using Git.

```bash
git clone https://gitlab-stud.elka.pw.edu.pl/oszypczy/breaking-bad-lab-escape
cd breaking-bad-lab-escape/smalltalk/
```

### 2. Install GNU SmallTalk 

#### For Linux Users:
You can install GNU Smalltalk using your package manager.

- **Ubuntu/Debian:**
  ```bash
  sudo apt update
  sudo apt install gnu-smalltalk
  ```

### 3. Build and Run the Game:
To start playing, build and run the game with the following commands:

```bash
make run
```

Upon starting, you’ll be presented with a description of your surroundings and a set of possible actions. Type your action and press Enter to advance.

### Example:
```plaintext
Enter command: add kvass whole_grain_bread
Jesse: Do you want to add anything else or we good to go?
Time left 15
Enter command: go_to office_door
Walter: Ok, the Kvass is ready, now let's take it to the office's door.
Jesse: Yo, I remember there was a pepper spray in the lab. Maybe we should take it?
Walter: I don't know Jesse, it will take some time to find it...
Time left 14
Enter command: take pepper_spray
Jesse: Yo Mr. Black, there's still some left in the can, this might come in handy later...
Walter: Great, now let's use the Kvass, we don't have time, remember?
Time left 13
Enter command: use kvass
Jesse: Aight, now let's pour this bad boy on the lock!
Walter: Here goes nothing...
It took 1 minute to dissolve the lock
[Office door slowly opens]
Time left 12
Enter command: go_to office
Jesse: Yessss, it worked Mr. Black, we're in!
```

### 4. Quitting the Game:
To exit, type `quit` when prompted for your action.

## Development
This project was originally developed in **Prolog**, **Haskell**, and has now been rewritten in **Smalltalk** to demonstrate the versatility and power of different programming paradigms. The Smalltalk version emphasizes object-oriented design and interactive development.
