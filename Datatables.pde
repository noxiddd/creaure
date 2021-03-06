class DataTables//record of where everything is 
{
   int[][] creature_position_table=new int[20][2];//first number reference the object id, the second refereance its location
   int[][] food_position_table=new int[20][2];//basically x,y locations of all objects
   int[][] poison_position_table=new int[20][2];

   Creature[] creature=new Creature[20];//array of objects
   Food[] food=new Food[20];//array of food ojects
   Poison[] poison=new Poison[20];//array of poison objects
   
  int creatureCount=0;
  int foodCount=0;
  int poisonCount=0;


   int[] tempArray=new int[2];//holds x,y values to pass them to objects referecing this class


  public DataTables()   
   {
      

   }

  Creature spawnCreature()
  {
    Creature cr=new Creature();
    creatureCount++;
    creature[creatureCount-1]=cr;
    cr.set_creature_id(creatureCount-1);

    return cr;
  }

  Food spawnFood()//dcdsds
  {
    foodCount++;
    Food foo=new Food();   
    
    
    //println("foodcount: ", foodCount);
    food_position_table[foodCount-1][0]=foo.food_location_x();
    food_position_table[foodCount-1][1]=foo.food_location_y();
    foo.set_food_id(foodCount-1);
    println("foodCount spawn: "+foodCount);

   // append(food,foo);
    food[foodCount-1]=foo;
    return foo;

  }

  Poison spawnPoison()
  {
    Poison poi=new Poison();
    poisonCount++;
    poison[poisonCount-1]=poi;
    poison_position_table[poisonCount-1][0]=poi.poison_location_x();
    poison_position_table[poisonCount-1][1]=poi.poison_location_y();
    poi.set_poison_id(poisonCount-1);

    return poi;
  }



   void updateCreatureTable (int creatureID, int creature_location_x,int creature_location_y)
   {

     creature_position_table[creatureID][0]=creature_location_x;
     creature_position_table[creatureID][1]=creature_location_y;
   }


   void updateFoodTable (int foodID, int food_location_x,int food_location_y)
   {

     food_position_table[foodID][0]=food_location_x;
     food_position_table[foodID][1]=food_location_y;
   }


   void updatePoisonTable (int poisonID, int poison_location_x,int poison_location_y)
   {

     poison_position_table[poisonID][0]=poison_location_x;
     poison_position_table[poisonID][1]=poison_location_y;
   }


   int[] queryCreatureTable (int creatureID)
   {
     
     tempArray[0]=creature_position_table[creatureID][0];
     tempArray[1]=creature_position_table[creatureID][1];

     return tempArray;
   }
/*
    int[] queryFoodTable (int foodID)
   {
     
     tempArray[0]=food_position_table[foodID][0];
     tempArray[1]=food_position_table[foodID][1];

     return tempArray;
   }
   */
   Food getFoodObject(int foodid)
   {

     return food[foodid];
   }


    int[] queryPoisonTable (int poisonID) 
   {
     
     tempArray[0]=poison_position_table[poisonID][0];
     tempArray[1]=poison_position_table[poisonID][1];

     return	tempArray;
   }


   void move_creature(Creature cr)
   {
      float[] closest_food_location;
    
      closest_food_location=find_closest_food_and_poison(cr.get_creature_id());

    //  println("food location x:",food[0].food_location_x());

      println("food location y:",food[0].food_location_x());

      cr.move(food[(int)closest_food_location[0]].food_location_x(),food[(int)closest_food_location[0]].food_location_y());//closest_food_location[0][0] is the x positions and 1 is the y position, 2 is poison x position and 3 is poison y position

   }


   float[] find_closest_food_and_poison(int creature_id)
   {

     // float distance_to_foodpoison_temp_array[20][2];//store the distances to food from creature//position 0 is distance to food, and 1 is poison i.e distnace_foodpoison_temp_array[4][0] is the distance of food with id 4 from creature with id creature id  
      //float distance_to_poisons_temp_array[20][2];
      float[] distance_to_foodpoison_temp_array=new float[4];//food id and distance [0]/[1] and poison id and distnace [2]/[3]

      float[] food_distances_temp_array=new float[20];
      float[] poison_distances_temp_array=new float[20];

      float temp=0;

      float[] min_food_distance=new float[2];//min_food_distance[0] is food id, and min_food_distance[1] is the distance to that food object
      float[] min_poison_distance=new float[2];

      min_food_distance[1]=1000;//intialize to a large value so it enters the if condition in the loops
      min_poison_distance[1]=1000;


      for(int i =0; i<=foodCount-1;i++)
      {
          //distance_to_foodpoison_temp_array[i][0]=sqrt(sq(food_position_table[i][0]-creature_position_table[creatureID][0])+sq(food_position_table[i][1]-creature_position_table[creature_id][1]));
          temp=sqrt(sq(food_position_table[i][0]-creature_position_table[creature_id][0])+sq(food_position_table[i][1]-creature_position_table[creature_id][1]));
        // println("Temp dist: ", temp );
          if(temp<min_food_distance[1])
          {
            min_food_distance[0]=i;
            min_food_distance[1]=temp;
           // println("min_food_distance: ", min_food_distance[0]," numm ", min_food_distance[1]);

            //println("Reach 1");  
          }

      }
     // println("final min_food_distance[1]: ",min_food_distance[1]);
      for(int i =0; i<=poisonCount-1;i++)
      {
          temp=sqrt(sq(poison_position_table[i][0]-creature_position_table[creature_id][0])+sq(poison_position_table[i][1]-creature_position_table[creature_id][1]));
          if(temp<min_poison_distance[1])
          {
            min_poison_distance[0]=i;
            min_poison_distance[1]=temp;
          }
      }

       distance_to_foodpoison_temp_array[0]=min_food_distance[0];//closest food id
       distance_to_foodpoison_temp_array[1]=min_food_distance[1];//cloest food distance
       distance_to_foodpoison_temp_array[2]=min_poison_distance[0];//closest poison id
       distance_to_foodpoison_temp_array[3]=min_poison_distance[1];//closest poison distance

       //food_distances_temp_array=sort(food_distances_temp_array);
       //poison_distances_temp_array=sort(poison_distances_temp_array);
/*
       for(int y=0;y<=food.length-1;y++)
       {

          distance_to_foodpoison_temp_array[y][0]=food_distances_temp_array[y];
    
         distance_to_foodpoison_temp_array[y][1]=poison_distances_temp_array[y];
       }*/
     //   distance_to_foodpoison_temp_array=sort(distance_to_foodpoison_temp_array[]);

       println("closest+food_distance",distance_to_foodpoison_temp_array[0], distance_to_foodpoison_temp_array[1]);
       println("closest+poison_distance",distance_to_foodpoison_temp_array[2], distance_to_foodpoison_temp_array[3]);
           
      return distance_to_foodpoison_temp_array;//distance_to_foodpoison_temp_array

   }





}