// BAKGRUNNSFARGE OG FONT

int rod=0;
int gron=100;
int bla=190;

snesFont = createFont("fonts/snes.ttf", 32);













// HOVEDOMRADET START ----------------------------------------------------


class MainLevelLayer extends MarioLayer {
  MainLevelLayer(Level owner) {
    super(owner);
	
// START POENGSUM

score=0;

    setBackgroundColor(color(rod, gron, bla));
    addBackgroundSprite(new TilingSprite(new Sprite("graphics/backgrounds/skybakgrunn.png"),0,0,width,height));

// VEGGER

    addBoundary(new Boundary(-1,0, -1,height));
    addBoundary(new Boundary(width+1,height, width+1,0));

// dersom du vil se grenser kan du ta bort strekene pa denne
//showBoundaries = true;





// ----
// ---- HER KAN DU ENDRE PÅ HVOR DE ULIKE TINGENE SKAL KOMME PÅ BANEN ----
// ----





// FIENDER

Fiende1 fiende1 = new Fiende1(BLOCK*35, 150);
addInteractor(fiende1);

Fiende1 fiende1 = new Fiende1(BLOCK*60, 150);
addInteractor(fiende1);

Fiende2 fiende2 = new Fiende2(BLOCK*100, 150);
addInteractor(fiende2);

Fiende2 fiende2 = new Fiende2(BLOCK*150, 150);
addInteractor(fiende2);


addSkole(BLOCK*34, height-48);

addBlomst(BLOCK*40, height-48);

//powerup
addForPlayerOnly(new Powerup(BLOCK*23,height-(BLOCK*11+16) ));
addGroundPlatform("ground", BLOCK*20, height-BLOCK*11, BLOCK*6, height);
addGroundPlatform("ground", BLOCK*21, height-BLOCK*7, BLOCK*12, height);


// Pickup1 og Pickup2 er gutten og jenta pa taket

addForPlayerOnly(new Pickup1(BLOCK*40,height-(BLOCK*18+24) ));

addForPlayerOnly(new Pickup2(BLOCK*45,height-(BLOCK*18+24) ));


addTre(BLOCK*84, height-32);

addBlomst(BLOCK*66, height-48);

addBlomstto(BLOCK*76, height-48);


addMusikken(BLOCK*90, height-48);

addGroundPlatform("ground", BLOCK*100, height-BLOCK*6, BLOCK*4, height);


addTre(BLOCK*126, height-48);


//powerup
addForPlayerOnly(new Powerup(BLOCK*138,height-(BLOCK*11+16) ));
addGroundPlatform("ground", BLOCK*135, height-BLOCK*11, BLOCK*6, height);
addGroundPlatform("ground", BLOCK*136, height-BLOCK*7, BLOCK*12, height);

addCoins(BLOCK*150, height-BLOCK*5-12,BLOCK*4);


addTre(BLOCK*164, height-48);


// sjefen og usynlige sperrer som gjor at han snur

Boss boss = new Boss(BLOCK*200, height-224);
addInteractor(boss);

addBoundary(new Boundary(BLOCK*180, height-224, BLOCK*180, height-220));
addBoundary(new Boundary(BLOCK*240, height-220, BLOCK*240, height-224));


// hoppeplattformene ved sjefen

addGroundPlatform("ground", BLOCK*175, height-BLOCK*18, BLOCK*9, height);

addGroundPlatform("ground", BLOCK*190, height-BLOCK*18, BLOCK*9, height);

addGroundPlatform("ground", BLOCK*205, height-BLOCK*18, BLOCK*9, height);

addGroundPlatform("ground", BLOCK*220, height-BLOCK*18, BLOCK*9, height);

addGroundPlatform("ground", BLOCK*235, height-BLOCK*18, BLOCK*9, height);


addForPlayerOnly(new Pickup1(BLOCK*225,height-(BLOCK*18+24) ));

addForPlayerOnly(new Pickup2(BLOCK*240,height-(BLOCK*18+24) ));


addGroundPlatform("ground", BLOCK*173, height-BLOCK*14, BLOCK*7, height);


addGroundPlatform("ground", BLOCK*175, height-BLOCK*10, BLOCK*9, height);
addCoins(BLOCK*175, height-BLOCK*10-12,BLOCK*9);

addGroundPlatform("ground", BLOCK*190, height-BLOCK*10, BLOCK*9, height);
addCoins(BLOCK*190, height-BLOCK*10-12,BLOCK*9);

addGroundPlatform("ground", BLOCK*205, height-BLOCK*10, BLOCK*9, height);
addCoins(BLOCK*205, height-BLOCK*10-12,BLOCK*9);

addGroundPlatform("ground", BLOCK*220, height-BLOCK*10, BLOCK*9, height);
addCoins(BLOCK*220, height-BLOCK*10-12,BLOCK*9);

addGroundPlatform("ground", BLOCK*172, height-BLOCK*6, BLOCK*7, height);


//powerup
addForPlayerOnly(new Powerup(BLOCK*250,height-(BLOCK*11+16) ));
addGroundPlatform("ground", BLOCK*247, height-BLOCK*11, BLOCK*6, height);
addGroundPlatform("ground", BLOCK*249, height-BLOCK*7, BLOCK*12, height);


addCoins(BLOCK*264, height-BLOCK*5-12,BLOCK*4);


// malskiltet
addGoal(BLOCK*280,height-48);





// hele bakken fra utenfor skjermen 48 pixler hoy
addGround("ground", -32, height-48, width+32, height);



  }
}


