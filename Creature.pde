class Creature {
  int current_location_x;
  int current_location_y;

  int movement_bias_x=0;//to find food
  int movement_bias_y=0;
   public Creature(int x, int y) {
     
     triangle(x,y,x-10,y-15,x+10,y-15);
     current_location_y=y;
     current_location_x=x;
   }

  void move(int food_locationx,int food_locationy)
  {
    sense_food(food_locationx,food_locationy);
    
    int x_move=int(random(-10,10));
    int y_move=int(random(-10,10));
    
    current_location_y=y_move+current_location_y+movement_bias_y;
    current_location_x=x_move+current_location_x+movement_bias_x;//add random motion

    println("movement_bias_x: "+movement_bias_x+"  "+"movement_bias_y: "+movement_bias_y);
    //println(" "+movement_bias_y);

    confinement_to_screen(current_location_x,current_location_y);

    triangle(current_location_x,current_location_y,current_location_x-10,current_location_y-15,current_location_x+10,current_location_y-15);
  }
  
  void sense_food(int food_x,int food_y)
  {
     if (food_x>current_location_x)
     {
      //movement_bias_x++;
      movement_bias_x=1;
     }
     else{
       //movement_bias_x--;
       movement_bias_x=-1;
     }

     if(food_y>current_location_y)
     {
      //movement_bias_y++;
      movement_bias_y=1;
     }
     else {
       //movement_bias_y--; 
       movement_bias_y=-1;
     }
  }

  void confinement_to_screen(int xx,int yy)
  {
      if(xx<0)
      {
        current_location_x=0;
      }

      if(xx>width)
      {
        current_location_x=width;
      }


      if(yy<0)
      {
        current_location_y=0;
      }

      if(yy>height)
      {
        current_location_y=height;
      }

  }

  Boolean eat_ifinrange(int f_x,int f_y)  
  {//locaiton of food f_x, f_y//pass current location of food to this functions to determine if creature can eat

    if(abs(f_x-current_location_x)<2 && abs(f_y-current_location_y)<2)
    {
        return true;
    }
     
     return false;

  }
}
