float baseH = 60;
float basew = 10;
float armL1 = 50;
float armL2 = 40;
float handL = 7;
float armW1 = 9;
float armW2 = 8;
float handw = 7;
float angle0 = 0;
float angle1 = 0;
float angle2 = 0;
float angle3 = 0;
float dif0 = 0.8;
float dif1 = 0.8;
float dif2 = 0.8;
float dif3 = 0.5;
float dif4 = 0.4;


void setup(){
  size(1200, 800, P3D);
  //background(255);
  
  camera(100, 100, 100, 0, 0, 0, 0, 0, -1);
  
  noStroke();  
}

void draw(){
  
  background(255);
  if(keyPressed){
    
    //rotate base
    if(key == 'a'){
      angle0 = angle0 + dif0;
    }
    if(key == 'A'){
      angle0 = angle0 - dif0;
    }
    
    //rotate arm1
    if(key == 'b'){
      if(angle1 <= 180 ){
        angle1 = angle1 + dif1;
      }
    }
    if(key == 'B'){
      if(angle1 >= 0 ){
        angle1 = angle1 - dif1;
      }
    }
    
    //rotate arm2
    if(key == 'c'){
      if(angle2 >= -180 ){
      angle2 = angle2 - dif2;
      }
    }
    if(key == 'C'){
      if(angle2 <= 0 ){
      angle2 = angle2 + dif2;
      }
    }
    
    //rotate hand
    if(key == 'd'){
      angle3 = angle3 + dif3;
    }
    if(key == 'D'){
      angle3 = angle3 - dif3;
    }
    
    //return to initial point
    if (key == 'e'){
      if(angle0 >=0 ){
        angle0 = angle0 - dif4;
        }else{
        angle0 = angle0 + dif4;
        } 
      if(angle1 >=0 ){
        angle1 = angle1 - dif4;
        }else{
        angle1 = angle1 + dif4;
        } 
      if(angle2 >=0 ){
        angle2 = angle2 - dif4;
        }else{
        angle2 = angle2 + dif4;
        } 
      if(angle0 >=0 ){
        angle3 = angle3 - dif4;
        }else{
        angle3 = angle3 + dif4;
        } 
    }
  }
  
  //base
  rotateZ(radians(angle0));
  //go to center of base
  translate(0,0,baseH/2);
  fill(#4D4E50);
  box(basew,basew,baseH);
  
  //1st link
  //go to 1st joint
  translate(0,0,baseH/2-armW1/2);
  rotateX(radians(angle1));
  //go to center of 1st joint
  translate(0,armL1/2-basew/2,-0.5);
  fill(#66686A);
  box(armW1,armL1,armW1);
  
  //2nd link
  //go to 2nd joint
  translate(0,armL1/2+basew/2-armW2,0);
  rotateX(radians(-angle2));
  //go to center of 2nd joint
  translate(0,0,-armL2/2+basew/2);
  fill(#7F8283);
  box(armW2,armW2,-armL2);
  
  //hand
  //go to hand joint
  translate(0,0,-armL2/2-handL/2);
  rotateZ(radians(angle3));
  fill(#9A9C9D);
  box(handw,handw,handL);

}
