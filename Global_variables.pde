import de.fhpotsdam.unfolding.mapdisplay.*;
import de.fhpotsdam.unfolding.utils.*;
import de.fhpotsdam.unfolding.marker.*;
import de.fhpotsdam.unfolding.tiles.*;
import de.fhpotsdam.unfolding.interactions.*;
import de.fhpotsdam.unfolding.ui.*;
import de.fhpotsdam.unfolding.*;
import de.fhpotsdam.unfolding.core.*;
import de.fhpotsdam.unfolding.mapdisplay.shaders.*;
import de.fhpotsdam.unfolding.data.*;
import de.fhpotsdam.unfolding.geo.*;
import de.fhpotsdam.unfolding.texture.*;
import de.fhpotsdam.unfolding.events.*;
import de.fhpotsdam.utils.*;
import de.fhpotsdam.unfolding.providers.*;
import java.util.List;
import plethora.core.*;
import toxi.processing.*;
import toxi.geom.*;
import codeanticode.glgraphics.*;
import processing.opengl.*;
import controlP5.*;
import processing.pdf.*;

//UI parts
UnfoldingMap map;
BarScaleUI barScale;
CompassUI compass;
public ControlP5 controlP5; //GUI class
public Range range;


//buttons booleans
boolean sounds = true;
boolean dusts = false;
boolean temps = false;
boolean humidities = false;
boolean lights = false;
boolean biofeedbacks = false;


boolean sounds_path = false;
boolean dusts_path = false;
boolean temps_path = false;
boolean humidities_path = false;
boolean lights_path = false;
boolean biofeedbacks_path = false;

boolean participant_number=false;
boolean submit=false;
boolean video = false;

//String textValue = "";

int totalparticipant = 21;
int participant_min=totalparticipant;
int participant_max=totalparticipant;

//String particupant_selected;

Location locationWiedekon = new Location (47.372837f, 8.515858f); //initial Map location
int checkpoints = 14;
int [] participants_loc = new int[totalparticipant];
/* int participants_loc = 2;
int participants_loc2 = 1700;
int participants_loc3 = 1238; */

float [] posx = new float[checkpoints];
float [] posy = new float[checkpoints];
/* float [] parx = new float[participants_loc];
float [] pary = new float[participants_loc];
float [] parx2 = new float[participants_loc2];
float [] pary2 = new float[participants_loc2];
float [] parx3 = new float[participants_loc3];
float [] pary3 = new float[participants_loc3]; */

float [][] parx = new float[totalparticipant][];
float [][] pary = new float[totalparticipant][];


String[] lines; //checkpoints
/* String[] locations; //location of participants
String[] locations2; //location of participants
String[] locations3; //location of participants */
int index=0;
/* int index_p=0;
int index_p2=0;
int index_p3=0; */
int[] index_p = new int[totalparticipant];
int [][] colorlist = new int[totalparticipant][totalparticipant];
String [][] locations = new String[totalparticipant][];

ArrayList<Ple_Agent> boids;
int pop = totalparticipant;
boolean showTrails;
boolean showDir; 






