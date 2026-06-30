-- ModZ Credit UI 

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")

local player = Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Name = "ModZ_Credit_UI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 0, 0, 60)
frame.Position = UDim2.new(0.5, 0, 0.15, 0)
frame.AnchorPoint = Vector2.new(0.5, 0.5)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 20)
frame.BackgroundTransparency = 0.2
frame.BorderSizePixel = 0
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 14)
corner.Parent = frame

local stroke = Instance.new("UIStroke")
stroke.Thickness = 2
stroke.Color = Color3.fromRGB(120, 80, 255)
stroke.Transparency = 0.3
stroke.Parent = frame

local text = Instance.new("TextLabel")
text.Size = UDim2.new(1, -20, 1, -10)
text.Position = UDim2.new(0, 10, 0, 5)
text.BackgroundTransparency = 1
text.Text = ""
text.TextColor3 = Color3.fromRGB(235, 235, 255)
text.Font = Enum.Font.GothamBold
text.TextScaled = true
text.Parent = frame

--// EXPAND ANIMATION
TweenService:Create(frame,
    TweenInfo.new(0.8, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
    {Size = UDim2.new(0, 520, 0, 60)}
):Play()
local message = "The script was created by ModZ (the heir to the ModZezing brand.)"

task.spawn(function()
    for i = 1, #message do
        text.Text = string.sub(message, 1, i)
        task.wait(0.03)
    end
end)

--ani
task.spawn(function()
    while frame.Parent do
        TweenService:Create(frame,
            TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Position = UDim2.new(0.5, 0, 0.14, 0)}
        ):Play()
        task.wait(1.5)

        TweenService:Create(frame,
            TweenInfo.new(1.5, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Position = UDim2.new(0.5, 0, 0.16, 0)}
        ):Play()
        task.wait(1.5)
    end
end)

-- idk
task.spawn(function()
    while frame.Parent do
        TweenService:Create(stroke,
            TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Transparency = 0.7}
        ):Play()
        task.wait(1)

        TweenService:Create(stroke,
            TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
            {Transparency = 0.2}
        ):Play()
        task.wait(1)
    end
end)
task.delay(5, function()

    -- fade out 
    TweenService:Create(frame,
        TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
        {
            Size = UDim2.new(0, 0, 0, 60),
            BackgroundTransparency = 1
        }
    ):Play()

    TweenService:Create(text,
        TweenInfo.new(0.4),
        {TextTransparency = 1}
    ):Play()

    TweenService:Create(stroke,
        TweenInfo.new(0.4),
        {Transparency = 1}
    ):Play()

    task.wait(0.7)
    frame:Destroy()

    -- MINI BADGE 

    local badge = Instance.new("Frame")
    badge.Size = UDim2.new(0, 0, 0, 28)
    badge.Position = UDim2.new(1, -20, 1, -20)
    badge.AnchorPoint = Vector2.new(1, 1)
    badge.BackgroundColor3 = Color3.fromRGB(20, 20, 25)
    badge.BorderSizePixel = 0
    badge.Parent = gui

    local bc = Instance.new("UICorner")
    bc.CornerRadius = UDim.new(0, 10)
    bc.Parent = badge

    local bs = Instance.new("UIStroke")
    bs.Thickness = 1.5
    bs.Color = Color3.fromRGB(120, 80, 255)
    bs.Transparency = 0.4
    bs.Parent = badge

    local btxt = Instance.new("TextLabel")
    btxt.Size = UDim2.new(1, 0, 1, 0)
    btxt.BackgroundTransparency = 1
    btxt.Text = "Script by ModZ"
    btxt.TextColor3 = Color3.fromRGB(240, 240, 255)
    btxt.Font = Enum.Font.GothamSemibold
    btxt.TextScaled = true
    btxt.Parent = badge

    -- expand badge
    TweenService:Create(badge,
        TweenInfo.new(0.5, Enum.EasingStyle.Back, Enum.EasingDirection.Out),
        {Size = UDim2.new(0, 160, 0, 28)}
    ):Play()

    -- float
    task.spawn(function()
        while badge.Parent do
            TweenService:Create(badge,
                TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                {Position = UDim2.new(1, -20, 1, -24)}
            ):Play()
            task.wait(1.2)

            TweenService:Create(badge,
                TweenInfo.new(1.2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut),
                {Position = UDim2.new(1, -20, 1, -18)}
            ):Play()
            task.wait(1.2)

            TweenService:Create(bs,
                TweenInfo.new(1),
                {Transparency = 0.8}
            ):Play()

            task.wait(1)

            TweenService:Create(bs,
                TweenInfo.new(1),
                {Transparency = 0.3}
            ):Play()
        end
    end)
end)
