// Copyright (C) 2019 RunwayML Examples
// 
// This file is part of RunwayML Examples.
// 
// Runway-Examples is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// Runway-Examples is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with RunwayML.  If not, see <http://www.gnu.org/licenses/>.
// 
// ===========================================================================

// RUNWAYML
// www.runwayml.com
// YOLO version adapted from
// COCO-SSD StreetView Demo:
// Loads a csv file exported by Runway
// Made by jpyepez
//CSV class by Paul Maguire for YOLO model originally
// Adapted to fit PoseNet data export by Jen Sykes.

void setUpPOSE(String _fileName, int _n) {
  pose = new POSE(_fileName, _n);
  isFirstFrame = true;
}

void updatePOSE() {
  pose.display(movie.time());
}

class POSE {

  Table POSETable;
  TableRow lookup;
  TableRow current;

  int maxIdx; //how many poses detected/ See the function in setup it is parsed into here. 
  //store connections
  float[] connectionsX;
  float [] connectionsY;
  int maxKeyPoints=16;
  
  POSE(String _fileName, int maxIdx_) {
    // YOLO SSD data
    POSETable = loadTable(_fileName, "header");
    maxIdx = maxIdx_;
    connectionsX=new float[maxKeyPoints];
    connectionsY=new float[maxKeyPoints];
  }

  void display(float playhead) {

    // find current time marker on the table
    for ( TableRow row : POSETable.rows() ) {
      if (row.getFloat("time") >= playhead) {
        current = row;
        break;
      }
    }

    // parse table and draw keypoints
    for (int i = 0; i < maxIdx; i++) {
      if (!Float.isNaN(current.getFloat("keypoints."+i+".0.0"))) {
        for (int j=0; j<=15; j++) {
          //X keypoint positions
          float keyPointX = current.getFloat("keypoints."+i+"."+j+".0");
          //store point X in arraylist
          connectionsX[j]=keyPointX;

          //Y keypoint positions
          float keyPointY = current.getFloat("keypoints."+i+"."+j+".1");
          //store point Y in arraylist
          connectionsY[j]=keyPointY;

          //unused
          //float poseScore = current.getFloat("scores."+i);
          for (int k=0; k<connectionsX.length; k++) {
            float size=8;//ellipse size

            float x = connectionsX[k] * width;
            float y = connectionsY[k]* height;

            // draw point pos  with table data
            drawPos(x, y, size);

          }
        }
      }
    }
  }
}

// drawing bbox function
void drawPos(float x, float y, float size) {

  fill(9, 130, 250);
  noStroke();
  ellipseMode(CENTER);
  ellipse(x, y, size, size);
}
