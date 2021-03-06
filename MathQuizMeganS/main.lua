------------------------------------------------------------------------------------------
-- Title: MathQuiz
-- Name: Megan.S
-- Course: ICS20
-- This program will ask the user a series of different math questions like addtion, subtraction
-- multiplication, and division. If the user gets the question right then points will be added
-- if the user gets the question wrong then a heart will be taken away
-----------------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Sets the background colour
display.setDefault("background", 1, 1, 204/255)

--------------------------------------------------------------------------------
-- Create the local variables --
--------------------------------------------------------------------------------
local questionObject
local correctText
local incorrectText

local numericField

local randomNumber1
local randomNumber2

local userAnswer
local correctAnswer

local points = 0
local gameOverObject 
local youWinObject

local correctCheckMark
local wrongRedCross 


-- Create the local variables for the timer
local totalSeconds = 10
local secondsLeft = 10
local clockText 
local countDownTimer

-- Create the variables for the hearts
local lives = 4
local heart1
local heart2
local heart3

---------------------------------------------------------------
-- Create the sounds
---------------------------------------------------------------

-- Add the local variables for the sound
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" )
local correctSoundChannel
local incorrectSound = audio.loadSound( "Sounds/wrongSound.mp3" )
local incorrectSoundChannel
local gameOverSound = audio.loadSound("Sounds/gameOverSound.wav")
local gameOverSoundChannel
local youWinSound = audio.loadSound( "Sounds/youWinSound.wav")
local youWinSoundChannel 

---------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber = math.random(1, 5)

	numericField.text = ""


	if (randomNumber == 1) then

		randomNumber1 = math.random(1, 20)
		randomNumber2 = math.random(1, 20)

		correctAnswer = randomNumber1 + randomNumber2

		-- Create the question in the text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = "

	elseif (randomNumber == 2 ) then

		randomNumber3 = math.random(1, 20)
		randomNumber4 = math.random(1, 20)

		if (randomNumber3 > randomNumber4) then

			AskQuestion()

		elseif (randomNumber3 < randomNumber4) then

			correctAnswer = randomNumber3 - randomNumber4

			-- Create the question in the text object
			questionObject.text = randomNumber3 .. " - " .. randomNumber4 .. " = "
		end

	elseif ( randomNumber == 3 ) then

		randomNumber5 = math.random(1, 10)
		randomNumber6 = math.random(1, 10)

		correctAnswer = randomNumber5 * randomNumber6

		-- Create the question in the text object
		questionObject.text = randomNumber5 .. " * " .. randomNumber6 .. " = "

	elseif ( randomNumber == 4 ) then

		randomNumber7 = math.random(1, 100) 
		randomNumber8 = math.random(1, 100)

		correctAnswer = math.round(randomNumber7 / randomNumber8 * 100 / 100)

		-- Create the question in the text object
		questionObject.text = randomNumber7 .. " / " .. randomNumber8 .. " = "

	else 

		randomNumber9 = math.random(1, 10)

		correctAnswer = randomNumber9 * randomNumber9

		-- Create the question in the text object
		questionObject.text = randomNumber9 .. " * " .. randomNumber9 .. " = "	

	end

end


local function UpdateTime()

	-- Decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- Display the number of seconds left in the clock object 
	clockText.text = secondsLeft .. ""

	if ( secondsLeft == 0 ) then
		-- Reset the number of seconds left
		secondsLeft = totalSeconds

		lives = lives - 1

		-- If there are no lives left, play a lose sound, show a you lose image
		-- and cancel the timer remove the third heart by making it invisible

		if ( lives == 3 ) then

			heart3.isVisible = true
			heart2.isVisible = true
			heart1.isVisible = true
			
			AskQuestion()

		elseif ( lives == 2 ) then

			heart3.isVisible = false
			heart2.isVisible = true
			heart1.isVisible = true
		
			AskQuestion()

		elseif ( lives == 1 ) then

			heart3.isVisible = false
			heart2.isVisible = false   
			heart1.isVisible = true

			AskQuestion()

		elseif (lives == 0) then

			heart3.isVisible = false
			heart2.isVisible = false   
			heart1.isVisible = false
			timer.cancel(countDownTimer)
			gameOverObject.isVisible = true
			numericField.isVisible = false
			pointsObject.isVisible = false
			gameOverSoundChannel = audio.play(gameOverSound)
			
		end
	end
end



