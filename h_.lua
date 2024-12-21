local Players = game:GetService("Players")
local player = Players.LocalPlayer
local TweenService = game:GetService("TweenService")

local statGui = Instance.new("ScreenGui")
statGui.Name = "StatGui"
statGui.Parent = game:GetService("CoreGui")

local blurEffect = Instance.new("BlurEffect")
blurEffect.Parent = game:GetService("Lighting")
blurEffect.Size = 24

local welcomeLabel = Instance.new("TextLabel")
welcomeLabel.Parent = statGui
welcomeLabel.Text = "Welcome, " .. player.Name
welcomeLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
welcomeLabel.Font = Enum.Font.Gotham
welcomeLabel.TextSize = 40
welcomeLabel.Size = UDim2.new(0, 200, 0, 50)
welcomeLabel.Position = UDim2.new(0, 10, 1, -60)  -- Adjusted to be in the bottom-left corner
welcomeLabel.AnchorPoint = Vector2.new(0, 1)  -- Anchoring it to the bottom-left corner
welcomeLabel.BackgroundTransparency = 1

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
