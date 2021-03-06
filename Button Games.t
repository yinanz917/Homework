import GUI

var backButton : int
var buttonCircle : int
var buttonGuess : int
var buttonGrowing : int
var grow : int
var growW, growH : int
var quitButton : int
const GROW_W := 100
const GROW_H := 15

View.Set ("graphics: 500; 450")
Window.Set (defWinId, "title: Game of Buttons")

procedure home
    growW := GROW_W
    growH := GROW_H
    GUI.Hide (backButton)
    GUI.Hide (grow)
    GUI.Show (buttonGuess)
    GUI.Show (buttonGrowing)
    GUI.Show (buttonCircle)
    GUI.Show (quitButton)
    GUI.SetSize (grow, growW, growH)
    GUI.SetLabel (buttonCircle, "Circle Game")
    GUI.SetPosition (buttonCircle, 350, 50)
    cls
    GUI.Refresh
    GUI.SetBackgroundColour (80)
end home

procedure GuessingGame
    GUI.SetBackgroundColour (0)
    var number : int
    var user_input : int
    
    GUI.Hide (buttonGuess)
    GUI.Hide (buttonGrowing)
    GUI.Hide (grow)
    GUI.Hide (buttonCircle)
    GUI.Show (backButton)
    put "Guess my number between 1 and 1000."
    randint (number, 1, 1000)
    loop
	put "Guess: " ..
	get user_input 
	exit when user_input = number  
	if user_input > number then
	    colour (blue)
	    put "Lower  " ..
	    colour (black)
	elsif user_input < number then
	    colour (red)
	    put "Higher " .. 
	    colour (black)
	end if
    end loop
    put "Congratualtions! You guessed the number!"
end GuessingGame

procedure GrowingButton 
    GUI.Hide (buttonGuess)
    GUI.Hide (buttonGrowing)
    GUI.Hide (buttonCircle)
    GUI.Show (backButton)
    GUI.Show (grow)
    growW += 5
    growH += 5
    GUI.SetSize (grow, growW, growH)
end GrowingButton 

procedure CircleGame
    var x, y, radius, Colour : int
    
    GUI.Hide (buttonGuess)
    GUI.Hide (buttonGrowing)
    GUI.Show (backButton)
    GUI.SetLabel (buttonCircle, "Random Circle!")
    GUI.SetPosition (buttonCircle, 200, 150)
    randint (x, 50, maxx - 50)
    randint (y, 50, maxy - 50)
    randint (radius, 1, 250)
    randint (Colour, 1, 255)
    cls
    drawfilloval (x, y, radius, radius, Colour)
    GUI.Refresh
end CircleGame

%Main Program
grow := GUI.CreateButton (170, 150, 100, "Click to Grow", GrowingButton)
growW := GUI.GetWidth (grow)
growH := GUI.GetHeight (grow)
buttonCircle := GUI.CreateButton (350, 50, 50, "Circle Game", CircleGame)
buttonGuess := GUI.CreateButton (200, 50, 50, "Guessing Game", GuessingGame)
buttonGrowing := GUI.CreateButton (50, 50, 50, "Growing Button", GrowingButton)
quitButton := GUI.CreateButton (50, 20, 20, "Quit", GUI.Quit)
backButton := GUI.CreateButton (400, 20, 50, "Back", home)

home

loop
    exit when GUI.ProcessEvent
end loop




