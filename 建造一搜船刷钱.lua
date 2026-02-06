local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local target1 = Vector3.new(-1915.035400390625, 7.599996089935303, -92.87940979003906)
local target2 = Vector3.new(-7174.35595703125, 9.799994468688965, -61.11391067504883)

local isRunning = false
local currentButton = nil
local currentScreen = nil
local overlayGui = nil

local function createOverlay()
    if overlayGui then
        overlayGui:Destroy()
    end

    local screen = Instance.new("ScreenGui")
    screen.Name = "BlackOverlay"
    screen.ResetOnSpawn = false
    screen.Parent = playerGui

    local blackFrame = Instance.new("Frame")
    blackFrame.Name = "BlackBG"
    blackFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    blackFrame.BackgroundTransparency = 0
    blackFrame.Size = UDim2.new(1, 0, 1, 0)
    blackFrame.Position = UDim2.new(0, 0, 0, 0)
    blackFrame.ZIndex = 999
    blackFrame.Parent = screen

    local label = Instance.new("TextLabel")
    label.Text = "正在刷钱中..."
    label.TextColor3 = Color3.new(1, 1, 1)
    label.Font = Enum.Font.Arcade
    label.TextSize = 36
    label.BackgroundTransparency = 1
    label.Size = UDim2.new(0, 400, 0, 60)
    label.Position = UDim2.new(0.5, -200, 0.4, -30)
    label.AnchorPoint = Vector2.new(0.5, 0.5)
    label.ZIndex = 1000
    label.Parent = blackFrame

    spawn(function()
        while overlayGui == screen do
            local hue = tick() * 0.5 % 1
            label.TextColor3 = Color3.fromHSV(hue, 1, 1)
            task.wait()
        end
    end)

    overlayGui = screen
end

local function removeOverlay()
    if overlayGui then
        overlayGui:Destroy()
        overlayGui = nil
    end
end

local function createButton()
    if currentScreen then
        currentScreen:Destroy()
    end

    local screen = Instance.new("ScreenGui")
    screen.ResetOnSpawn = false
    screen.DisplayOrder = 100
    screen.Parent = playerGui
    currentScreen = screen

    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 180, 0, 50)
    button.Position = UDim2.new(0.5, -90, 0.5, -25)
    button.AnchorPoint = Vector2.new(0.5, 0.5)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.BackgroundColor3 = Color3.fromRGB(60, 120, 200)
    button.BorderSizePixel = 3
    button.Text = "开始刷钱"
    button.Font = Enum.Font.ArialBold
    button.TextSize = 20
    button.ZIndex = 10
    button.AutoButtonColor = true
    button.Parent = screen
    currentButton = button

    button.Activated:Connect(function()
        isRunning = not isRunning
        button.Text = isRunning and "停止刷钱" or "开始刷钱"
        
        if isRunning then
            createOverlay()
        else
            removeOverlay()
        end
    end)

    spawn(function()
        while button.Parent do
            local offset = math.sin(tick() * 3) * 0.015 
            button.Position = UDim2.new(0.5, -90, 0.5 + offset, -25)
            task.wait()
        end
    end)
end

spawn(function()
    while true do
        if isRunning then
            local char = player.Character
            local rootPart = char and char:FindFirstChild("HumanoidRootPart")
            if rootPart then
                local pos = rootPart.Position
                local currentTarget = (math.abs(pos.X - target1.X) < 50) and target2 or target1
                rootPart.CFrame = CFrame.new(currentTarget)
            end
            task.wait(1.5)
        else
            task.wait()
        end
    end
end)

createButton()
player.CharacterAdded:Connect(createButton)
