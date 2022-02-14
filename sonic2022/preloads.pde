/**
 * override!
 * this disables the default "loop()" when using addScreen
 */

void addScreen(String name, Screen screen) {
  screenSet.put(name, screen);
  if (activeScreen == null) { activeScreen = screen; }
  else { SoundManager.stop(activeScreen); }
}

/* @pjs pauseOnBlur="true";
        font="fonts/snes.ttf";
        preload=" 

                  graphics/mute.gif,
                  graphics/unmute.gif,
                  

                  graphics/enemies/fiende1.png,
                  graphics/enemies/fiende2.png,

                  graphics/enemies/boss1.png,
                  graphics/enemies/boss2.png,

                  graphics/assorted/blomst1.png,
                  graphics/assorted/blomst2.png,
				  
                  graphics/assorted/tre.png, 

                  graphics/assorted/powerup.png,
                  graphics/assorted/maal.png,
                  graphics/assorted/coin.png,

                  graphics/assorted/musikken.png, 
                  graphics/assorted/brannfjell.png, 

                  graphics/assorted/pickup1.png,
                  graphics/assorted/pickup2.png,


                  graphics/backgrounds/ground-corner-left.png,
                  graphics/backgrounds/ground-corner-right.png,
                  graphics/backgrounds/ground-filler.png,
                  graphics/backgrounds/ground-side-left.png,
                  graphics/backgrounds/ground-side-right.png,
                  graphics/backgrounds/ground-top.png,

                  graphics/backgrounds/cave-corner-left.png,
                  graphics/backgrounds/cave-corner-right.png,
                  graphics/backgrounds/cave-filler.png,
                  graphics/backgrounds/cave-side-left.png,
                  graphics/backgrounds/cave-side-right.png,
                  graphics/backgrounds/cave-top.png,

                  graphics/backgrounds/skybakgrunn.png,


                  graphics/mario/vanlig/bend.png,
                  graphics/mario/vanlig/jump.png,
                  graphics/mario/vanlig/run.png,
                  graphics/mario/vanlig/stand.png,
                  graphics/mario/vanlig/win.png,
                  graphics/mario/vanlig/dead.png,

                  graphics/mario/super/bend.png, 
                  graphics/mario/super/jump.png, 
                  graphics/mario/super/run.png, 
                  graphics/mario/super/stand.png, 
                  graphics/mario/super/win.png,
                  graphics/mario/super/dead.png

"; */


