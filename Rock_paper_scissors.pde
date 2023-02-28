ArrayList<Item> items;
boolean attract = false;
//if true items attracted to what they beat and repeled from what they lose to
//if false items move with random velocity
int size = 75;
int N = 75; //random(10,30);
int speed = 5;
float constant = 500; // force multiplier
static final int ROCK = 0;
static final int PAPER = 1;
static final int SCISSORS = 2;
PImage rock;
PImage paper;
PImage scissors;


void setup(){
  fullScreen();
  //size(500,500);
  rock = loadImage("rock.png");
  rock.resize(size,size);
  paper = loadImage("paper.png");
  paper.resize(size,size);
  scissors = loadImage("scissors.png");
  scissors.resize(size,size);
  imageMode(CENTER);
  
  
  items = new ArrayList<Item>();
  for (int i=0; i<N; i++){
    Item item = new Item (int(random(0,3)), 
                          new PVector(random(width),random(height)),
                          PVector.random2D().mult(speed));
    items.add(item);
  }
}




void draw(){
  background(0);
  
  for(Item i : items){
      i.update();
      i.show();
  }
  for(Item i : items){
    for (Item j : items){
      if(i != j){
        collide(i,j);
      }
    }
  }
  
}

void collide(Item i, Item j){
  
  PVector v = new PVector(j.pos.x - i.pos.x, j.pos.y - i.pos.y);
  if(v.mag() <= size){
    //return true;
    v.setMag(speed);
    i.vel = v.copy().mult(-1);
    j.vel = v.copy();
    
    changeType(i,j);
  }
  //return false;
}

void changeType(Item i, Item j){
  int a = i.type;
  int b = j.type;
  if(a==b) return;
  if(a==ROCK && b==PAPER)     i.type = PAPER;
  if(a==ROCK && b==SCISSORS)  j.type = ROCK;
  if(a==PAPER && b==ROCK)     j.type = PAPER;
  if(a==PAPER && b==SCISSORS) i.type = SCISSORS;
  if(a==SCISSORS && b==ROCK)  i.type = ROCK;
  if(a==SCISSORS && b==PAPER) j.type = SCISSORS;
}
