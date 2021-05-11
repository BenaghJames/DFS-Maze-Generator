# DFS-Maze-Generator
DFS maze generator writen in Java using Processing.

Utilizing a Depth-first-search algorithm, this program will use cell objects with walls to create a maze. The algorithm will randomly visit neighboring cells and remove the walls between these cells to create pathways. Once the program is at a cell that is unable to find a neighbor that has not been visited, the algorithm will backtrack through cells previously visited until it finds one with a neighbor that it can visit. The program will run until it backtracks to the original starting cell.

![Alt Text](https://media.giphy.com/media/XBgYNS5FrEOSBjOfrg/giphy.gif)
