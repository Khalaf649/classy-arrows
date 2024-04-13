//import processing.sound.*;
class Level1
{
  Button easy, medium, hard, nextLevel;
  PImage background1, background0, options;
  PImage lvl2;
  Character character;
  int score=0;
  int shootarrows=0;
  int shootballoons=0;
  Arrow[] arrows=new Arrow[20];
  Ballon[] ballons=new Ballon[15];
  PFont customFont;
  //SoundFile backgroundMusic;
  //SoundFile balloonSound;
  boolean setdifficlty=false;// indicates the difficulty has been set or not?
  Level1()
  {
    easy = new Button("Easy.png", width/2, height/2-100, 500, 250);
    medium = new Button("Medium.png", width/2, height/2+50, 500, 250);
    hard = new Button("Hard.png", width/2, height/2+200, 500, 250);
    nextLevel=new Button("NextLevel.png", 1700, 950, 700, 350);
    character = new Character();
    background1 = loadImage("bg1.jpg");
    background0 = loadImage("bg0.jpg");
    options = loadImage("Options.png");
    lvl2=loadImage("level22.jpg");
    background1.resize(width, height);
    background0.resize(width, height);
    options.resize(800, 400);
    lvl2.resize(width, height);
    for (int i=0; i<20; i++)
      arrows[i]=new Arrow();
    for (int i=0; i<15; i++)
      ballons[i]=new Ballon(i*100+480, height);
    customFont = createFont("Speed Rush", 32);
  }


  void ShowBallons()
  {
    for (int i = 0; i < 15; i++)  // Display existing balloons
      if (ballons[i].getExist())
        ballons[i].display();
  }


  void begin(int difficulty)
  {
    if (!setdifficlty)
    {
      for (Arrow it : arrows)
        it.setdifficulty(difficulty);
      setdifficlty=true;
    }
    background(background1);
    character.display();
    DrawArrows();
    ShowBallons();
    showScore();
    if (shootarrows<20&&shootballoons==15) {
      background(lvl2);
      character.drawcharacterhappy();
      nextLevel.drawButton();
      showWin();
    }
    if (shootarrows==20&&shootballoons<15) {
      background(background0);
      character.drawcharacterdead();
      showFail();
    }
    textFont(customFont);
  }



  void DrawArrows()
  {
    for (int i = 0; i < 20; i++) {
      if (arrows[i].getexsist()) {
        arrows[i].drawArrow();
        for (int j = 0; j < 15; j++)
          if (arrows[i].collidesWith(ballons[j])&&ballons[j].getExist()) {// Collision detected
            ballons[j].setExist(false); // Set the balloon as not existing
            shootballoons++;
            //balloonSound.play();
          }
      }
    }
  }



  void showScore() {

    score = (20 - shootarrows + 1) * shootballoons;
    fill(250);
    textSize(65);
    textAlign(LEFT, CENTER);
    text(" Score : " + score, 0, 950);
    text(" Remaining arrows : " + (20-shootarrows), 0, 1000);
    println(score);
  }
  void showWin() {

    //win=true;
    fill (102, 0, 102);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Congrats, YOU WIN!!", width / 2, height / 2-50);
    text("Your Score: " + score, width / 2, height / 2+50);
  }


  void showFail() {
    fill(153, 26, 0);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Sorry, You Failed.", width / 2, height / 2-50);
    text("Your Score: " + score, width / 2, height / 2+50);
  }


  void start()
  {
    background(background0);
    easy.drawButton();
    medium.drawButton();
    hard.drawButton();
    image(options, width/2, height/2-300);
    //if (!backgroundMusic.isPlaying()) {
    // backgroundMusic.play();
    // }
    setdifficulty();
  }

  void setdifficulty()
  {
    if (easy.IsButtonClicked())
      level1.begin(100);
    else if (medium.IsButtonClicked())
      level1.begin(60);
    else if (hard.IsButtonClicked())
      level1.begin(20);
  }
  void checkButtons()
  {
    if (!easy.IsButtonClicked())
      easy.buttonCheck(mouseX, mouseY);
    if (!medium.IsButtonClicked())
      medium.buttonCheck(mouseX, mouseY);
    if (!hard.IsButtonClicked())
      hard.buttonCheck(mouseX, mouseY);
  }
  void action()
  {
    if (mouseButton==RIGHT)
      character.setPostion(!character.getpostion());
    if (mouseButton==LEFT)
    {
      if (!character.getpostion()&&shootarrows<20)
      {
        character.setPostion(true);
        arrows[shootarrows].setExsist(true);
        arrows[shootarrows].set(150, character.getY()+40);
        shootarrows++;
      }
    }
  }
}
