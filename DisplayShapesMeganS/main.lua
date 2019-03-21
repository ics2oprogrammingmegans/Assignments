-----------------------------------------------------------------------------------------
-- Title: DisplayShapes
-- Name: Megan.S
-- Course: ICS2O
-- This program displays 3 shapes on the iPad air of different colours with borders. 
-- Underneath each shape is the name of it. For all of the shapes will display the area.
-----------------------------------------------------------------------------------------

-- Create the local variables for the text size of the shapes
local textSize = 25
local textSizeQuad = 20

-- Create local variables for the pentagon, quadrilateral, and triangle.
-- Also set each shape's vertices 
local areaTextOfTriangle
local myTriangle 
local areaOfTriangle
local verticesTriangle = {-400, -20, -180, -20, -290, -200}
local myTriangle
local verticesTriangle = {-400, -20, -180, -20, -290, -200 }

local baseOfTriangle = 17
local heightOfTriangle = 30
local areaOfTriangle

-- Add a variable for the triangle to  make it gradient 
local paintTriangle = {
    type = "gradient",
    color1 = { 127/255, 1, 212/255 },
    color2 = { 25 /255, 25/255, 112/255 },
    direction = "up"
}

local areaTextOfPentagon
local mypentagon
local areaOfPentagon
local verticesPentagon = { -25,-35, 40 ,-110, 108,-35, 70, 30, 13, 30 }
local pentagonBase = 10
local pentagonHeight = 15


local verticesQuadrilateral = {55, -230, -50, -150, 55, -30, 163, -150 }
local areaOfQuadrilateralTriangle1
local baseOfQuad1 = 11
local heightOfQuad1 = 20 
local areaOfQuadrilateralTriangle2
local baseOfQuad2 = 11
local heightOfQuad2 = 33
local areaOfQuadrialteral
local myquadrilateral

local textSizeQuad = 25
local areaTextOfQuadrilateral 

-- Set the quadrilateral to display music notes inside the shape
local paintQuad = {
    type = "image",
    filename = "musicnotes.png"
}

-- Hide the status bar on the iPad Air
display.setStatusBar(display.HiddenStatusBar)

-- Make a background colour, and display the colour on the iPad Air 
display.setDefault("background", 1, 153/255, 153/255)

-- Create the pentagon, and display it on the iPad Air 
mypentagon = display.newPolygon(0, 0, verticesPentagon)

-- Anchor the pentagon with the cordinates of (x,y)
mypentagon.anchorX = 0
mypentagon.anchorY = 0
mypentagon.x = 130
mypentagon.y = 125

-- Set the colour of the pentagon
mypentagon:setFillColor(229/255, 204/255, 1)

-- Make a border for the pentagon
mypentagon:setStrokeColor(0, 0, 0)

-- Make the stroke width for the pentagon
mypentagon.strokeWidth = 8

-- Calculate the area of the pentagon, by using the equation area = base * height/2 * 5
areaOfPentagon = pentagonBase * pentagonHeight/2 * 5

-- Display the area of the pentagon to the iPad Air
areaTextOfPentagon = display.newText("The area of this pentagon with a base of \n" ..
	pentagonBase .. " and a height of " .. pentagonHeight .. " is " .. 
	areaOfPentagon .. " pixels².", 0, 0, Arial, textSize)

-- Anchor the text in its (x,y) position for the pentagon
areaTextOfPentagon.anchorX = 0
areaTextOfPentagon.anchorY = 0
areaTextOfPentagon.x = 20
areaTextOfPentagon.y = 280

-- Add colour to the pentagon area text 
areaTextOfPentagon:setTextColor(0, 0, 0)
--------------------------------------------------------------------------------------

-- Create a quadrilateral, and display it on the iPad Air 
myquadrilateral = display.newPolygon(0, 0, verticesQuadrilateral) 

 -- Anchor the quadrilateral, and place it on the iPad Air using the (x,y) coordinates
 myquadrilateral.anchorX = 0
 myquadrilateral.anchorY = 0
 myquadrilateral.x = 390
 myquadrilateral.y = 350

 -- Calculate the area of the quadrilateral using the formula area = base * height/2
areaOfQuadrilateralTriangle1 = baseOfQuad1 * heightOfQuad1/2
areaOfQuadrilateralTriangle2 = baseOfQuad2 * heightOfQuad2/2
areaOfQuadrilateral = areaOfQuadrilateralTriangle2 + areaOfQuadrilateralTriangle1


-- Display the area of the Quadrilateral on the iPad Air
areaTextOfQuadrilateral = display.newText("The area of this quadrilateral has two " .. 
	"triangles. In the first quadrilateral has a base of \n" .. baseOfQuad1 .. 
	" and a height of " .. heightOfQuad1 .. " equals " .. areaOfQuadrilateralTriangle1 
	.. " pixels². Plus triangle two's height " ..  heightOfQuad2 .. " and a base of \n" 
	.. baseOfQuad2 .. " equals " .. areaOfQuadrilateralTriangle2 .. " pixels². " .. 
	"Together has a total area of " .. areaOfQuadrilateral .. " pixels². " , 0, 0, 
	Arial, textSizeQuad)

-- Anchor the text in its (x,y) position for the quadrilateral
areaTextOfQuadrilateral.anchorX = 0
areaTextOfQuadrilateral.anchorY = 0 
areaTextOfQuadrilateral.x = 10
areaTextOfQuadrilateral.y = 560

-- Add colour to the text for the quadrilateral
areaTextOfQuadrilateral:setFillColor(0, 0, 0)

-- Fill the quadrilateral with the music note image
myquadrilateral.fill = paintQuad

-- Make the stroke width to the quadrilateral
myquadrilateral.strokeWidth = 8

-- Add the colour black to the stroke width of the quadrilateral
myquadrilateral:setStrokeColor(0, 0, 0)

-------------------------------------------------------------------------------------

-- Create a triangle, and display it on the iPad Air
mytriangle = display.newImage(0, 0, verticesTriangle)

-- Anchor the triangle, and place it on the iPad Air using the (x,y) coordinates
myTriangle.anchorX = 0
myTriangle.anchorY = 0
myTriangle.x = 690
myTriangle.y = 87

-- Create a stroke width for the triangle
myTriangle.strokeWidth = 8

-- Add the colour black to the stroke width of the triangle
myTriangle:setStrokeColor(0, 0, 0)

-- Add a gradient colour to the triangle, and display it on the iPad Air
myTriangle.fill = paintTriangle

-- Add a colour to the triangle, and display it on the iPad Air
myTriangle:setFillColor(102/255, 102,255, 1)

-- Create a stroke width for the triangle
myTriangle.strokeWidth = 8

-- Add the colour black to the stroke width of the triangle
myTriangle:setStrokeColor(0, 0, 0)

-- Calculate the area for the triangle using the formula area = base * height/2
areaOfTriangle = baseOfTriangle * heightOfTriangle/2

-- Display the area of the triangle on the iPad Air 
areaTextOfTriangle = display.newText("The area of this triangle with a base of \n" ..
	baseOfTriangle .. " and a height of " .. heightOfTriangle .. " is " ..
	areaOfTriangle .. " pixels².", 0, 0, Arial, textSize)

-- Anchor the text of the triangle in its (x,y) position
areaTextOfTriangle.anchorX = 0
areaTextOfTriangle.anchorY = 0
areaTextOfTriangle.x = 580
areaTextOfTriangle.y = 280

-- add the colour black to the area text of the triangle
areaTextOfTriangle:setFillColor(0, 0, 0)


