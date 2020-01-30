class Food
{
  
  int food1_x;
  int food1_y;
  
   public Food()
   {
     food1_x=int(random(0,width));
     food1_y=int(random(0,height));
     circle(food1_x,food1_y,10);
   }
   
   void show()
   {
     circle(food1_x,food1_y,10);
   }
   
   int food_location_x()
   {
     return food1_x;
   }
   
    int food_location_y()
   {
     return food1_y;
   }

  //void food_eaten()



}

