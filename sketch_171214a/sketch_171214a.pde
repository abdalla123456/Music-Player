import processing.sound.*;


PImage[] pic = new PImage[5];

//Variables, no call needed for variables-only

//Creating Sound Files, similar to classes (also like Text Files or loading text)
int totalSongs = 3;
SoundFile[] song = new SoundFile[totalSongs]; //Access the song number to access anything about the song
int indexSong = 2; //When program starts, program starts at song zero





void setup() {
size (600, 600);
String title = "Music Player";
String text = "Quit";
PFont titleFont;
titleFont = createFont ("Arial-Black", 55); //Copy spelling from CreateFont
rect (125, 70, 360, 85); //Title Rectangle
fill (0); //Black Ink
textAlign (CENTER); //Centered in Rectangle
textFont(titleFont, 60); 
text(title, 305, 135, 45); 
text(text, 550, 560, 22, 22);



fill(255); //Reset to white for rest of program
  pic[1] = loadImage("StopButton.png");
  pic[0] = loadImage("play-button_318-42541.jpg");
  pic[2] = loadImage("FastForwardButton.jpg");
  pic[3] = loadImage("PreviousButton.png");
  pic[4] = loadImage("QuitButton.png");
  rect (190, 522, 50, 50);
  rect (315, 522, 50, 50);
  rect (416, 522, 50, 50);
  rect (92, 522, 50, 50);
  size (600, 600); //Is this necessary when working only in the console
  image(pic[1], 315, 522, 50, 50);
  image(pic[0], 190, 522, 50, 50);
  image(pic[2], 416, 522, 50, 50);
  image(pic[3], 92, 522, 50, 50);
  image(pic[4], 500, 550, 100, 50);
 
  
  
  song[1] = new SoundFile(this, "Lil_Pump_Gucci_Gang.MP3");
  song[2] = new SoundFile(this, "Drake_OneDance_POWER.MP3");
}

void draw() {  
//println ("Mouse X Variaable is " + mouseX);
//println ("Mouse Y Variaable is " + mouseY);

 if (indexSong < 0 | indexSong >= song.length) {
    if (indexSong < 0) {
      indexSong = 0;
      println("You are pressing the Previous Button a lot \n" +
        "Please press the Next Button or the Play Button.");
      println("Your song number is changed to " + indexSong + ".");
    } else {
      indexSong = song.length - 1;
      println ("You are at the end of the song list, \n" +
        "Press the Previous Song or Play Keys");
      //println("You are pressing the Next Button a lot \n" +
      //"Please press the Back Button or the Play Button.");
      println("Your song number is changed to " + indexSong + ".");
    }
  }


}


void mousePressed () {
  
  if (mouseX>=500 && mouseX <=600 && mouseY>=550 && mouseY<=600) {
    exit ();
  }
  
  if (mouseX>=315 && mouseX <=600 && mouseY>=522 && mouseY<=600) {
    song[1].stop();
  }

  if (mouseX>=190 && mouseX <=600 && mouseY>=522 && mouseY<=600) {
    song[1].play();
  }
  
  if (mouseX>=315 && mouseX <=600 && mouseY>=522 && mouseY<=600) {
    song[1].stop();
  }
  
   if (mouseX>=416 && mouseX <=600 && mouseY>=522 && mouseY<=600) {
    song[indexSong].stop();
    indexSong = indexSong + 1;
  
  
 
}
}
void keyPressed() {
  
   println ("Current Key Pressed: " + key);
   println ("Current Song Number is: " + indexSong + ".\n");

  if (indexSong < 0 | indexSong >= song.length) {
    if (indexSong < 0) {
      indexSong = 0;
      println("You are pressing the Previous Button a lot \n" +
        "Please press the Next Button or the Play Button.");
      println("Your song number is changed to " + indexSong + ".");
    } else {
      indexSong = song.length - 1;
      println ("You are at the end of the song list, \n" +
        "Press the Previous Song or Play Keys");
      //println("You are pressing the Next Button a lot \n" +
      //"Please press the Back Button or the Play Button.");
      println("Your song number is changed to " + indexSong + ".");
    }
  }

  switch(key) {
  case 's':
  case 'S':
    println("Playing song " + indexSong + ".");
    song[0].play();
    break;
  case 'x':
  case 'X':
    song[0].stop();
    println ("You have stopped playing song ", 250, 250 + indexSong + ".");
    break;
  case 'a':
  case 'A':
    println("Choosing previous song");
    song[indexSong].stop(); 
    indexSong = indexSong - 1; 
    println ("Current Song Number is: " + indexSong);
    break;
  case 'd':
  case 'D':
    println("Choosing next song");
    song[indexSong].stop();
    indexSong = indexSong + 1;
    println ("Current Song Number is: " + indexSong);
    break;
  default:
    println("\nPress the \'a\', \'s\', \'d\', or \'x\' keys for control.\n\n");
  }
}