// HOVEDOMRADET SLUTT ----------------------------------------------------














// PICKUPS START ----------------------------------------------------



class MarioPickup extends Pickup {
  MarioPickup(String name, String spritesheet, int rows, int columns, float x, float y, boolean visible) {
    super(name, spritesheet, rows, columns, x, y, visible);
  }
  // default horizontal bounce
  void gotBlocked(Boundary b, float[] intersection, float[] original) {
    if (b.x==b.xw) {
      ix = -original[0];
      fx = -fx;
      active.sprite.flipHorizontal();
      detachFrom(b);
    }
  }
}




// ----
// ---- HER ER DE ULIKE TINGENE DU KAN FA POENG FOR I SPILLET ELLER GJOR NOE ----
// ----



// tallet bak: 1, 4 betyr at den veksler mellom 4 frames i bildet, altså animert



// COIN ELLER RING

class Coin extends MarioPickup {
  Coin(float x, float y) {
    super("Regular coin", "graphics/assorted/coin.png", 1, 4, x, y, true);
    SoundManager.load(this, "audio/coin.mp3");
  }
  void pickedUp() { 
    SoundManager.play(this);
  }
}



//POWERUP - sonicmaskin

class Powerup extends MarioPickup {
  Powerup(float x, float y) {
    super("Powerup", "graphics/assorted/powerup.png", 1, 1, x, y, true);
    SoundManager.load(this, "audio/powerup.mp3");
  }
  void pickedUp() { 
    SoundManager.play(this);
  }
}



//PICKUP1 - vinkegutt

class Pickup1 extends MarioPickup {
  Pickup1(float x, float y) {
    super("Pickup1", "graphics/assorted/pickup1.png", 1, 4, x, y, true);
    SoundManager.load(this, "audio/pickup.mp3");
  }
  void pickedUp() { 
    SoundManager.play(this);
  }
}



//PICKUP2 - vinkejente

class Pickup2 extends MarioPickup {
  Pickup2(float x, float y) {
    super("Pickup2", "graphics/assorted/pickup2.png", 1, 4, x, y, true);
    SoundManager.load(this, "audio/pickup.mp3");
  }
  void pickedUp() { 
    SoundManager.play(this);
  }
}



// FINISH LINE

class Rope extends MarioPickup {
  Rope(float x, float y) {
    super("Finish line", "graphics/assorted/maal.png", 1, 1, x, y, true);
    State st = getState("Finish line");
    Sprite spr = st.sprite;
    spr.align(LEFT, TOP);
    SoundManager.load(this, "audio/ferdig.mp3");
  }
  void pickedUp() {
    // stop background music!
    SoundManager.stop(getLevelLayer().getLevel());
    // play victory music!
    SoundManager.play(this);
  }
}



// PICKUPS SLUTT ----------------------------------------------------















abstract class MarioEnemy extends Interactor {
  MarioEnemy(String name) { super(name); } 
  MarioEnemy(String name, float x, float y) { super(name, x, y); } 
}
abstract class BoundedMarioEnemy extends BoundedInteractor {
  BoundedMarioEnemy(String name) { super(name); } 
  BoundedMarioEnemy(String name, float x, float y) { super(name, x, y); } 
}










