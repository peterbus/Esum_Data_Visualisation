

boolean record = false;



void setup() {


 size(900, 600, P3D);


 frameRate(30);
 map = new UnfoldingMap(this, new Microsoft.AerialProvider());

 map.zoomToLevel(19);
 map.panTo(locationWiedekon);
 map.setZoomRange(15, 20);
 map.setPanningRestriction(locationWiedekon, 3);
 MapUtils.createDefaultEventDispatcher(this, map);

 PImage compassImg = loadImage("ui/compass_white.png");
 compass = new CompassUI(this, map, compassImg, width - 60, 100);

 // compass = new CompassUI(this,map);

 barScale = new BarScaleUI(this, map, width - 70, 20);
 PFont myFont = createFont("Monospaced", 12);
 barScale.setStyle(color(250, 255, 255, 100), 3, 0, myFont);


 lines = loadStrings("checkpoints.csv"); //positions
 

 //Here we are reading the locations of the participant locations

 if (participant_number) {
  for (int iter = 0; iter < pop; iter++) {
   locations[iter] = loadStrings((participant_min) + ".csv");
   //locations[iter] = loadStrings((particupant_selected) + ".csv");//only for selected participant
   participants_loc[iter] = locations[iter].length;
   //println(participants_loc[iter]);
   parx[iter] = new float[participants_loc[iter]];
   pary[iter] = new float[participants_loc[iter]];
   index_p[iter] = 0;
   
   //and colour 
   colorlist[iter][0] = (int) random(50, 255);
  }
 } else {
  for (int iter = 0; iter < pop; iter++) {
   locations[iter] = loadStrings((iter + 1) + ".csv");
   participants_loc[iter] = locations[iter].length;
   //println(participants_loc[iter]);
   parx[iter] = new float[participants_loc[iter]];
   pary[iter] = new float[participants_loc[iter]];
   index_p[iter] = 0;

   //and colour 
   colorlist[iter][0] = (int) random(50, 255);
  }
 }


 /* locations = loadStrings("01.csv"); //positions
 locations2 = loadStrings("02.csv"); //positions
 locations3 = loadStrings("03.csv"); //positions */



 ellipseMode(CENTER);

 //initialize the arrayList
 boids = new ArrayList < Ple_Agent > ();
 for (int i = 0; i < pop; i++) {
  Vec3D v = new Vec3D(800, 1200, 0);
  Ple_Agent pa = new Ple_Agent(this, v);
  pa.initTail(10);
  boids.add(pa);

 }
 initGUI();

}



void draw() {
 
 map.draw();
 filter(GRAY);
 checkpoints();
 path_following();


 int iter = 0;
 for (Ple_Agent pa: boids) {

  //  pa.updateTail(1);
  //  pa.displayTailPoints(249, 134, 255, 70, 5, 116, 60, 234, 95, 10);
  pa.setMaxspeed(1);
  pa.update();
  pa.dropTrail(25, 800);
  pa.drawTrail(15);

 
  textSize(20);
  if(participant_number){
    text("Participant in display: "+participant_min, 20, 60);
    println("Participant in display: "+participant_min +" total points : "+locations[iter].length);
  }else{
    text("Participant in display: All", 20, 60);
    println("Participant in display: "+iter +" total points : "+locations[iter].length);
  }
  
  for (int i = 0; i < participants_loc[iter]; i++) {
   if (index_p[iter] < locations[iter].length) {
    String[] values = split(locations[iter][index_p[iter]], ",");
    if (values.length == 13) {

     float sound = (float(values[2])) * 100;
     float dust = (float(values[3])) * 100;
     float temp = (float(values[4])) * 100;
     float humidity = (float(values[5])) * 100;
     float light = (float(values[6])) * 100;
     float biofeedback = 10 + (float(values[8])) * 100;

     if (sounds) {
      strokeWeight(sound);
      noFill();
      stroke(101, 8, 255, 35);
      pa.displayPoint();
     }

     if (dusts) {
      strokeWeight(dust);
      stroke(255, 139, 93, 70);
      pa.displayPoint();
     }
     if (temps) {
      strokeWeight(temp);
      stroke(23, 255, 8, 60);
      pa.displayPoint();
     }

     if (humidities) {
      strokeWeight(humidity);
      stroke(255, 0, 0, 50);
      pa.displayPoint();
     }
     if (lights) {
      strokeWeight(light);
      stroke(8, 250, 191, 40);
      pa.displayPoint();
     }
     if (biofeedbacks) {
      strokeWeight(biofeedback);
      stroke(252, 255, 93, 70);
      pa.displayPoint();
     }
     //  stroke(colorlist[iter][0], colorlist[iter][1], colorlist[iter++][2]);
     // pa.displayPoint();
     //pa.displayDir(pa.vel.magnitude()*3);
    }
   }
  }
  
  barScale.draw();
  compass.draw();
  gui();
  reset(); 
  iter++;//This is required to increase participants value         
 }
     if (video) saveVideoFrame();     
}

public void keyPressed() {
 if (key == 'r')
  map.rotate(0.05f);
 if (key == 'l')
  map.rotate(-0.05f);

 if (key == 'f' || key == 'F') {
  saveFrame("data/image-####.jpg");
  println("JPG generated succsessfully");
  record = true;
 }
 
 if (key=='v') video = !video;
}
