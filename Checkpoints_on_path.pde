void checkpoints() {
 for (int i = 0; i < checkpoints; i++) {
  if (index < lines.length) {
   String[] pieces = split(lines[index], ",");
   if (pieces.length == 2) {
    float y = float(pieces[0]);
    float x = float(pieces[1]);
    //update function from the string CSV stored into array - indexing
    posx[index] = x;
    posy[index] = y;
    index = (index + 1) % checkpoints;
   }
   int pos = (index + 1) % checkpoints;
   // Fixed-size Markers on the Map
   //checkpoints locations
   Location checkPoints = new Location(posx[pos], posy[pos]);
   ScreenPosition post = map.getScreenPosition(checkPoints);
   //just display checkpoints 
   noStroke();
   fill(#EA9100);
   ellipse(post.x, post.y, 15, 15);

  }
 }
}