-- Function that calls the timer
local function StartTimer()

	-- Create a countdown timer that loops infinitely
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0 )

end

local function HideCorrect()
	correctText.isVisible = false
	correctCheckMark.isVisible = false
	AskQuestion()
end	

local function HideIncorrect()

	incorrectText.isVisible = false
	wrongRedCross.isVisible = false
	AskQuestion()
end	

local function NumericFieldListener( event )
	
	-- User begins editing "numericField"
	if ( event.phase == "began" ) then

		-- Clear text field
		event.target.text = ""

	elseif (event.phase == "submitted") then


		-- When the answer is submited (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- If the users answer and the correct answer are the same:
		if ( userAnswer == correctAnswer ) then

			secondsLeft = totalSeconds
			points = points + 1
			pointsObject.text = "Points: " .. points
			correctText.isVisible = true
			correctCheckMark.isVisible = true			
			timer.performWithDelay(3000, HideCorrect)

			correctSoundChannel = audio.play(correctSound)

			if ( points == 5 ) then

				youWinObject.isVisible = true
				heart1.isVisible = false
				heart2.isVisible = false
				heart3.isVisible = false
				numericField.isVisible = false
				pointsObject.isVisible = false
				timer.cancel(countDownTimer)

				youWinSoundChannel = audio.play(youWinSound)	

			end	

		else
			lives = lives - 1
			incorrectText.isVisible = true
			wrongRedCross.isVisible = true
			correctCheckMark.isVisible = false
			timer.performWithDelay(3000, HideIncorrect)

			incorrectSoundChannel = audio.play(incorrectSound) 
		end

		
	end
end

---------------------------------------------------------------
-- OBJECT CREATION (IMAGES, TEXT, NUMERIC TEXTFIELDS, ETC.)
---------------------------------------------------------------

-- Displays a question and sets the colour
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 70 )
questionObject:setTextColor(155/255, 42/255, 198/255)

pointsObject = display.newText("Points: " .. points, display.contentWidth*4/5, display.contentHeight*1.5/10, nil, 50 )
pointsObject:setTextColor(0, 0, 0)
pointsObject.isVisible = true

-- Create the correct text object and make it invisible 
correctText = display.newText("Correct!", display.contentWidth/2, display.contentHeight*9/10, nil, 70 )
correctText:setTextColor(155/255, 42/255, 198/255)
correctText.isVisible = false

-- Create the clock text colour and text
clockText = display.newText("Time remaining:" .. secondsLeft, display.contentWidth*2/10, display.contentHeight*2/10, nil, 48)
clockText:setTextColor(0, 0, 0)

-- Create the incorrect text object and make it invisible 
incorrectText = display.newText("Incorrect!", display.contentWidth/2, display.contentHeight*9/10, nil, 70 )
incorrectText:setTextColor(102/255, 178/255, 1)
incorrectText.isVisible = false

-- Create the numeric field text
numericField = native.newTextField( display.contentWidth*2/3, display.contentHeight/2, 200, 80 )
numericField.inputType = "number"
numericField.isVisible = true

-- Add the event listener for the numeric field
numericField:addEventListener("userInput", NumericFieldListener)

gameOverObject = display.newImageRect("Images/gameOver.png", 768, 1024)
gameOverObject.x = display.contentWidth/2
gameOverObject.y = display.contentHeight/2
gameOverObject.isVisible = false 

-- Create the image for when the user wins
youWinObject = display.newImageRect("Images/youWin.png", 768, 1024)
youWinObject.x = display.contentWidth/2
youWinObject.y = display.contentHeight/2
youWinObject.isVisible = false

-- Create the pictures for the green check mark and the red cross
correctCheckMark = display.newImageRect("Images/checkmark.png", 200, 150)
correctCheckMark.x = display.contentWidth/2
correctCheckMark.y = display.contentHeight*7/10
correctCheckMark.isVisible = false

wrongRedCross = display.newImageRect("Images/red_x.png", 200, 150 )
wrongRedCross.x = display.contentWidth/2
wrongRedCross.y = display.contentHeight*7/10
wrongRedCross.isVisible = false 

-- Create the lives to display on the screen
heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 7 / 8 
heart1.y = display.contentHeight * 2 / 7

heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 6 / 8
heart2.y = display.contentHeight * 2 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 2 / 7

-------------------------------------------------------------------------
-- Function calls --
-------------------------------------------------------------------------
-- Call the function to ask the question
AskQuestion()
StartTimer()