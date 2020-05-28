//Stephen Caulfield 14151995
// libraries
import processing.video.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import g4p_controls.*;
import java.awt.*;

// declarations
Movie mymovie; // video 
Minim minim; // audio 
AudioInput in; // audio input device (microphone)
AudioPlayer myplayer; // audio output device
PImage bg;

float micLevel = 0.0; 
float prevLevel = 0.0;
float moviePosition = 0.0;
float threshold = 0.5; // set the sensitivity of the audio input
float gain = 0.0;
float vol = 0.5;
int triggered = 0;
int time;

// initialisation
void setup() 
{
  createGUI(); // from the gui class (G4P)
  size(800, 600); // set screen size
  frameRate(30); // framerate for updating display
  mymovie = new Movie(this, "pls stop.mp4"); // get the movie file
  minim = new Minim(this); // instantiate the audio class
  myplayer = minim.loadFile("Please Shut Up!.mp3");
  textFont(createFont("Arial", 12)); // create a font for display
  bg = loadImage("bg.jpg");
  time = millis();
  // Pausing the video at the first frame. 
  mymovie.play();
  mymovie.jump(0);
  mymovie.pause();
  in = minim.getLineIn(Minim.STEREO, 2048); // start audio input
}
// main code
void draw() 
{
  background(bg); // clear screen, black background
  showMovie();
  showLoudnessBar();
  checkFeedback();
  stroke(255); // set the drawing colour to white  fill(255);
  if(triggered > 0)
  {
    text("TOO LOUD!!!", 335, 450);
    triggered--;      
  }
  else
  {
    text(" ", 400, 550);
  }
}
// functions
void keyPressed() 
{
  if (key == 'q' || key == 'Q') 
  {
    // quit program
    exit(); 
  }
  if (key == ESC)  {
    // quit program
    exit(); 
  }
}
float getMicLoudness()
{
  // get the loudness of audio input, in the case of stereo in, the loudest channel
  float lvol = in.left.level();
  float rvol = in.left.level(); 
  if(lvol > rvol)
  {
    return(lvol);
  }
  else
  {
    return(rvol);
  }
}
void showMovie()
{
  if (mymovie.available()) 
  {
    mymovie.read(); // read the of video file
    micLevel = 3 * gain * sqrt(getMicLoudness()); // calculate what frame of video to show based on mic loudness
    if(micLevel > 1.0)
    { // clip if too loud
      micLevel = 1.0;
    }
    if(micLevel > threshold)
    {
      moviePosition += 0.2; // the 0.05 was calculated by me based on the duration of the video file, approx 1 frame.
      if(moviePosition > 1.0)
      {
        moviePosition = 1.0;
      }
    }
    else
    {
      moviePosition -= 0.05;
      if(moviePosition < 0.0)
      {
        moviePosition = 0.0;
      }
    }
    float t = mymovie.duration() * moviePosition; // convert location in video file to time
    mymovie.play(); // set the video to play 
    mymovie.jump(t); // and jump to the frame according to mic loudness
    mymovie.pause(); // pause and wait for next screen re-draw
  }
  image(mymovie, 80, 30); // put the video on screen
}
void showLoudnessBar()
{
  // a simple bar graph indicating the incoming audio level
  fill(#00FF00);
  rect(25, 300 - (micLevel * 100), 10, micLevel * 100);
}
void checkFeedback()
{
   myplayer.setGain(0 - (vol * 80));
  float fblevel = (1 - threshold)/2;
  if(micLevel > (threshold + fblevel))
  {
    if(!myplayer.isPlaying())
    { // play the feedback sound
      button1.setText("Pause");
      myplayer.play();
      triggered = 30; // pick a value that is large enough for the message to be read in below the video.
  }
    }
          if(myplayer.position() == myplayer.length())
      {
        myplayer.rewind();
        myplayer.pause();
        button1.setText("Play");
    }
  }