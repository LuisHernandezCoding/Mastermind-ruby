# Mastermind-ruby
In this project, i made a Mastermind game that can be executed and played from console, its for 1 player vs the computer

The main goal is to put into practice main concepts from Object Oriented Programming (OOT) but mostly classes and their attributes.

###### Definition

> Mastermind or Master Mind is a code-breaking game for two players. It resembles an earlier pencil and paper game called Bulls and Cows that may date back a century.

###### Behavior

- The first player, the code maker (in this case the computer), chooses a pattern of code pegs. 
- Duplicates and blanks are allowed depending on the game mode. 
- The second player, the codebreaker (the real player), tries to guess the pattern, in both order and color. 
- There is a difficulty parameter so it can change the code size from 4 at beginner up to 8
- Each guess is made by placing a row of code pegs on the decoding board. 
- Once placed, the code maker provides feedback by answering how much guess are exact correct, and how much are color correct

![Game Preview](./assets/preview.png?raw=true "Game Preview")

## Built With

- Ruby v 3.1.2p20

## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

- Ruby v 3.1.2p20

### Setup

- Make sure you have Ruby installed on your machine
- Clone this repository with
```bash
git clone git@github.com:LuisHernandezCoding/Mastermind-ruby.git
```

### Usage

- Run the program on your local machine with 

```bash
ruby bin/main.rb
```

## Author

👤 **Luis Hernandez**

- GitHub: [@LuisHernandezCoding]

## Credits

- Project made mainly for 
[The Odin Project](https://www.theodinproject.com)
[(Full stack ruby on rails)](https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby)
[Mastermind](https://www.theodinproject.com/lessons/ruby-mastermind)