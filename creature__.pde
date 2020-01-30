
int x=200;
int y=200;

//PVector v1=new PVector(3  ,3);

Creature cr;
Food food;

void setup() {
  size(640, 360);
 // colorMode(HSB, width, 100, height);
 // noStroke();
  background(0,0,0);
  cr=new Creature(x,y);
  food=new Food();
}

void draw() {
  background(0,0,0);
  stroke(255,255,255);
  food.show();
  cr.move(food.food_location_x(),food.food_location_y());

  
 // delay(500);
  
  //point(300,300);
 
  
}
