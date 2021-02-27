
int intial_creature_x=200;
int intial_creature_y=200;


//int intial_po_x=200;
//int intial_creature_y=200;

//PVector v1=new PVector(3  ,3);

Creature cr;
Food food;
Poison poison;
DataTables dataTables;



void setup() {
  size(640, 360);
 // colorMode(HSB, width, 100, height);
 // noStroke();
  background(0,0,0);
  
  dataTables=new DataTables();//create tables first
  //let Datatablse class handle creation of new objects to track
//  dataTables.updateCreatureTable(intial_creature_x ,intial_creature_y);  
  cr=dataTables.spawnCreature();
  food=dataTables.spawnFood();
  poison=dataTables.spawnPoison();
 // food=new Food();
//  poison=new Poison();

}

void draw() {
  background(0,0,0);
  stroke(255,255,255);
  food.show();
  poison.show();
  dataTables.move_creature(cr);//replace with update fution from datatables


 /*s
  if(cr.eat_ifinrange(poison.poison_location_x(),poison.poison_location_y())==true)
  {
    poison=new Poison();
    cr=new Creature(intial_creature_x,intial_creature_y);//creatture dies and is reborn
    //cr.evolve(); change creature randomly


  }*/
/*
  if (cr.eat_ifinrange(food.food_location_x(),food.food_location_y())==true)
  {
  	food=new Food();
  }
*/
  
 // delay(500);
  
  //point(300,300);
 
  
}
