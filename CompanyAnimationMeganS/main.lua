-----------------------------------------------------------------------------------------
-- Title: CompanyLogoAnimation
-- Name: Megan.S
-- Course: ICS2O
-- This program will have an animation for the company logo. Once the program has started the 
-- logo will fall down from the top and make a crash sound
-----------------------------------------------------------------------------------------


-----------------------------------------------------------------------------------
-- CREATE THE LOCAL VARIABLES/ OBJECCT CREATION--
-----------------------------------------------------------------------------------

display.setStatusBar(display.HiddenStatusBar)


-- Create the background colour
display.setDefault( "background", 1, 1, 1  )

-- Set the image for the company logo and its variable
local Platelogo = display.newImage("Images/CompanyLogo.png", 0, 0 ) 

-- Set the (x,y) cordinates of the plate logo

Platelogo.x = display.contentWidth/2
Platelogo.y = display.contentHeight/2

Platelogo:scale(0.25, 0.25)


-- Create the local varibles for the sound effects
local CrashSound = audio.loadSound( "Sounds/CrashSound.mp3")
local CrashSoundChannel