// ----
// ---- HER ER SJEFEN OG DE TO ANDRE FIENDENE ----
// ----



// tallet bak: 1, 4 betyr at den veksler mellom 4 frames i bildet, altså animert






// START PÅ SJEFEN

class Boss extends MarioEnemy {

  Boss(float x, float y) {
    super("Boss Trooper");
    setStates();
    setForces(-1.5, 0);    
    setImpulseCoefficients(DAMPENING, DAMPENING);
    setPosition(x,y);
  }

  void setStates() {

// NAR MAN FORST MOTER SJEFEN

    State walking = new State("idle", "graphics/enemies/boss1.png", 1, 2);
    walking.setAnimationSpeed(0.5);
    SoundManager.load(walking, "audio/squish.mp3");
    addState(walking);
    
// ETTER A HA TATT SJEFEN EN GANG

    State naked = new State("naked", "graphics/enemies/boss2.png", 1, 2);
    naked.setAnimationSpeed(0.8);
    SoundManager.load(naked, "audio/squish.mp3");
    addState(naked);
    
    setCurrentState("idle");
  }

  void gotBlocked(Boundary b, float[] intersection, float[] original) {
    if (b.x==b.xw) {
      ix = -ix;
      fx = -fx;
      setHorizontalFlip(fx > 0);
    }
  }
  
  void hit() {
    SoundManager.play(active);

    // gjor at man ma ta sjefen to ganger -naked- er uten beskyttelse

    if (active.name != "naked") {
      setCurrentState("naked");
      return;
    }
    
    removeActor();
    score+=100;
  }
}

// SLUTT PÅ SJEFEN






// START PÅ FIENDE1 - vanlig gaende fiende

class Fiende1 extends MarioEnemy {

  Fiende1(float x, float y) {
    super("Fiende1 Trooper");
    setStates();
    setForces(-0.25, DOWN_FORCE);    
    setImpulseCoefficients(DAMPENING, DAMPENING);
    setPosition(x,y);
  }

  void setStates() {

// NAR MAN FORST MOTER FIENDEN

    State walking = new State("idle", "graphics/enemies/fiende1.png", 1, 4);
    walking.setAnimationSpeed(0.12);
    SoundManager.load(walking, "audio/bump.mp3");
    addState(walking);
    
    // etter man har tatt fienden en gang (her lik - se lengre ned)

    State naked = new State("naked", "graphics/enemies/fiende1.png", 1, 4);
    naked.setAnimationSpeed(0.12);
    SoundManager.load(naked, "audio/bump.mp3");
    addState(naked);
    
    setCurrentState("idle");
  }

  void gotBlocked(Boundary b, float[] intersection, float[] original) {
    if (b.x==b.xw) {
      ix = -ix;
      fx = -fx;
      setHorizontalFlip(fx > 0);
    }
  }
  
  void hit() {
    SoundManager.play(active);

    // hvis du vil at man ma ta fienden to ganger kan man ta med

    //if (active.name != "naked") {
    // setCurrentState("naked");
    //  return;
    //}

    removeActor();
    score+=10;
  }
}

// SLUTT PÅ FIENDE1






// FIENDE2 - vanlig gaende fiende

class Fiende2 extends MarioEnemy {

  Fiende2(float x, float y) {
    super("Fiende2 Trooper");
    setStates();
    setForces(-0.40, DOWN_FORCE);    
    setImpulseCoefficients(DAMPENING, DAMPENING);
    setPosition(x,y);
  }

  void setStates() {

// NAR MAN FORST MOTER FIENDEN

    State walking = new State("idle", "graphics/enemies/fiende2.png", 1, 4);
    walking.setAnimationSpeed(0.12);
    SoundManager.load(walking, "audio/bump.mp3");
    addState(walking);
    
    // etter man har tatt fienden en gang (her lik - se lengre ned)

    State naked = new State("naked", "graphics/enemies/fiende2.png", 1, 4);
    naked.setAnimationSpeed(0.12);
    SoundManager.load(naked, "audio/bump.mp3");
    addState(naked);
    
    setCurrentState("idle");
  }

  void gotBlocked(Boundary b, float[] intersection, float[] original) {
    if (b.x==b.xw) {
      ix = -ix;
      fx = -fx;
      setHorizontalFlip(fx > 0);
    }
  }
  
