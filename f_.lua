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
welcomeLabel.Font = Enum.Font.Gotham
welcomeLabel.TextSize = 40
welcomeLabel.Size = UDim2.new(0, 300, 0, 50)  -- Adjusted width for better fit
welcomeLabel.Position = UDim2.new(0.5, -150, 1, -75)  -- Positioned at bottom center
welcomeLabel.AnchorPoint = Vector2.new(0.5, 1)  -- Anchor point adjusted for bottom alignment
welcomeLabel.BackgroundTransparency = 1

-- Set text outline (stroke)
welcomeLabel.TextStrokeTransparency = 0.5  -- Outline transparency
welcomeLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 255)  -- Blue outline color

getgenv().welcomeText = welcomeLabel.Text

-- Make fadeText a global function
getgenv().fadeText = function(newText)
    getgenv().welcomeText = newText

    local fadeOutTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local fadeOutGoal = {TextTransparency = 1}
    local fadeOutTween = TweenService:Create(welcomeLabel, fadeOutTweenInfo, fadeOutGoal)
    fadeOutTween:Play()
    fadeOutTween.Completed:Wait()

    welcomeLabel.Text = newText
    local fadeInTweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
    local fadeInGoal = {TextTransparency = 0}
    local fadeInTween = TweenService:Create(welcomeLabel, fadeInTweenInfo, fadeInGoal)
    fadeInTween:Play()
end
