# Memory-Puzzle-Game
This repository contains a Memory Puzzle game written in Ruby. 

## What is it?
A player must select a position on a board (E.g. row,column => 0,2). The board will reveal the card at this position. Then the player must select another position on the board that matches the previously selected card. If the positions match, a both cards will remain face up. If not then the cards are flipped face down and the player must try again. The game ends once the player has matched all the cards.

## Gameplay
![alt-text](https://github.com/ranveer4744/Memory-Puzzle-Game/blob/master/memory.gif)

## How does it work?
I created 3 classes (Board, Card, and Game). The Card class allows you to flip the card and view the card value. The Board class creates the grid and places cards on it. It also reveals cards and renders the board. The Game class is what the user will interact with. This class calls methods from both the Board and Card class to make the game playable. Additionally, this class displays the U.I. for the player.

## How to play?
Download the Game.rb, Card.rb, and Board.rb. Place them within the same folder. Navigate to the files via Terminal, and enter "ruby Game.rb". Have fun!
