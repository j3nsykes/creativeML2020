import processing.serial.*;

// Communication
Serial gPort;
int gPortNumber = 1; 
int gBaudRate = 115200;

// Sensor settings
int gMaxNumTouches = 5;
int gMaxTouchLocation = 3200;
int gMaxTouchSize = 7000;

// Graphics dimensions
// Preserve aspect ratio with real sensor
int gSensorHeight = 150;
int gSensorWidth = int(gSensorHeight * 4.7);
int gMargin = 10;

// Stored data
int[] gTouchLocations = new int[gMaxNumTouches];
int[] gTouchSizes = new int[gMaxNumTouches];
int gCurrentNumTouches = 0;
float displayLoc=0;
//void settings() {
//  size(gSensorWidth + 2*gMargin, gSensorHeight + 2*gMargin);
//}

void setupBar() {
  println("Available ports: ");
  printArray(Serial.list());

  String portName = Serial.list()[gPortNumber];

  println("Opening port " + portName);
  gPort = new Serial(this, portName, gBaudRate);
  gPort.bufferUntil('\n');
}

void drawBar() {
  // background(255);

  stroke(0);
  fill(230);
  rectMode(CORNERS);

  rect(gMargin, gMargin, gSensorWidth - gMargin, gSensorHeight - gMargin, 10);
  // rect(10, height-170, int(150 * 4.7), 150);

  for (int i = 0; i < gCurrentNumTouches; i++) {
    displayLoc = map(gTouchLocations[i], 0, gMaxTouchLocation, 0, gSensorWidth);
    float displaySize = map(gTouchSizes[i], 0, gMaxTouchSize, 
      gSensorHeight * 0.1, gSensorHeight * 1.2);

    noStroke();
    //fill(0, 0, 255);
    //fill(153,216,208);
    fill(232, 80, 91);
    ellipse(displayLoc + gMargin, gSensorHeight/2, displaySize, displaySize);
    //print(displayLoc);
  }
}

void serialEvent(Serial p) {
  // Trim whitespace off input string
  String inString = trim(p.readString());

  // Convert to array
  int[] values = int(split(inString, " "));
  int i;

  for (i = 0; i < values.length - 1; i += 2) {
    gTouchLocations[i/2] = values[i];
    gTouchSizes[i/2] = values[i + 1];

    if (i/2 >= gMaxNumTouches)
      break;
  }

  if (i < 2)
    gCurrentNumTouches = 0;
  else if (gTouchLocations[0] == 0 && gTouchSizes[0] == 0)
    gCurrentNumTouches = 0;
  else
    gCurrentNumTouches = i/2;
}
