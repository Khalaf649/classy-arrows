class Level2 extends Level1
{
  Level2()
  {
    widthHappy=600;
    heightHappy=450;
    xHappy=150;
    yHappy=800;
    widthDead=750;
    heightDead=400;
    xDead=180;
    yDead=790;
    background1 = loadImage("bg02.png");
    background0 = loadImage("bg022.png");
    background1.resize(width, height);
    background0.resize(width, height);
    for (int i=0; i<20; i++)
      arrows[i]=new Arrow("arrow1.png");
    character = new Character("position21.png", "position22.png", "position23.png", 400, 300);

   
  }
//  @override
    void showWin() {

    win=true;
    fill (247, 250, 227);
    textSize(100);
    textAlign(CENTER, CENTER);
    text("Congrats, YOU WIN!!", width / 2, height / 2-50);
    text("Your Score: " + score, width / 2, height / 2+50);
  
  }


}
