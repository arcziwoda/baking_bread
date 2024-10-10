# Breaking Bad: The Lab Escape (Prolog Adventure Game)

**Breaking Bad: The Lab Escape** is a text-based adventure game where you take on the role of a chemistry teacher turned meth manufacturer who is trapped in their secret meth lab after a botched deal. Your goal is to navigate through the dangerous lab, avoid traps, use your chemistry skills to solve puzzles, and escape before law enforcement or rival gangs catch up with you.

The game is written in the **Prolog** programming language and follows a simple decision-making format where the player types commands to make choices and advance through the game.

## Game Concept

You, as the player, are stuck inside a booby-trapped meth lab filled with dangerous chemicals, security systems, and traps designed to prevent theft. You must find a way out while collecting useful items and avoiding deadly situations. Along the way, you’ll face logical challenges and need to use your wits and chemical knowledge to escape safely.

### Key Features:
- Navigate through a hazardous meth lab filled with traps and puzzles.
- Solve chemistry-related puzzles to unlock new paths or avoid danger.
- Collect and use items to help you escape.
- Manage your time wisely—law enforcement or rival criminals might show up if you take too long.
- Multiple ways to win (or lose), depending on your choices.

## How to Play

### 1. Clone the Repository:
First, clone the repository to your local machine using Git.

```bash
git clone https://gitlab.com/your-username/breaking-bad-lab-escape.git
cd breaking-bad-lab-escape
```

### 2. Install SWI-Prolog:
Ensure you have **SWI-Prolog** installed on your machine. You can download and install it from [SWI-Prolog Downloads](https://www.swi-prolog.org/Download.html).

#### For Linux Users:
You can install SWI-Prolog using your package manager. Here are the commands for some common distributions:

- **Ubuntu/Debian:**
  ```bash
  sudo apt-get update
  sudo apt-get install swi-prolog
  ```

### 3. Start the Game:
To start playing, simply type the following commands in the **SWI-Prolog** terminal:

```bash
swipl lab_escape.pl
```

```prolog
start.
```

You’ll be prompted with a description of your surroundings and given a set of actions to choose from. Type your action and press Enter to progress.

### Example:
```prolog
?- start.
You are in the meth lab. There's a door ahead and a security system blinking. What would you like to do?
> go_to_door.
You moved to the door. The security system seems active. What would you like to do?
> use(wire_cutters).
You successfully disarmed the security system!
```

### 4. Quitting the Game:
To exit the game, type `quit` when prompted for your action.

## Development
This project is written entirely in **Prolog** as part of an assignment for PARP lecture. The goal is to demonstrate how logical rules and game states can be modeled using Prolog’s rule-based structure.