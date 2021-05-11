# DFS-Maze-Generator
DFS maze generator writen in Java using Processing.

This maze will generate cells and add the cells to a grid list. The maze will generate by starting at a specified cell, and randomly choosing an unvisited cell neighbor. The wall will be removed between the two cells, and the current cell changes. Once there are no more neighbors to visit, the current cell will be backtracked until there is a cell with an existing unvisited neighbor. The maze will eventually backtrack to the first cell.
