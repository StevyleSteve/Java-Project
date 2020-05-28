 /* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void slider1_change1(GSlider source, GEvent event) { //_CODE_:slider1:634065:
  threshold = slider1.getValueF();
} //_CODE_:slider1:634065:

public void slider2_change1(GSlider source, GEvent event) { //_CODE_:slider2:997515:
  gain = slider2.getValueF();
} //_CODE_:slider2:997515:

public void slider3_change1(GSlider source, GEvent event) { //_CODE_:slider2:997515:
  vol = slider3.getValueF();
  x = 10 - (Math.round(vol * 10));
  label4.setText(Integer.toString(x));
} //_CODE_:slider3:997515:


public void handleButtonEvents(GButton button, GEvent event) { //method to handle all of the button events
   if(button == button1 && event == GEvent.CLICKED){ //Button to pause/play current sound
     if(!myplayer.isPlaying()){
     myplayer.play();
     button1.setText("Pause");
     }
     else {
     myplayer.pause();
     button1.setText("Play");
     }
   }
      if(button == button2 && event == GEvent.CLICKED){ //Button to stop and rewind sound
         {
        myplayer.rewind();
        myplayer.pause();
        button1.setText("Play");
    }
      }
            if(button == button3 && event == GEvent.CLICKED){// button to set sound as "breaking glass"
         {
        myplayer.rewind();
        myplayer.pause();
        button1.setText("Play");
        myplayer = minim.loadFile("BreakingGlass.aiff");
        label6.setText("Current sound:\nBreaking Glass");
        label6.setTextBold();

    }
      }
                  if(button == button4 && event == GEvent.CLICKED){// button to set sound as "please shut up!""
         {
        myplayer.rewind();
        myplayer.pause();
        button1.setText("Play");
        myplayer = minim.loadFile("Please Shut Up!.mp3");
        label6.setText("Current sound:\nSHUT UP!");
        label6.setTextBold();

  }
      }
          if(button == button5 && event == GEvent.CLICKED){// button to set sound as "smooth jazz"
         {
        myplayer.rewind();
        myplayer.pause();
        button1.setText("Play");
        myplayer = minim.loadFile("smoothjazz.mp3");
        label6.setText("Current sound:\nSmooth Jazz");
        label6.setTextBold();
    }
      }
    checkFeedback();
   }

// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setCursor(ARROW);
  surface.setTitle("SeeSound");
  slider1 = new GSlider(this, 790, 382, 170, 44, 10.0);
  slider1.setRotation(PI/2, GControlMode.CORNER);
  slider1.setLimits(0.5, 1.0, 0.1);
  slider1.setNumberFormat(G4P.DECIMAL, 2);
  slider1.setOpaque(false);
  slider1.addEventHandler(this, "slider1_change1");
  slider2 = new GSlider(this, 55, 382, 170, 44, 10.0);
  slider2.setRotation(PI/2, GControlMode.CORNER);
  slider2.setLimits(1.0, 1.0, 0.0);
  slider2.setNumberFormat(G4P.DECIMAL, 2);
  slider2.setOpaque(false);
  slider2.addEventHandler(this, "slider2_change1");
  slider3 = new GSlider(this, 690, 568, 170, 44, 10.0);
  slider3.setRotation(PI/1, GControlMode.CORNER);
  slider3.setLimits(0.5, 0.0, 1.0);
  slider3.setNumberFormat(G4P.DECIMAL, 2);
  slider3.setOpaque(false);
  slider3.addEventHandler(this, "slider3_change1");
  label1 = new GLabel(this, 730, 563, 69, 20);
  label1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  label1.setText("THRESH");
  label1.setTextBold();
  label1.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  label1.setOpaque(false);
  label2 = new GLabel(this, 12, 564, 44, 20);
  label2.setTextAlign(GAlign.CENTER, GAlign.TOP);
  label2.setText("GAIN");
  label2.setTextBold();
  label2.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  label2.setOpaque(false);
  label3 = new GLabel(this, 583, 564, 44, 20);
  label3.setTextAlign(GAlign.CENTER, GAlign.TOP);
  label3.setText("VOL");
  label3.setTextBold();
  label3.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  label3.setOpaque(false);
  label4 = new GLabel(this, 610, 564, 44, 20);
  label4.setTextAlign(GAlign.CENTER, GAlign.TOP);
  label4.setText(Integer.toString(x));
  label4.setTextBold();
  label4.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  label4.setOpaque(false);
  label5 = new GLabel(this, 358, 564, 50, 20);
  label5.setTextAlign(GAlign.CENTER, GAlign.TOP);
  label5.setText("SOUND");
  label5.setTextBold();
  label5.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  label5.setOpaque(false);
  label6 = new GLabel(this, 82, 470, 200, 100);
  label6.setTextAlign(GAlign.CENTER, GAlign.TOP);
  label6.setText("Current sound:\nSHUT UP!");
  label6.setTextBold();
  label6.setFont(new Font("Monospaced", Font.PLAIN, 20));
  label6.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  label6.setOpaque(false);
  button1 = new GButton (this, 380, 543, 69, 20);
  button1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  button1.setText("Play");
  button1.setTextBold();
  button1.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  button1.setOpaque(false);
  button1.fireAllEvents(true);
  button2 = new GButton (this, 311, 543, 69, 20);
  button2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  button2.setText("Stop");
  button2.setTextBold();
  button2.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  button2.setOpaque(false);
  button2.fireAllEvents(true);
  button3 = new GButton (this, 311, 500, 69, 40);
  button3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  button3.setText("Breaking Glass");
  button3.setTextBold();
  button3.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  button3.setOpaque(false);
  button3.fireAllEvents(true);
  button4 = new GButton (this, 380, 500, 69, 40);
  button4.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  button4.setText("SHUT UP");
  button4.setTextBold();
  button4.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  button4.setOpaque(false);
  button4.fireAllEvents(true);
  button5 = new GButton (this, 311, 458, 138, 40);
  button5.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  button5.setText("Smooth Jazz");
  button5.setTextBold();
  button5.setLocalColorScheme(GCScheme.BLUE_SCHEME);
  button5.setOpaque(false);
  button5.fireAllEvents(true);
}

// Variable declarations 
// autogenerated do not edit
GSlider slider1; 
GSlider slider2; 
GSlider slider3;
GLabel label1; 
GLabel label2; 
GLabel label3;
GLabel label4;
GLabel label5;
GLabel label6;
GButton button1;
GButton button2;
GButton button3;
GButton button4;
GButton button5;
int x = 5;