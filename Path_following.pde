void path_following() {

 int iter = 0;
 for (Ple_Agent pa: boids) {

  for (int i = 0; i < participants_loc[iter]; i++) {

   if (index_p[iter] < locations[iter].length) {
    String[] columns = split(locations[iter][index_p[iter]], ",");
    if (columns.length == 13) {
     float x = float(columns[11]);
     float y = float(columns[12]);
     float sounds_v = float(columns[2]);
     float dusts_v = float(columns[3]);
     float temps_v = float(columns[4]);
     float humidities_v = float(columns[5]);
     float lights_v = float(columns[6]);
     float biofeedbacks_v = float(columns[8]);


     sounds_v = sounds_v * 100;
     dusts_v = dusts_v * 100;
     temps_v = temps_v * 100;
     humidities_v = humidities_v * 100;
     lights_v = lights_v * 100;
     biofeedbacks_v = 10 + biofeedbacks_v * 100;
     // println(x, y);
     //update function from the string CSV stored into array - indexing

     parx[iter][index_p[iter]] = x;
     pary[iter][index_p[iter]] = y;
     index_p[iter] = (index_p[iter] + 1) % participants_loc[iter];
     int posv = (index_p[iter] + 1) % participants_loc[iter];
     // Fixed-size Markers on the Map
     Location participantsLoc = new Location(parx[iter][posv], pary[iter][posv]);
     // println(parx[pos], pary[pos]);
     ScreenPosition postp = map.getScreenPosition(participantsLoc);


     pa.loc.x = postp.x;
     pa.loc.y = postp.y;

     strokeWeight(1);
     stroke(150);



     //fill(255, 47, 5, 90);
     //noFill();


     if (sounds_path) {
      fill(101, 8, 255, 35);
      ellipse(postp.x, postp.y, sounds_v, sounds_v);

     }

     if (dusts_path) {
      fill(255, 139, 93, 70);
      ellipse(postp.x, postp.y, dusts_v, dusts_v);
     }


     if (temps_path) {
      fill(23, 255, 8, 60);
      ellipse(postp.x, postp.y, temps_v, temps_v);
     }


     if (humidities_path) {
      fill(255, 0, 0, 50);
      ellipse(postp.x, postp.y, humidities_v, humidities_v);
     }

     if (lights_path) {
      fill(8, 255, 191, 40);
      ellipse(postp.x, postp.y, lights_v, lights_v);
     }

     if (biofeedbacks_path) {
      fill(252, 255, 93, 70);
      ellipse(postp.x, postp.y, biofeedbacks_v, biofeedbacks_v);
     }
    }
   }
  }

  index_p[iter] = (index_p[iter] + 1) % participants_loc[iter]; //always add new value into x or y
  iter++;
 }

}




public void reset() {

  if (submit) {

   if (participant_number) {

    for (int iter = 0; iter < pop; iter++) {
     locations[iter] = loadStrings((participant_min) + ".csv");
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


   ellipseMode(CENTER);

   //initialize the arrayList
   boids = new ArrayList < Ple_Agent > ();
   for (int i = 0; i < pop; i++) {
    Vec3D v = new Vec3D(800, 1200, 0);
    Ple_Agent pa = new Ple_Agent(this, v);
    pa.initTail(10);
    boids.add(pa);
   }

  } //end of if submit
 } //end of reset
