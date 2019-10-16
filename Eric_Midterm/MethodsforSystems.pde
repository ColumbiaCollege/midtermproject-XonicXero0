//Methods for each warp zone and system.

//jump menu 
void jumpMap() {

  //background
  background(#2D3234);

  sI = systemInfo[0];

  //jump menu 
  fill(200);
  rect(width/3, height/175, width/3, height/15);
  fill(255);
  textAlign(CENTER, CENTER);
  textSize(width/40);
  text(sI, width/3, height/175, width/3, height/15);

  //selectable stars
  sun.drawStar();
  bazelgeuse.drawStar();
  whiteS.drawStar();
  cStar.drawStar();
  eleonora.drawStar();
  greg.drawStar();
  iris.drawStar();
  decay.drawStar();

  //where stars take you if they are clicked 
  sun.warpStar(1);
  bazelgeuse.warpStar(2);
  whiteS.warpStar(3);
  cStar.warpStar(4);
  eleonora.warpStar(5);
  greg.warpStar(6);
  iris.warpStar(7);
  decay.warpStar(8);
}

//Solar(HOME)System
void solSystem() {

  //resets background
  back1.resize(width, height);
  image(back1, 0, 0);

  //background stars
  for (int t = 0; t < width; t=t+50) {
    float r = random (height);

    strokeWeight(0);
    stroke(0);
    fill(255);
    rect(0+t, 0+r, 2, 2);
  }

  sI = systemInfo[1];

  //methods for star
  sun.drawStar();
  sun.ContactStar();

  //Create Planets and Ships
  Homeworld.objDraw();

  Dusteye.objDraw();

  //UI
  Player.playerUI();
  //ship
  Player.playerDraw();
  //move
  Player.playerMove();

  //Menus
  Homeworld.objTradeWith(20, 20, 20, 15, "Homeworld", "Your Home looks even more amazing from space. Your kind has existed there in a civilized form for at least three millennia; however, it was only two centuries ago when your kind was first able to travel around the broader system. To think that the jump drive that your kind created to travel faster than light was made within your lifetime and can be used by your own ship for just 10% of its energy is amazing! After reminiscing you contact your planet and they offer to trade with and replenish your resources. Firstly, they tell you about their economy. It has an average demand for ore and data, and has infrastructure sufficient enough for reasonable recharge rates; however, its space docks are overcapacity and its cost for repairs are more expensive. Secondly, they tell you the cost for transactions in standard units, 20 Cash for 10 Ore, 20 Cash for 5 Data, 20 Cash for 2% Repair, and 15 Cash for 2% Recharge. Finally, they tell you that you may move at any time to leave the trade menu. ");

  Dusteye.objMineOrResearch(2, random(5, 15), 2, .25, "Dusteye", "Dusteye, the sister world to your own has always looked fascinating to your kind from above. Unfortunately, after venturing to space it was discovered that the sister civilizations written and theorized about did not exist on the dead world. The planet, covered by its two distinctive craters or eyes, has always been easy to harvest ore from, however it has been studied exclusively before the jump drives invention so new data is nonexistent. After some scans your ship informs you that you can mine and research the planet. For 2% energy you could get an average amount of ore; however, expending 2% energy is not likely to not yield any useful data. If neither of these options intrigue you, you can move to leave at any time. ");
}

//Bazelgeuse System
void bazelgeuseSystem() {

  //resets background
  back2.resize(width, height);
  image(back2, 0, 0);

  //background stars
  for (int t = 0; t < width; t=t+80) {
    float r = random (height);

    strokeWeight(0);
    stroke(0);
    fill(255);
    rect(0+t, 0+r, 2, 2);
  }

  sI = systemInfo[2];

  //methods for star
  bazelgeuse.drawStar();
  bazelgeuse.ContactStar();

  //Create Planets and Ships
  RGasgiant.objDraw();

  RRuinedplanet.objDraw();

  //asteroids
  if (frameCount %120 == 0) {
    asteroids.add(new StarDebris(int(random(width/700, width/500)), int(random(width/75, width/50))));
  }
  for (int i = 0; i <  asteroids.size(); i++) {
    asteroids.get(i).DrawAsteroid();
    asteroids.get(i).MoveAsteroid();
    if ( asteroids.get(i).OutOfBounds()) {
      asteroids.remove(i);
    }
    if (key == '1') {
      asteroids.remove(i);
    }
  }

  //UI
  Player.playerUI();
  //ship
  Player.playerDraw();
  //move
  Player.playerMove();

  //Menus
  RGasgiant.objMineOrResearch(5, random(3, 10), 10, random(8, 24), "Zeus", "Zeus, the massive gas giant sits as the only survivor of the harsh Bazelgeuse System. It is plagued with extreme winds and a massive hurricane spins continually in its northern hemisphere. The planet has small useless rocks orbiting it that harbor few ore, however it’s unique winds and ability to survive its ruinous system offer opportunities for research. After some scans your ship informs you that you can mine and research the planet. For 5% energy you could retrieve debris for miniscule amounts of ore; however, expending 10% energy to study the planet would offer great data returns! If neither of these options intrigue you, you can move to leave at any time. ");

  RRuinedplanet.objMineOrResearch(5, random(20, 50), 3, random(3, 9), "Doomed World", "A Doomed World, destroyed long ago by the constant bombardment of debris that orbit the Bazelgeuse System. The shredded southern half of the world is dangerous with fast moving debris from an ancient impact, surly it would be a good place to study. After some scans your ship informs you that you can mine and research the planet. For 5% energy you could avoid the debris and potentially extract the rich ore from its impact site; however, for 3% energy you could study the impact for data. If neither of these options intrigue you, you can move to leave at any time. ");
}

//Drake System
void drakeSystem() {

  //resets background
  back3.resize(width, height);
  image(back3, 0, 0);

  //background stars
  for (int t = 0; t < width; t=t+50) {
    float r = random (height);

    strokeWeight(0);
    stroke(0);
    fill(255);
    rect(0+t, 0+r, 2, 2);
  }

  sI = systemInfo[3];

  //methods for star
  whiteS.drawStar();
  whiteS.ContactStar();

  //Create Planets and Ships
  Drake.objDraw();

  Cargoship.objDraw();
  Cargoship.objMove(0, -width/1000);

  //UI
  Player.playerUI();
  //ship
  Player.playerDraw();
  //move
  Player.playerMove();

  //Menus
  Drake.objTradeWith(22, 5, 10, 12, "Drake", "Drake, the overseer of civilized space. The fully urbanized world has existed in its separated form for a period of time so vast, that it dwarfs the time your kind has ventured its own seas by orders of magnitude. It alone dominates the space around the small white dwarf it orbits therefore making it an obvious choice for trade. You contact the planet and they offer to trade with and replenish your resources. Firstly, they tell you about their economy. Drake is ancient and therefore needs constant repairs to it vast superstructure giving it a high demand for ore, while much of its knowledge is lost its demand for data is very low, Its vast cavity is home to shipyards which repair any damage at the cheapest cost, and its energy is abundant making recharging cheap. Secondly, they tell you the cost for transactions in standard units, 22 Cash for 10 Ore, 5 Cash for 5 Data, 10 Cash for 2% Repair, and 12 Cash for 2% Recharge. Finally, they tell you that you may move at any time to leave the trade menu.");
}

//Archway System
void archwaySystem() {

  //resets background
  back1.resize(width, height);
  image(back1, 0, 0);

  //background stars
  for (int t = 0; t < width; t=t+50) {
    float r = random (height);

    strokeWeight(0);
    stroke(0);
    fill(255);
    rect(0+t, 0+r, 2, 2);
  }

  sI = systemInfo[4];

  //methods for star
  cStar.drawStar();
  cStar.ContactStar();

  //Create Planets and Ships
  Cworld.objDraw();

  Greengas.objDraw();

  Lavaland.objDraw();

  //UI
  Player.playerUI();
  //ship
  Player.playerDraw();
  //move
  Player.playerMove();

  //Menus
  Cworld.objTradeWith(23, 15, 18, 15, "Archia", "Archie is a world in much the same situation as your own. Like your own planet, it seeks to urbanize and advance to compete with the greater civilizations of the galaxy. With so much in common what’s to stop the wonders of trade? You contact the planet and they offer to trade with and replenish your resources. Firstly, they tell you about their economy. Archie wants to grow fast and therefore has a huge demand for Ore, Its’s lust for data is lacking in comparison, furthermore, its space docks are developed and can repair damage as well as recharge for an average price. Secondly, they tell you the cost for transactions in standard units, 23 Cash for 10 Ore, 15 Cash for 5 Data, 18 Cash for 2% Repair, and 15 Cash for 2% Recharge. Finally, they tell you that you may move at any time to leave the trade menu.");

  Greengas.objMineOrResearch(3, random(1, 2), 10, random(7, 21), "Mist", "Mist, a massive gas giant made of various gases tinted an odd green color. The planet has small useless rocks orbiting it that harbor few ore, however it’s unique green tint and slow-moving storms and winds offer opportunities for research. After some scans your ship informs you that you can mine and research the planet. For 3% energy you could retrieve debris for miniscule amounts of ore; however, expending 10% energy to study the planet would offer great data returns! If neither of these options intrigue you, you can move to leave at any time. ");

  Lavaland.objMineOrResearch(5, random(25, 30), 7, random(3, 12), "Lavaland", "The so called Lavaland of the Archway System has earned fame for its oceans of and rivers of molten rock. The planet spews rich ore that is awaits anyone willing to venture past its toxic atmosphere; however, it’s volcanos could potentially yield good research. After some scans your ship informs you that you can mine and research the planet. For 5% energy you could go through the toxic atmosphere and gain large amounts of ore; however, expending 7% energy to study the lava could yield decent data. If neither of these options intrigue you, you can move to leave at any time. ");
}

//Eleeve System
void eleeveSystem() {

  //resets background
  back1.resize(width, height);
  image(back1, 0, 0);

  //background stars
  for (int t = 0; t < width; t=t+50) {
    float r = random (height);

    strokeWeight(0);
    stroke(0);
    fill(255);
    rect(0+t, 0+r, 2, 2);
  }

  sI = systemInfo[5];

  //methods for stars
  eleonora.drawStar();
  eleonora.ContactStar();

  evelyn.drawStar();
  evelyn.ContactStar();

  //Create Planets and Ships
  Dune.objDraw();

  Luxship.objDraw();
  Luxship.objMove(-width/1200, 0);

  //asteroids
  if (frameCount %360 == 0) {
    asteroids.add(new StarDebris(int(random(width/700, width/650)), int(random(width/100, width/75))));
  }
  for (int i = 0; i <  asteroids.size(); i++) {
    asteroids.get(i).DrawAsteroid();
    asteroids.get(i).MoveAsteroid();
    if ( asteroids.get(i).OutOfBounds()) {
      asteroids.remove(i);
    }
    if (key == '1') {
      asteroids.remove(i);
    }
  }

  //UI
  Player.playerUI();
  //ship
  Player.playerDraw();
  //move
  Player.playerMove();

  //Menus
  Luxship.objTradeWith(2, 35, 50, 50, "Royal Yacht", "A Royal Yacht travels the central system viewing the same majestic sites as you. Its magnificent shape begs you to make contact. You contact the ship and because of regulations they begrudgingly follow they offer to trade with and replenish your resources. They will buy ore for you only at the most absurdly low of prices, furthermore the cost of its energy and repairs is non economical to say the least, in spite of this the yacht owner values data and offers an unbeatable price for it. Secondly, they tell you the cost for transactions in standard units, 2 Cash for 10 Ore, 35 Cash for 5 Data, 50 Cash for 2% Repair, and 50 Cash for 2% Recharge. Finally, they tell you that you may move at any time to leave the trade menu.");

  Dune.objMineOrResearch(2, random(15, 20), 2, random(.25, 3.5), "Dune", "Dune, a planet scorched and turned mostly to sand by the twin stars it orbits. The planet has average amounts of easily accessible ore, but little research opportunities. After some scans your ship informs you that you can mine and research the planet. For 2% energy you could get an average amount of ore; however, expending 2% energy is not likely to not yield any results. If neither of these options intrigue you, you can move to leave at any time. ");
}

//Gregory System
void gregorySystem() {

  //resets background
  back3.resize(width, height);
  image(back3, 0, 0);

  //background stars
  for (int t = 0; t < width; t=t+50) {
    float r = random (height);

    strokeWeight(0);
    stroke(0);
    fill(255);
    rect(0+t, 0+r, 2, 2);
  }

  sI = systemInfo[6];

  //methods for star
  greg.drawStar();
  greg.ContactStar();

  //Create Planets and Ships
  Frosty.objDraw();

  Metro.objDraw();

  Havock.objDraw();

  //asteroids
  if (frameCount %360 == 0) {
    asteroids.add(new StarDebris(int(random(width/700, width/650)), int(random(width/100, width/75))));
  }
  for (int i = 0; i <  asteroids.size(); i++) {
    asteroids.get(i).DrawAsteroid();
    asteroids.get(i).MoveAsteroid();
    if ( asteroids.get(i).OutOfBounds()) {
      asteroids.remove(i);
    }
    if (key == '1') {
      asteroids.remove(i);
    }
  }

  //UI
  Player.playerUI();
  //ship
  Player.playerDraw();
  //move
  Player.playerMove();

  //Menus
  Metro.objTradeWith(10, 25, 12, 8, "Metro", "Metro, the urban world gets its name as all route in the galaxy lead to it. It was only a millennium ago when its clever inhabitants used trade and diplomacy to overtake the recessing world of Drake and become the capital of civilized space. It is almost insanity not to trade with such a superpower. You contact the planet and they offer to trade with and replenish your resources. Firstly, they tell you about their economy. Metro is the center of trade and therefore has a low demand for the ore it is constantly supplied, it understands the value of data and demands it highly to maintain its status. Its space docks can repair damage for cheap and its unlimited power plants make the price of energy almost nothing. Secondly, they tell you the cost for transactions in standard units, 10 Cash for 10 Ore, 25 Cash for 5 Data, 12 Cash for 2% Repair, and 8 Cash for 2% Recharge. Finally, they tell you that you may move at any time to leave the trade menu.");

  Frosty.objMineOrResearch(2, random(5, 10), 5, random(1, 20), "Xeno", "Xeno, a world orbiting so distantly from its star that it is constantly subject to absurdly low temperatures. The planet is covered in glaciers and frozen seas which could be mined for ore or studied for data or life. After some scans your ship informs you that you can mine and research the planet. For 2% energy you could get an small amount of ore; however, you could use 5% energy to potentially gain some important data. If neither of these options intrigue you, you can move to leave at any time. ");

  Havock.objMineOrResearch(3, random(15, 35), 5, random(3, 9), "Havock", "Havock, a massive terrestrial planet the size of a small gas giant. It would define the Gregory System alone if it was not for the status of Metro. The world is dotted by massive volcanos that spew huge rivers of lava, and even vaster deserts void of any life. These conditions are surly good for research and mining. After some scans your ship informs you that you can mine and research the planet. For 3% energy you could get a great amount of ore; however, you could use 5% energy to potentially gain some important data. If neither of these options intrigue you, you can move to leave at any time. ");
}

//Eye System
void eyeSystem() {

  //resets background
  back1.resize(width, height);
  image(back1, 0, 0);

  //background stars
  for (int t = 0; t < width; t=t+50) {
    float r = random (height);

    strokeWeight(0);
    stroke(0);
    fill(255);
    rect(0+t, 0+r, 2, 2);
  }

  sI = systemInfo[7];

  //methods for star
  iris.drawStar();
  iris.ContactStar();

  //UI
  Player.playerUI();
  //ship
  Player.playerDraw();
  //move
  Player.playerMove();
}

//Decay System
void decaySystem() {

  //resets background
  back2.resize(width, height);
  image(back2, 0, 0);

  //background stars
  for (int t = 0; t < width; t=t+50) {
    float r = random (height);

    strokeWeight(0);
    stroke(0);
    fill(255);
    rect(0+t, 0+r, 2, 2);
  }

  sI = systemInfo[8];

  //methods for star
  decay.drawStar();
  decay.ContactStar();

  blackHole1.drawHole();
  blackHole1.ContactStar();

  //Create Planets and Ships
  Ruinedship.objDraw();
  Ruinedship.objMove(width/900, -width/900);

  Ruinedship2.objDraw();
  Ruinedship2.objMove(width/700, -width/900);

  //asteroids
  if (frameCount %120 == 0) {
    int randomNumber = int(random(1, 10));

    if (randomNumber > 9) {
      asteroids.add(new StarDebris(int(random(width/700, width/500)), width/10));
    } else {
      asteroids.add(new StarDebris(int(random(width/700, width/500)), int(random(width/75, width/50))));
    }
  }
  for (int i = 0; i <  asteroids.size(); i++) {
    asteroids.get(i).DrawAsteroid();
    asteroids.get(i).MoveAsteroid();
    if ( asteroids.get(i).OutOfBounds()) {
      asteroids.remove(i);
    }
    if (key == '1') {
      asteroids.remove(i);
    }
  }

  //UI
  Player.playerUI();
  //ship
  Player.playerDraw();
  //move
  Player.playerMove();

  //Menus
  Ruinedship.objMineOrResearch(2, random(5, 10), 4, random(5, 10), "Ruined Spaceship", "A Ruined Starship, once a potentially glorious craft it has now been condemned to float destroyed in the ruinous Decay System. Chunks of debris likely full of salvageable resources follow in its wake, Following and studying the ruin could create quite the story. After some scans your ship informs you that you can mine and research the ruins. For 2% energy you could salvage what little remains from a piece of debris; however, you could use 4% energy to potentially figure out how such a ship met its end. If neither of these options intrigue you, you can move to leave at any time.");

  Ruinedship2.objMineOrResearch(2, random(5, 10), 4, random(5, 10), "Ruined Spaceship", "A Ruined Starship, once a potentially glorious craft it has now been condemned to float destroyed in the ruinous Decay System. Chunks of debris likely full of salvageable resources follow in its wake, Following and studying the ruin could create quite the story. After some scans your ship informs you that you can mine and research the ruins. For 2% energy you could salvage what little remains from a piece of debris; however, you could use 4% energy to potentially figure out how such a ship met its end. If neither of these options intrigue you, you can move to leave at any time.");
}

//GameOver
void gameOver() {

  //background wipe
  background(#F58181);

  //game over sign
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(width/20);
  text("G A M E O V E R", 0, 0, width, height);
  textAlign(BASELINE);
}

//tutorial
void gameStart() {

  //background
  back4.resize(width, height);
  image(back4, 0, 0);

  //text for tutorial
  stroke(#4B4A4A);
  strokeWeight(2);
  fill(#818181);
  rect(width/5, height/3, width/1.66, height/2.5);
  textSize(width/100);
  textAlign(LEFT, CENTER);
  fill(0);
  text("Welcome to Solar Sailing, the epic space themed dodger/economy simulator! In this game you will control a top of the line personal spaceship which can do many tasks including mining, researching, boosting, and traveling faster than light! It can all seem very complicated so let’s go over the basics. Firstly, the spaceship follows the mouse at all times, you can move the spaceship to the mouse position by pressing the W key and make it travel even faster by pressing W and the SPACEBAR at the same time. To warp to different systems, you can press 1 which will take you to a new menu that allows you to click on the star you want to go to. Secondly let’s talk about resources. As the player you’ll have to manage 5 resources, these are Health, Energy, Cash, Ore, and Data. Health is your life, it can be lost by running out of power, running into stars, or hitting asteroids. If your Health bar runs out you lose. Energy is your ability to do things, moving, and gathering ore or data will deplete your Energy. Warping to different systems will cost 10% of your energy and if you lack that much energy you’ll be stuck in that system. Lucky for you Cash exist which can be used to Recharge and Repair Health and Energy. You can get cash by selling Ore and Data to civilized planets but how do you do this? Finally, we must talk about trading and gathering. By traveling over a planet and clicking anywhere on the screen you’ll open a menu to trade with or gather from that planet. This is the core feature of the game and figuring out the economy of it all is all up to you! Just press any key to play the game!", width/4.9, height/3, width/1.69, height/2.5); 
  //text bar for planet name 
  textAlign(CENTER, CENTER);
  stroke(#4B4A4A);
  strokeWeight(2);
  fill(#767675);
  rect(width/6, height/3, width/30, height/2.5);
  rect(width/5+width/1.66, height/3, width/31, height/2.5);
  triangle(width/3, height/4, width/6, height/3, width/3, height/3);
  triangle(width/1.5, height/4, width/1.5, height/3, width/1.2, height/3);
  rect(width/3, height/4, width/3, height/12);
  textSize(width/30);
  fill(0);
  text("SOLAR SAILING", width/3, height/4, width/3, height/12);
  textAlign(CENTER);

  if (keyPressed) {
    systems = 1;
  }
}
