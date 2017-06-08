public void initGUI() {

 controlP5 = new ControlP5(this);

 ControlGroup ctrl = controlP5.addGroup("menu", 10, 20, 55);
 ctrl.setColorLabel(color(255));
 ctrl.close();


 ArrayList < Toggle > tog = new ArrayList < Toggle > ();

 tog.add(controlP5.addToggle("sounds", sounds, 10, 150, 20, 20).setLabel("SOUND on/off"));
 tog.add(controlP5.addToggle("dusts", dusts, 10, 190, 20, 20).setLabel("DUST on/off"));
 tog.add(controlP5.addToggle("temps", temps, 10, 230, 20, 20).setLabel("TEMPERATURE on/off"));
 tog.add(controlP5.addToggle("humidities", humidities, 10, 270, 20, 20).setLabel("RELATIVE HUMIDITY on/off"));
 tog.add(controlP5.addToggle("lights", lights, 10, 320, 20, 20).setLabel("LIGHT on/off"));
 tog.add(controlP5.addToggle("biofeedbacks", biofeedbacks, 10, 360, 20, 20).setLabel("EDA on/off"));
 tog.add(controlP5.addToggle("participant_number", participant_number, 10, 80, 20, 20).setLabel("Select participant"));
 tog.add(controlP5.addToggle("submit", submit, 290, 80, 20, 20).setLabel("Submit"));



 tog.add(controlP5.addToggle("sounds_path", sounds_path, 120, 150, 20, 20).setLabel("SOUND_PATH on/off"));
 tog.add(controlP5.addToggle("dusts_path", dusts_path, 120, 190, 20, 20).setLabel("DUST_PATH on/off"));
 tog.add(controlP5.addToggle("temps_path", temps_path, 120, 230, 20, 20).setLabel("TEMPERATURE_PATH on/off"));
 tog.add(controlP5.addToggle("humidities_path", humidities_path, 120, 270, 20, 20).setLabel("RELATIVE HUMIDITY_PATH on/off"));
 tog.add(controlP5.addToggle("lights_path", lights_path, 120, 320, 20, 20).setLabel("LIGHT_PATH on/off"));
 tog.add(controlP5.addToggle("biofeedbacks_path", biofeedbacks_path, 120, 360, 20, 20).setLabel("EDA_PATH on/off"));

 
 /*controlP5.addTextfield("Participant_no")
      .setPosition(10,40)
      .setSize(40,20)
      .setFont(createFont("arial",12))
      .setAutoClear(false);
        
 controlP5.addBang("Submit")
      .setPosition(180,40)
      .setSize(40,40)
      .getCaptionLabel().align(ControlP5.CENTER, ControlP5.CENTER);*/



 range = controlP5.addRange("Participant Number")
  // disable broadcasting since setRange and setRangeValues will trigger an event
  .setBroadcast(false)
  .setPosition(80, 100)
  .setSize(120, 20)
  .setHandleSize(20)
  .setRange(1, 21)
  // .setRangeValues(1,31)
  .setLowValue(1)
  .setHighValue(21)
  // after the initialization we turn broadcast back on again
  .setBroadcast(true)
  .setColorForeground(color(162,153,125))
  .setColorBackground(color(162,153,125));


 for (int i = 0; i < tog.size(); i++) {
  Toggle t = tog.get(i);
  t.setGroup(ctrl);
  //t.setId(i);
 }

 controlP5.setAutoDraw(false);
}

public void gui() {

 controlP5.draw(); //draw GUI! 
}


/*void Submit(){
  print("Typed #");
  particupant_selected = controlP5.get(Textfield.class,"Participant_no").getText();
  print("Recieve_particiant :---------------"+particupant_selected);
}*/
  
  
void controlEvent(ControlEvent theControlEvent) {
 if (theControlEvent.isFrom("Participant Number")) {
  // min and max values are stored in an array.
  // access this array with controller().arrayValue().
  // min is at index 0, max is at index 1.
  participant_min = int(theControlEvent.getController().getArrayValue(0));
  participant_max = int(theControlEvent.getController().getArrayValue(1));
  // println("range update, done.");
 }
}