  void hit() {
    SoundManager.play(active);

    // hvis du vil at man ma ta fienden to ganger kan man ta med

    //if (active.name != "naked") {
    // setCurrentState("naked");
    //  return;
    //}

    removeActor();
    score+=10;
  }
}

// SLUTT PÅ FIENDE2






// SLUTT PA FIENDER









// START PÅ SPILLER --------------------------------------------------

class Mario extends Player {

  boolean canShoot = false;
  String spriteSet = "mario";
  String type = "vanlig";
  float mariospeed = 2;

Mario() 
{
    super("Mario");
    setupStates(spriteSet, type);
    setCurrentState("idle");

    handleKey('W');
    handleKey('A');
    handleKey('S');
    handleKey('D');
    
// forces that act on Mario - eventuelt foreste damp til 0

    setImpulseCoefficients(DAMPENING, DAMPENING);
    setForces(0, DOWN_FORCE);
    setAcceleration(0, ACCELERATION);

}

  void setSpriteSet(String setName) {
    spriteSet = setName;
    setupStates(spriteSet,type);
  }

  void setSpriteType(String typeName) {
    type = typeName;
    setupStates(spriteSet,type);
  }
  
  // make sure all states are center/bottom anchored

  void addState(State st) {
    st.sprite.anchor(CENTER, BOTTOM);
    super.addState(st);
  }



// DE ULIKE TYPENE


void setupStates(String spriteSet, String type) {
// idling state
addState(new State("idle", "graphics/"+spriteSet+"/"+type+"/stand.png"));

// crouching state
addState(new State("crouching", "graphics/"+spriteSet+"/"+type+"/bend.png"));


// HER ER FARTEN PÅ DEN RASKE VERSJONEN

if(type == "super") {
addState(new State("running", "graphics/"+spriteSet+"/"+type+"/run.png", 1, 4));
mariospeed=3.5;
}
else
{
addState(new State("running", "graphics/"+spriteSet+"/"+type+"/run.png", 1, 4));
mariospeed=2;
}


    // dead state
    if(type == "vanlig") {

      State dead = new State("dead", "graphics/"+spriteSet+"/"+type+"/dead.png", 1, 2);
      dead.setAnimationSpeed(0.25);
      dead.setDuration(250);
      addState(dead);   
      SoundManager.load(dead, "audio/gameover.mp3");
    }

    // jumping state

    State jumping = new State("jumping", "graphics/"+spriteSet+"/"+type+"/jump.png", 1, 4);
    jumping.setDuration(15);
    addState(jumping);
SoundManager.load(jumping, "audio/jump.mp3");

    // crouchjumping state

    State crouchjumping = new State("crouchjumping", "graphics/"+spriteSet+"/"+type+"/bend.png");
    crouchjumping.setDuration(15);
    addState(crouchjumping);
SoundManager.load(crouchjumping, "audio/jump.mp3");

    // victorious state

    State won = new State("won", "graphics/"+spriteSet+"/"+type+"/win.png");
    won.setDuration(240);
    addState(won);
    
    // being hit requires a sound effect too
    SoundManager.load("mario hit", "audio/bump.mp3");
  }



// KEYBOARD INPUT

  void handleInput() {
    if (spriteSet == "mario") {
      handleMarioInput();
    }
  }

  void handleMarioInput() {
    // we don't handle any input when we're dead~
    if (active.name=="dead" || active.name=="won") return;

    // what do we "do"? (i.e. movement wise)
    if (active.name!="crouching" && (isKeyDown('A') || isKeyDown('D'))) {
      if (isKeyDown('A')) {
        // when we walk left, we need to flip the sprite
        setHorizontalFlip(true);
        // walking left means we get a negative impulse along the x-axis:
        addImpulse(-mariospeed, 0);
        // and we set the viewing direction to "left"
        setViewDirection(-1, 0);
      }
      if (isKeyDown('D')) {
        // when we walk right, we need to NOT flip the sprite =)
        setHorizontalFlip(false);
        // walking right means we get a positive impulse along the x-axis:
        addImpulse(mariospeed, 0);
        // and we set the viewing direction to "right"
        setViewDirection(1, 0);
      }
    }


    // if the jump key is pressed, and we're standing on something, let's jump! 
    if (active.mayChange() && isKeyDown('W') && boundaries.size()>0) {
      ignore('W');
     
 // generate a massive impulse upward ENDRET FRA 35 til 40 da jeg er storre enn MARIO
    
  addImpulse(0, -40);
      // and make sure we look like we're jumping, too
      if (active.name!="crouching") {
        setCurrentState("jumping");
      } else {
        setCurrentState("crouchjumping");
      }
      SoundManager.play(active);
    }

    // if we're not jumping, but left or right is pressed,
    // make sure we're using the "running" state.
    
if (isKeyDown('S')) {

      if (active.name=="jumping") {
        setCurrentState("crouchjumping");
      } else {
        setCurrentState("crouching");
      }
    }

    // and what do we look like when we do this?
    if (active.mayChange())
    {
      if (active.name!="crouching" && (isKeyDown('A') || isKeyDown('D'))) {
       setCurrentState("running");
      }

      // if we're not actually doing anything,
      // then we change the state to "idle"
      else if (noKeysDown()) {
        setCurrentState("idle");
      }
    }
  }


