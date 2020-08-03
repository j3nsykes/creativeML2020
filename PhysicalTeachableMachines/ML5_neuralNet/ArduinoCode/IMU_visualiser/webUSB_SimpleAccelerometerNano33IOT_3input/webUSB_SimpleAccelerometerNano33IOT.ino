/*
  Arduino LSM6DS3 - Simple Accelerometer

  This example reads the acceleration values from the LSM6DS3
  sensor and continuously prints them to the Serial Monitor
  or Serial Plotter.

  The circuit:
  - Arduino Uno WiFi Rev 2 or Arduino Nano 33 IoT

  created 10 Jul 2019
  by Riccardo Rizzo

  This example code is in the public domain.
*/
#include <WebUSB.h>
#include <Wire.h>
#include <Arduino_LSM6DS3.h>

WebUSB WebUSBSerial(1 /* https:// */, "editor.p5js.org/jen_GSA/sketches/_UTpiD3sM");

#define Serial WebUSBSerial

void setup() {
  Serial.begin(9600);
  Serial.write("Sketch begins.\r\n");
  Serial.flush();
  
  while (!Serial);

  if (!IMU.begin()) {
    //Serial.println("Failed to initialize IMU!");

    while (1);
  }

//  Serial.print("Accelerometer sample rate = ");
//  Serial.print(IMU.accelerationSampleRate());
//  Serial.println(" Hz");
//  Serial.println();
//  Serial.println("Acceleration in G's");
//  Serial.println("X\tY\tZ");
}

void loop() {
  float x, y, z;

  if (IMU.accelerationAvailable()) {
    IMU.readAcceleration(x, y, z);

    //    Serial.print(x);
    //    Serial.print('\t');
    //    Serial.print(y);
    //    Serial.print('\t');
    //    Serial.println(z);

//more efficient 
    String json;
    json = "{\"tX\":";
    json = json + x;
    json = json + ";\"tY\":";
    json = json + y;
    json = json + ";\"tZ\":";
    json = json + z;
    json = json + "}";

    Serial.println(json);
    Serial.flush();
  }
}
