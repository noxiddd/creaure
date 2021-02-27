class Creature {
  int current_location_x;
  int current_location_y;

  int movement_bias_x=0;//to find food
  int movement_bias_y=0;

  int movement_bias_x_hold=0;
  int movement_biad_y_hold=0;

  int creature_id=0;


   public Creature() {

     current_location_x=int(random(0,width));
     current_location_y=int(random(0,height));
     
     triangle(current_location_x,current_location_y,current_location_x-10,current_location_y-15,current_location_x+10,current_location_y-15);
     


   }

  void move(int food_locationx, int food_locationy)
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
  {//only sense food more less than 20 away
    if (abs(food_x-current_location_x)<=20 && abs(food_y-current_location_y)<=20)
    {

    movement_bias_x=movement_bias_x_hold;//allows creature to remember its movement speed after sensoring
    movement_bias_y=movement_biad_y_hold;

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
    else 
    {

      movement_biad_y_hold=movement_bias_y;
      movement_bias_x_hold=movement_bias_x;
      
      movement_bias_y=0;
      movement_bias_x=0;
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


  void evolve()//randomly choose a trait to evolve
  {
   int i=(int) random(0, 10);//cate outout as integer
    switch (i) {
      case 0: 
        move_faster_evolution();
      break;
 
      case 1: 
        move_slower_evolution();
      break;

      case 2: 
        move_faster_evolution();
      break;



      
    }
  
  }


  void move_faster_evolution()
  {
    movement_bias_x=movement_bias_x+1;
    movement_bias_y=movement_bias_y+1;
  }


  void move_slower_evolution()  //if we go below zero its just moving fater in the other directon,
                                //creature might be stick when it hits zero
  {

    if(movement_bias_x>0)
      {
        movement_bias_x=movement_bias_x-1;
      }
      else if(movement_bias_y<0)
      {
        movement_bias_x=movement_bias_x+1;
      }

    if(movement_bias_y>0)
      {  
        movement_bias_y=movement_bias_y-1;
      }
      else if(movement_bias_x<0)
      {
        movement_bias_y=movement_bias_y+1;
      }
  }

  void set_creature_id(int cr_id)
  {
    creature_id=cr_id;
  }

  int get_creature_id()
  {

    return creature_id;
  }

  int get_current_location_x()
  {
    return current_location_x;
  }

  int get_current_location_y()
  {
    return current_location_y;
  }


}
