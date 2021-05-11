// DFS backtracking maze generation
// James Benagh

/* This maze will generate cells and add the cells to a grid list. The maze will generate by 
   starting at a specified cell, and randomly choosing an unvisited cell neighbor. 
   The wall will be removed between the two cells, and the current cell changes. Once there
   are no more neighbors to visit, the current cell will be backtracked until there is a cell with an
   existing unvisited neighbor. The maze will eventually backtrack to the first cell. */
int cols, rows;
int w = 20;
ArrayList<Cell> grid = new ArrayList<Cell>();
ArrayList<Cell> stack = new ArrayList<Cell>();

Cell current;

void setup() {
  size(500, 500);
  cols = floor(width/w);
  rows = floor(height/w);
  //Add a cell for number of rows and columns, add it to grid list
  for (int j = 0; j < rows; j++) {
    for (int i = 0; i < cols; i++) {
      Cell cell = new Cell(i, j);
      grid.add(cell);
    }
  }
  //Start at the first cell in grid list
  current = grid.get(0);
}

void draw() {
  background(0);
  //Show the grid's walls
  for (int i = 0; i < grid.size(); i++) {
    grid.get(i).show();
  }
  //Highlight current cell and make current cell visited
  current.visited = true;
  current.highlight();
  
  //Check neighbors of current cell, get next cell
  Cell next = current.checkNeighbors();
  if (next != null) {
    next.visited = true;

    //Add current cell to stack
    stack.add(current);

    //Remove walls between current and next cell
    removeWalls(current, next);

    //Change current cell to next cell
    current = next;
  } 
  
  //If there are no neighbors, remove top of stack to backtrack the current cell
  else if (stack.size() > 0) {
    current = stack.remove(stack.size()-1);
  }
}

//Used to check neighbors of cells
int index(int i, int j) {
  if (i < 0 || j < 0 || i > cols-1 || j > rows-1) {
    return 0;
  }
  return i + j * cols;
}

//Remove the wall between two cells
void removeWalls(Cell a, Cell b) {
  int x = a.i - b.i;
  if (x == 1) {
    a.walls[3] = false;
    b.walls[1] = false;
  } 
  else if (x == -1) {
    a.walls[1] = false;
    b.walls[3] = false;
  }
  int y = a.j - b.j;
  if (y == 1) {
    a.walls[0] = false;
    b.walls[2] = false;
  } 
  else if (y == -1) {
    a.walls[2] = false;
    b.walls[0] = false;
  }
}

// Cell class
class Cell {
  int i, j;
  boolean[] walls = {true, true, true, true};
  boolean visited = false;
  
  Cell(int ii, int jj) {
    i = ii;
    j = jj;
  }

  Cell checkNeighbors() {
    ArrayList<Cell> neighbors = new ArrayList<Cell>();

    Cell top    = grid.get(index(i, j-1));
    Cell right  = grid.get(index(i+1, j));
    Cell bottom = grid.get(index(i, j+1));
    Cell left   = grid.get(index(i-1, j));

    if (top != null && !top.visited) {
      neighbors.add(top);
    }
    if (right != null && !right.visited) {
      neighbors.add(right);
    }
    if (bottom != null && !bottom.visited) {
      neighbors.add(bottom);
    }
    if (left != null && !left.visited) {
      neighbors.add(left);
    }

    if (neighbors.size() > 0) {
      int r = floor(random(0, neighbors.size()));
      return neighbors.get(r);
    } 
    else {
      return null;
    }
  }
  
  void highlight() {
    int x = this.i*w;
    int y = this.j*w;
    noStroke();
    fill(255, 0, 0);
    rect(x, y, w, w);

  }

  void show() {
    int x = this.i*w;
    int y = this.j*w;
    stroke(255);
    if (this.walls[0]) {
      line(x, y, x + w, y);
    }
    if (this.walls[1]) {
      line(x + w, y, x + w, y + w);
    }
    if (this.walls[2]) {
      line(x + w, y + w, x, y + w);
    }
    if (this.walls[3]) {
      line(x, y + w, x, y);
    }

    if (this.visited) {
      noStroke();
      fill(255, 255, 255, 100);
      rect(x, y, w, w);
    }
  }
}