  void handleStateFinished(State which) {
    if (which.name == "dead" || which.name == "won") {
      removeActor();
      reset();
    } 
    else { setCurrentState("idle"); }
  }

/**
* What happens when we touch another actor?
*/

  void overlapOccurredWith(Actor other, float[] direction) {
    if (other instanceof MarioEnemy) {
      MarioEnemy enemy = (MarioEnemy) other;
      float angle = direction[2];

      
// HOPPE PA FIENDE - ORIGINAL MARIO HADDE RADIANS 75, STOR 45, MINDRE 60

      float tolerance = radians(60);
      if (PI/2 - tolerance <= angle && angle <= PI/2 + tolerance) {
        enemy.hit();
        stop(0, 0);
        setImpulse(0, -30);
        if (spriteSet == "mario") {
          setCurrentState("jumping");
        }
      }

      // Oh no! We missed and touched a koopa!
      else { hit(); }
    }
  }
  
// Endret ved a sette inn false på canshoot

  void hit() {
    if(isDisabled()) return; 
    if(type != "vanlig") {
      setSpriteType("vanlig");

        setForces(0, DOWN_FORCE);
        setAcceleration(0, ACCELERATION);
        setImpulseCoefficients(DAMPENING, DAMPENING);

canShoot = false;

      disableInteractionFor(30);
      SoundManager.play("mario hit");
      return;
    }
    // else:
    die();
  }

// NAR VI DOR

  void die() {
    setCurrentState("dead");
    setInteracting(false);
    setImpulse(0, -30);
    setForces(0, 3);
    // stop background music!
    SoundManager.stop(getLevelLayer().getLevel());
    // play sad music
    SoundManager.play(active);
  }



// POENG VED PICKUP OG COIN

void pickedUp(Pickup pickup) 

{

if (pickup.name=="Regular coin") {score++;}
else if (pickup.name=="Pickup1") {score+=100;}
else if (pickup.name=="Pickup2") {score+=100;}
    



// POWERUP gjor deg til super - se mappen super - kan endre for a sveve eller fly

else if (pickup.name=="Powerup") 
{
      setSpriteType("super");
      canShoot = false;
      disableInteractionFor(0);
        setForces(0, 2);
        setAcceleration(0, 1.3);
        setImpulseCoefficients(0.75, 0.75);
}

// VI VINNER
    
else if (pickup.name=="Finish line") 
{
      spriteSet = "mario";
      Level level = layer.getLevel();
      setCurrentState("won");
      layer.parent.finish();
}

}
  
  
}

// SLUTT PÅ SPILLER --------------------------------------------------













// START DIVERSE OPPSETT AV OMRADER


class MainLevel extends MarioLevel {
  MainLevel(float levelWidth, float levelHeight) {
    super(levelWidth, levelHeight);

    LevelLayer layer = new MainLevelLayer(this);
    addLevelLayer("main layer", layer);
    

// SPILLER KOMMER INN UTENFOR SKJERMEN -100

mario.setPosition(64, -100);
    layer.addPlayer(mario);

    SoundManager.load(this, "audio/musikk.mp3");
  }

  void end() {
    SoundManager.pause(this);
    super.end();
  }

  void finish() {
    SoundManager.pause(this);
    super.finish();
  }  
}

// SLUTT DIVERSE OPPSETT AV OMRADER







// START HOVEDOPPSETT


