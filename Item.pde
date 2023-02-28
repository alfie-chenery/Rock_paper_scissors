class Item{
  int type; //0 = rock, 1 = paper, 2 = scissors
  PVector pos;
  PVector vel;
  PVector acc;
  
  //constructor
  Item(int t, PVector p, PVector v){
    type = t;
    pos = p;
    vel = v;
    acc = new PVector(0,0);
  }
  
  void update(){
    
    //if (acc.mag()>1){
    //  acc.setMag(1); 
    //}
    
    vel.add(acc);
    pos.add(vel);
    acc.mult(0);
    
    if(pos.x < size/2){
      pos.x = size/2;
      vel.x *= -1;
    }
    if(pos.x > width - size/2){
      pos.x = width - size/2;
      vel.x *= -1;
    }
    if(pos.y < size/2){
      pos.y = size/2;
      vel.y *= -1;
    }
    if(pos.y > height - size/2){
      pos.y = height - size/2;
      vel.y *= -1;
    }
  }

  
  void show(){
    if(type == ROCK){
      image(rock,pos.x,pos.y);
    }else if (type == PAPER) {
      image(paper,pos.x,pos.y);
    }else if (type == SCISSORS) {
      image(scissors,pos.x,pos.y);
    }
  }
}
