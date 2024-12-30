local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

local statGui = Instance.new("ScreenGui")
statGui.Name = "StatGui"
statGui.Parent = game:GetService("CoreGui")

local welcomeLabel = Instance.new("TextLabel")
welcomeLabel.Parent = statGui
welcomeLabel.Text = "Welcome, " .. player.Name
welcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
welcomeLabel.Font = Enum.Font.GothamBold  -- Bold/fat font
welcomeLabel.TextSize = 60  -- Increased font size
welcomeLabel.Size = UDim2.new(0, 300, 0, 50)  -- Adjusted width for better fit
welcomeLabel.Position = UDim2.new(0.5, 0, 1, -75)  -- Centered horizontally and positioned more to the bottom
welcomeLabel.AnchorPoint = Vector2.new(0.5, 1)  -- Anchor point adjusted for bottom alignment
welcomeLabel.BackgroundTransparency = 1

-- Set text outline (black stroke)
welcomeLabel.TextStrokeTransparency = 0.3  -- Black outline transparency
welcomeLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)  -- Black outline color

getgenv().welcomeText = welcomeLabel.Text

-- Make fadeText a global function
getgenv().fadeText = function(newText)
    getgenv().welcomeText = newText

    -- Fade out and move up
    local fadeOutTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local fadeOutGoal = {
        TextTransparency = 1,
        Position = welcomeLabel.Position - UDim2.new(0, 0, 0.1, 0) -- Move upward by 10% of the screen height
    }
    local fadeOutTween = TweenService:Create(welcomeLabel, fadeOutTweenInfo, fadeOutGoal)
    fadeOutTween:Play()
    fadeOutTween.Completed:Wait()

    -- Reset position and update text
    welcomeLabel.Position = UDim2.new(0.5, 0, 1, -75)  -- Reset position
    welcomeLabel.Text = newText

    -- Fade in
    local fadeInTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local fadeInGoal = {TextTransparency = 0}
    local fadeInTween = TweenService:Create(welcomeLabel, fadeInTweenInfo, fadeInGoal)
    fadeInTween:Play()
end