final int BLOCK = 16,

          screenWidth = 32*BLOCK,
          screenHeight = 27*BLOCK;


// HER SETTER MAN GRAVITASJON, AKSELERASJON OG BREMSESKRENS

float DOWN_FORCE = 2;
float ACCELERATION = 1.3;
float DAMPENING = 0.75;


void initialize() {
  SoundManager.mute(true);
  SoundManager.setDrawPosition(screenWidth-32,16);

frameRate(30);
  reset();
}

// HER ER HOYDEN OG VIDDEN PA NIVAENE - ORIGINALT 9 GANGE WIDTH

void reset() {
clearScreens();
addScreen("Main Level", new MainLevel(9*width, height));  
  if(javascript != null) { javascript.reset(); }
  setActiveScreen("Main Level");
}


// SLUTT HOVEDOPPSETT










// OBJEKTENE I VERDENEN START -------------------------------------------------



class MarioLayer extends LevelLayer {

  MarioLayer(Level owner) {this(owner, owner.width, owner.height, 0,0,1,1);}
  MarioLayer(Level owner, float w, float h, float ox, float oy, float sx, float sy) {super(owner,w,h,ox,oy,sx,sy);}
  


// HVORDAN BAKKEN BYGGES OPP

  void addGround(String tileset, float x1, float y1, float x2, float y2) {
    TilingSprite groundline = new TilingSprite(new Sprite("graphics/backgrounds/"+tileset+"-top.png"), x1,y1,x2,y1+16);
    addBackgroundSprite(groundline);
    TilingSprite groundfiller = new TilingSprite(new Sprite("graphics/backgrounds/"+tileset+"-filler.png"), x1,y1+32,x2,y2);
    addBackgroundSprite(groundfiller);
    addBoundary(new Boundary(x1,y1+1,x2,y1+1));
  }
  
// OPP NED BAKKE TIL TAK I HULER

  void addUpsideDownGround(String tileset, float x1, float y1, float x2, float y2) {
    TilingSprite groundfiller = new TilingSprite(new Sprite("graphics/backgrounds/"+tileset+"-filler.png"), x1,y1,x2,y2-16);
    addBackgroundSprite(groundfiller);
    Sprite topLayer = new Sprite("graphics/backgrounds/"+tileset+"-top.png");
    topLayer.flipVertical();
    topLayer.flipHorizontal();
    TilingSprite groundline = new TilingSprite(topLayer, x1,y2-16,x2,y2);
    addBackgroundSprite(groundline);
    addBoundary(new Boundary(x2,y2,x1,y2));
  }





// KODE FOR A LASTE DE ULIKE OBJEKTENE 



// BRANNFJELL SKOLE

void addSkole(float x, float y) {
    Sprite skole = new Sprite("graphics/assorted/brannfjell.png");
    skole.align(LEFT, BOTTOM);
    skole.setPosition(x, y);
    addBackgroundSprite(skole);
addBoundary(new Boundary(x,y-240+1,x+416,y-240+1));
addBoundary(new Boundary(x+416,y-256+1,x+768,y-256+1));
//addCoins(x+409,y-261,352);
addBoundary(new Boundary(x+768,y-240+1,x+1344,y-240+1));
}


// MUSIKKEN

void addMusikken(float x, float y) {
    Sprite musikken = new Sprite("graphics/assorted/musikken.png");
    musikken.align(LEFT, BOTTOM);
    musikken.setPosition(x, y);
    addBackgroundSprite(musikken);
addBoundary(new Boundary(x,y-112+1,x+464,y-112+1));
addCoins(x,y-124,464);
}


// TREET

void addTre(float x, float y) {
    Sprite tre = new Sprite("graphics/assorted/tre.png");
    tre.align(LEFT, BOTTOM);
    tre.setPosition(x, y);
    addBackgroundSprite(tre);
//Skra gar fra 0til26 sa 26til55 sa 55til80 som er bredden
addBoundary(new Boundary(x,y-tre.height+26,x+26,y-tre.height));
addBoundary(new Boundary(x+26,y-tre.height+1,x+55,y-tre.height+1));
addBoundary(new Boundary(x+55,y-tre.height,x+80,y-tre.height+26));
}


// BLOMST 1 ANIMERT - TA VEKK ,1,2 OM IKKE ANIMERT

void addBlomst(float x, float y) {
    Sprite blomst = new Sprite("graphics/assorted/blomst1.png",1,2);
    blomst.align(LEFT, BOTTOM);
    blomst.setPosition(x, y);
    addBackgroundSprite(blomst);
}


// BLOMST 2

void addBlomstto(float x, float y) {
    Sprite blomstto = new Sprite("graphics/assorted/blomst2.png");
    blomstto.align(LEFT, BOTTOM);
    blomstto.setPosition(x, y);
    addBackgroundSprite(blomstto);
}


// MÅL GOAL

