import processing.video.*;

Movie movie;
POSE pose;
boolean isFirstFrame;
float movieDuration;
boolean isPlaying;

void setup() {
  size(1920, 1080, P2D);
  movie = new Movie(this, "test02.mp4");
  movie.loop();
  // The second parameter in this setUpPOSE() function is the max number of tracked entities in the CSV
  // You need to open the CSV, scroll right and check column name 'poses'
  // Whatever the highest number is for this in the CSV should be input here
  // TODO: automate this
  setUpPOSE("openpifpaf.CSV", 1); 
  frameRate(25); // may need to match the video framerate – not tested
}
void draw() {
 // background(0);
  image(movie, 0, 0, width, height);
  updatePOSE();
}


void movieEvent(Movie movie) {
  movie.read();
  // set playhead start: manages timings
  if (isFirstFrame) {
    isFirstFrame = false;
    isPlaying = false;
  }
}
