--kill aura slient Assassin By ModZ
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UIS = game:GetService("UserInputService")
local Player = Players.LocalPlayer

local ScreenGui = Instance.new("ScreenGui", Player:WaitForChild("PlayerGui"))
ScreenGui.Name = "MoeD_Hub"; ScreenGui.ResetOnSpawn = false

local Main = Instance.new("Frame", ScreenGui)
Main.Size = UDim2.new(0, 160, 0, 50); Main.Position = UDim2.new(0.5, -80, 0.1, 0)
Main.BackgroundColor3 = Color3.fromRGB(20, 20, 20); Main.BorderSizePixel = 0
Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 8)
local Stroke = Instance.new("UIStroke", Main); Stroke.Color = Color3.fromRGB(255, 50, 50); Stroke.Thickness = 1.5

local ToggleBtn = Instance.new("TextButton", Main)
ToggleBtn.Size = UDim2.new(0.8, 0, 1, 0); ToggleBtn.BackgroundTransparency = 1
ToggleBtn.Text = "KillAura: OFF"; ToggleBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
ToggleBtn.Font = Enum.Font.GothamBold; ToggleBtn.TextSize = 13

local DragHandle = Instance.new("Frame", Main)
DragHandle.Size = UDim2.new(0.2, 0, 1, 0); DragHandle.Position = UDim2.new(0.8, 0, 0, 0)
DragHandle.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
Instance.new("UICorner", DragHandle).CornerRadius = UDim.new(0, 8)
local DragIcon = Instance.new("TextLabel", DragHandle)
DragIcon.Size = UDim2.new(1, 0, 1, 0); DragIcon.BackgroundTransparency = 1
DragIcon.Text = "✥"; DragIcon.TextColor3 = Color3.fromRGB(255, 50, 50); DragIcon.TextSize = 18

local KA_Active = false
ToggleBtn.MouseButton1Click:Connect(function()
    KA_Active = not KA_Active
    ToggleBtn.Text = KA_Active and "KillAura: ON" or "KillAura: OFF"
    ToggleBtn.TextColor3 = KA_Active and Color3.fromRGB(255, 50, 50) or Color3.fromRGB(255, 255, 255)
end)

local dragging, dragStart, startPos, activeInput
DragHandle.InputBegan:Connect(function(input)
    if not activeInput and (input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch) then
        activeInput = input; dragStart = input.Position; startPos = Main.Position; dragging = true
    end
end)
UIS.InputChanged:Connect(function(input)
    if dragging and input == activeInput then
        local delta = input.Position - dragStart
        Main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
UIS.InputEnded:Connect(function(input) if input == activeInput then dragging = false; activeInput = nil end end)

RunService.RenderStepped:Connect(function()
    if not KA_Active then return end
    local Tool = Player.Backpack:FindFirstChildOfClass("Tool") or Player.Character:FindFirstChildOfClass("Tool")
    if not Tool then return end
    
    for _, p in pairs(Players:GetPlayers()) do
        if p ~= Player and p.Character and p.Character:FindFirstChild("Head") then
            local args = {"AttemptWeaponHit", {
                shouldLock = true, shouldLunge = true, isCritical = true, damage = 9e9, tool = Tool,
                attackCycleData = {knockbackMul = 0, slowMult = 0, attackTime = 0, lungeMul = 0, slowTime = 0}
            }, {{enemyModel = p.Character, origin = p.Character.Head.Position, isClosestEnemy = true, knockback = 0}}}
            pcall(function() ReplicatedStorage.Events.GameRemoteFunction:InvokeServer(unpack(args)) end)
        end
    end
end)
