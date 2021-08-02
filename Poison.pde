class Poison {//creatures die when they eat this instead
  

 
  int poison1_x;
  int poison1_y;

  int poison_id=0;

   public Poison() {
     poison1_x=int(random(0, width));
     poison1_y=int(random(0, height));
     square(poison1_x,poison1_y,10);//make square poison object 
    
   }

  void show()
  {
    square(poison1_x,poison1_y,10);
  }
  
  int poison_location_x()
   {
     return poison1_x;
   }
   
  int poison_location_y()
   {
     return poison1_y;
   }


   void set_poison_id(int poi_id)
  {
    poison_id=poi_id;
  }

  int get_poison_id()
  {

    return poison_id;
  }
}
