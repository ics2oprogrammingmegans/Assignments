-----------------------------------------------------------------------------------------
-- Title: AnimatingImages
-- Name: Megan.S
-- Course: ICS2O
-- In this program three images will be moving across the screen in the directions of up or down
-- right or left, and it will redirect itself in another direction once it touches the 
-- side of the screen 
-----------------------------------------------------------------------------------------

-- Create the local variables 
local background

local PlanetEarth

local Mountians

local Star

-- Create a scroll speed for all of the objects
scrollSpeed = 3

-- Create the galaxy background of the iPad Air
background = display.newImage("Images/Galaxy.png")

-- Hide the status bar on the iPad Air
display.setStatusBar(display.HiddenStatusBar)

-- Display the planet on the iPad Air
PlanetEarth = display.newImageRect("Images/PlanetEarth.png", 180, 150)

-- Set planet earth's coordinates on the iPad Air using the (x,y) format
PlanetEarth.x = 120
PlanetEarth.y = display.contentHeight/3

-- Display and create the Star on the iPad Air
Star = display.newImageRect("Images/Star.png", 180, 150)

-- Set the (x,y) coordinates for the Star
Star.x = 680
Star.y = display.contentHeight/5

-- Display and create the Mountians width and height on the iPad Air
 Mountians= display.newImageRect("Images/Mountians.png", 180, 150)

-- Set the coordinates of Mountians using the (x,y) format
Mountians.x = 400
Mountians.y = display.contentHeight/4

-- Make texts named after each object, and give them a colour
StarText = display.newText("Star", display.contentWidth*1/10, display.contentHeight*9/10, nil, 50 )

StarText:setTextColor(1, 1, 0)

PlanetEarthText = display.newText("PlanetEarth", display.contentWidth*8/10, display.contentHeight*1/10, nil, 50 )

PlanetEarthText:setTextColor(0, 1, 0)

MountiansText = display.newText("Mountians", display.contentWidth*2/10, display.contentHeight*1/10, nil, 50 )

MountiansText:setTextColor(1, 0, 1)

-- Create the local function for PlanetEarth, and make PlanetEarth slowly fade out
local function MovePlanetEarth( event )

	PlanetEarth.x = PlanetEarth.x + scrollSpeed

	PlanetEarth.alpha = PlanetEarth.alpha - 0.0001
end

-- Create the local function for Mountains, and make Mountians grow in size moving down
local function MoveMountians( event )

	Mountians.y = Mountians.y + scrollSpeed

	Mountians.width = Mountians.width + 1

	Mountians.height = Mountians.height + 1
end

-- Create the local function for Star, and make it travel diagonally
local function MoveStar( event )

	Star.x = Star.x + scrollSpeed

	Star.y = Star.y + scrollSpeed

	
end

-- Create the runtimes for each object
Runtime:addEventListener("enterFrame", MovePlanetEarth)

Runtime:addEventListener("enterFrame", MoveMountians)

Runtime:addEventListener("enterFrame", MoveStar)





