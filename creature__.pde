
int intial_creature_x=200;
int intial_creature_y=200;


//int intial_po_x=200;
//int intial_creature_y=200;

//PVector v1=new PVector(3  ,3);

Creature cr;
Food food;
Poison poison;
DataTables dataTables;

int foodnum=6; //intial number of food


void setup() {
  size(640, 360);
 // colorMode(HSB, width, 100, height);
 // noStroke();
  background(0,0,0);
  
  dataTables=new DataTables();//create tables first
  //let Datatablse class handle creation of new objects to track
//  dataTables.updateCreatureTable(intial_creature_x ,intial_creature_y);  
  cr=dataTables.spawnCreature();
  spawnNumFood(foodnum);
  spawnNumPoison(foodnum-3);

}

void draw() {
  background(0,0,0);
  stroke(255,255,255);
  showFood();
  showPoison();
 // poison.show();
  dataTables.move_creature(cr);//replace with update fution from datatables


  
}


void spawnNumFood(int fnum)
{
  for(int i=0;i<=fnum-1;i++)
  {
    dataTables.spawnFood();
  }

}

void spawnNumPoison(int pnum)
{
  for(int i=0;i<=pnum-1;i++)
  {
    dataTables.spawnPoison();
  }

}

void showFood()
{ Food f;
  // println("foodobjects length",dataTables.food.length);
   for(int i=0;i<=dataTables.foodCount-1;i++)
   {

      f=dataTables.getFoodObject(i);
      //println("FoodID:",f.get_food_id());
      circle(f.food1_x,f.food1_y,10);
   }

}


void showPoison()
{
  Poison p;
  for(int i=0;i<=dataTables.poisonCount-1;i++)
   {

      p=dataTables.getPoisonObject(i);
      //println("FoodID:",f.get_food_id());
      square(p.poison1_x,p.poison1_y,10);
   }  

}