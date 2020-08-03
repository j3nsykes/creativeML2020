// COCO_SSD Demo:
// Receive OSC messages from Runway
// List of classes: https://github.com/tensorflow/tfjs-models/blob/master/coco-ssd/src/classes.ts 

// Import OSC
import oscP5.*;
import netP5.*;

// Runway Host
String runwayHost = "127.0.0.1";

// Runway Port
int runwayPort = 57100; //Make sure this port number matches the one from Runway

OscP5 oscP5;
NetAddress myBroadcastLocation;

JSONObject data;
JSONArray objects;

JSONObject runwaySizes;
float servoX, servoY;
void setup() {
  size(600, 400);
  frameRate(25);
  OscProperties properties = new OscProperties();
  properties.setRemoteAddress("127.0.0.1", 57200);
  properties.setListeningPort(57200);
  properties.setDatagramSize(99999999);
  properties.setSRSP(OscProperties.ON);
  oscP5 = new OscP5(this, properties);

  // Use the localhost and the port 57100 that we define in Runway
  myBroadcastLocation = new NetAddress(runwayHost, runwayPort);

  connect();
  serialSetup();
  fill(255);
  stroke(255);
  
}

void draw() {
  background(0);
  noFill();
  stroke(0, 255, 0);

  drawBoundingBoxes();
}


// A function to draw detected object bounding boxes
void drawBoundingBoxes() {

  //println("Draw: " + frameCount);
  // Only if there are any humans detected
  if (data != null) {
    objects = data.getJSONArray("results");
    runwaySizes = data.getJSONObject("size");

    int runwayWidth = runwaySizes.getInt("width");
    int runwayHeight = runwaySizes.getInt("height");
    //println(runwayWidth + " x " + runwayHeight);


    for (int i = 0; i < objects.size(); i++) {
      JSONObject object = objects.getJSONObject(i);
      JSONArray boundingBox = object.getJSONArray("bbox");
      String objectClass = object.getString("class");
      float score = object.getFloat("score");


      float x = boundingBox.getFloat(0) * width/runwayWidth;
      float y = boundingBox.getFloat(1) * height/runwayHeight;
      float w = boundingBox.getFloat(2) * width/runwayWidth;
      float h = boundingBox.getFloat(3) * height/runwayHeight;

      pushMatrix();
      noFill();
      stroke(0, 255, 0);
      rect(x, y, w, h);
      text(objectClass, x, y + 20);
      text(score, x, y+40);
      popMatrix();

      //if I see a specific thing?
      String question="banana";
      if (objectClass.equals(question)) {
        pushMatrix();
        ellipseMode(CENTER);
        noFill();
        stroke(255, 0, 0);
        //ellipse(x, y, 30, 30);
        rect(x, y, w, h);
        text(objectClass, x, y + 20);
        text(score, x, y+40);
        ellipse(x+w/2,y+h/2,30,30); //center the dot
        popMatrix();

//send out to motor. 
        servoX=map(x, 0, width, 0, 180);
        servoY=map(y, 0, height, 0, 180);
    
        sendSerial();//send info to the motor
      }
    }
  }
}

void connect() {
  OscMessage m = new OscMessage("/server/connect");
  oscP5.send(m, myBroadcastLocation);
}

void disconnect() {
  OscMessage m = new OscMessage("/server/disconnect");
  oscP5.send(m, myBroadcastLocation);
}

void keyPressed() {
  switch(key) {
    case('c'):
    /* connect to Runway */
    connect();
    break;
    case('d'):
    /* disconnect from Runway */
    disconnect();
    break;
  }
}

// OSC Event: listens to data coming from Runway
void oscEvent(OscMessage theOscMessage) {
  if (!theOscMessage.addrPattern().equals("/data")) return;
  // The data is in a JSON string, so first we get the string value
  String dataString = theOscMessage.get(0).stringValue();

  // We then parse it as a JSONObject
  data = parseJSONObject(dataString);
  println(data);

  objects = data.getJSONArray("results");
}
