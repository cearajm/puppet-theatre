local pd <const> = playdate
local gfx <const> = pd.graphics
local sfx <const> = pd.sound.sampleplayer



local testt = true
class("ElevatorRide").extends()

function ElevatorRide:init()
    ElevatorRide.super.init(self)

    self.string = "sadf"
    self.isInElevator = false

    local text = {
        {"it's spring now.", "the smell of soil is reinvigorating."}
    }
    self.textbox = Textbox(text)
    self.textbox:setVisible(false)
end


function ElevatorRide:test()
    print("test")

end

function ElevatorRide:update()

    local isAButtonPressed = pd.buttonJustPressed(pd.kButtonA)
    local isBButtonPressed = pd.buttonJustPressed(pd.kButtonB)
    if self.isInElevator and isAButtonPressed then
        if not self.textbox.isActive then
            self.textbox:startDialogue()
        else
            self.textbox:getNextLine()
        end
        print("oiu")
    end
    if self.isInElevator and isBButtonPressed then
        GameScene.instance:moveToRoom("south")
        self.isInElevator = false
        Player.instance:moveTo(104, 42)
        Player.instance.canMove = true
        self.textbox.isActive = false
        self.textbox.currentLine = 1
    end
end