  // And finally, the end of the level!
  void addGoal(float xpos, float hpos) {
    hpos += 1;
    // the finish line rope
    addForPlayerOnly(new Rope(xpos, hpos-48));
  }


// PLATFORMENE

  void addGroundPlatform(String tileset, float x, float y, float w, float h) {
    // top layer
    Sprite lc = new Sprite("graphics/backgrounds/"+tileset+"-corner-left.png");
    lc.align(LEFT, TOP);
    lc.setPosition(x, y);
    Sprite tp = new Sprite("graphics/backgrounds/"+tileset+"-top.png");
    Sprite rc = new Sprite("graphics/backgrounds/"+tileset+"-corner-right.png");
    rc.align(LEFT, TOP);
    rc.setPosition(x+w-rc.width, y);
    TilingSprite toprow = new TilingSprite(tp, x+lc.width, y, x+(w-rc.width), y+tp.height);

    addBackgroundSprite(lc);
    addBackgroundSprite(toprow);
    addBackgroundSprite(rc);

    TilingSprite sideleft  = new TilingSprite(new Sprite("graphics/backgrounds/"+tileset+"-side-left.png"),  x,            y+tp.height, x+lc.width,     y+h);
    TilingSprite filler    = new TilingSprite(new Sprite("graphics/backgrounds/"+tileset+"-filler.png"),     x+lc.width,   y+tp.height, x+(w-rc.width), y+h);
    TilingSprite sideright = new TilingSprite(new Sprite("graphics/backgrounds/"+tileset+"-side-right.png"), x+w-rc.width, y+tp.height, x+w,            y+h);

    addBackgroundSprite(sideleft);
    addBackgroundSprite(filler);
    addBackgroundSprite(sideright);

    // boundary to walk on
    addBoundary(new Boundary(x, y+1, x+w, y+1));
  }

  // add coins over a horizontal stretch  
  void addCoins(float x, float y, float w) {
    float step = 16, i = 0, last = w/step;
    for(i=0; i<last; i++) {
      addForPlayerOnly(new Coin(x+8+i*step,y));
    }
  }



}

// OBJEKTENE I VERDENEN SLUTT -------------------------------------------------













// THE END START -------------------



// HER KAN DU ENDRE TEKSTEN FRA GRATULERER TIL DET DU VIL

class MarioLevel extends Level {
  Player mario;
  String wintext = "IMPOSTER WINS";
  int endCount = 0;

  MarioLevel(float w, float h) { 
    super(w, h);

    setViewBox(0,0,screenWidth,screenHeight);
    mario = new Mario();    
  }
  
  void updateMario(Player mario_new) {
    updatePlayer(mario, mario_new);
    mario = mario_new;
  }



  void draw() {
    if (!finished) {
      super.draw();
      viewbox.track(this, mario);

      textFont(snesFont);
      fill(0,0,0);
      text(score, viewbox.x+34, viewbox.y+34);
      fill(255,255,255);
      text(score, viewbox.x+32, viewbox.y+32);

      if(mario.active!=null && mario.active.name!="dead" && (mario.x<-200 || mario.x>mario.layer.width+200 || mario.y<-200 || mario.y>mario.layer.height+400)) {
        reset();
        return;
      }
    }   
	
    else {
      endCount++;
      fill(255);
      textFont(snesFont);
      textAlign(CENTER);
      
	  
// HER ER SLUTTTEKSTEN OG POENGENE, 7.5 ER TIDEN MUSIKKEN SPILLER	  
	  
      text(wintext, 256, 185);
      textFont(snesFont);
      text("Score: "+score, 256, 235);

      fill(0, 8);
      rect(-1, -1, width+2, height+2);
      if (endCount>7.5*frameRate) {
        SoundManager.stop(this);
        reset();
      }
    }
  }
}

// THE END SLUTT -------------------














