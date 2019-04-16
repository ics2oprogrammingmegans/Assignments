-----------------------------------------------------------------------------------------
-- Title: CompanyLogoAnimation
-- Name: Megan.S
-- Course: ICS2O
-- This program will have an animation for the company logo. Once the program has started the 
-- logo will fall down from the top and make a crash sound
-----------------------------------------------------------------------------------------


--------------------CREATE THE LOCAL VARIABLES/ OBJECT CREATION--------------------------


display.setStatusBar(display.HiddenStatusBar)


-- Create the background colour
display.setDefault( "background", 1, 1, 1  )

-- Set the image for the company logo and its variable
local Platelogo = display.newImage("Images/CompanyLogo.png", 0, 0 ) 

-- Create the visiblility
Platelogo.alpha = 1

-- Set the scale of the logo
Platelogo:scale(0.25, 0.25)

-- Set the (x,y) cordinates of the plate logo
Platelogo.x = display.contentWidth/2
Platelogo.y = display.contentHeight*1/10

-- Create the local varibles for the sound effects
local CrashSound = audio.loadSound( "Sounds/CrashSound.mp3")

local CrashSoundChannel

----------------------------FUNCTIONS FOR THE LOGO --------------------------------------

-- Create the Sound function
local function Sound()

	CrashSoundChannel = audio.play(CrashSound)
end

-- Move the plate to the middle of the screen form the top
transition.moveTo( Platelogo, {x = display.contentWidth/2, y = display.contentHeight/2 , time = 1500})

Platelogo.alpha = Platelogo.alpha - 0.01


-- Play the crash sound
timer.performWithDelay(150, Sound)
--[[
-- Have the logo fade out 
transition.fadeOut( Platelogo, { time = 4500 } )

--]]
-----------------------------------------------------------------------------------------




