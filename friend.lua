local Players = game:GetService("Players")
local PathfindingService = game:GetService("PathfindingService")
local Chat = game:GetService("Chat")
local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer

-- Global switch to track if this is a respawn or the first time joining
local hasDiedAtLeastOnce = false

-- ==========================================
-- DIALOGUE TABLES
-- ==========================================
local randomLines = {
    "Eat grilled chicken", "I once thought I was an angel but in reality I was just a stubborn little boy",
    "Cookies or Biscuits...?", "I once stepped on a bug and now I feel terrible everytime I think about it...",
    "Don't leave me behind!", "Tung Tung Tung sahur!", "Guess who's small and slow",
    "Oke what am I even saying right now", "Slow down or else I might get lost", "Meow",
    "I'm craving for some gummy bears right now", "Yara Yara", "What song are you listening to right now?",
    "My legs are hurting me...", "Why rush when you literally got nothing to do?", "Was the sky always blue?",
    "I'm nothing compared to your big legs", "There's probably someone out there still thinking the earth is flat",
    "I'm just an illusion in your own head", "homeschooling is the worst...",
    "Some pricks might walk me over without even noticing", "What's a job? What's that?", "Dally Daily Do!",
    "Some people say creativity comes from imagination and I believe that", "Hehe", "I talk too much aren't I?",
    "What's considered weird but highly effective?", "Wooo hoooo waaeee!!", "Mango", "Bla bla bla",
    "I'm literally just vibing here", "Did you hear that?", "Mental illness? That's called Being a sigma male silly!",
    "How's it going!", "Mrfolk", "Hi", "Blood suckers always pisses me off you know what I'm talking about!",
    "I fear no man but evil larry", "I'm smol", "Marsey made me like this...", "Fih",
    "How did we even go from silly cats to silly cars I just don't get it"
}

local patLines = {
    "Thx I needed that :3", "Hmm keep going! :D", 
    "H-huh it's not like I'm liking it or anything baka!", 
    "Soft and gentle... that's enough to hype up a little guy like me :]"
}

local carryLines = {
    "Yay! Free ride!!", "Woah now that's a new whole view!", 
    "Just hope that I won't fall off randomly hehe", "Fresh air up here!"
}

local hushLines = {
    "Okie got it!", "I'm being a headache anyway so yeah sure", 
    "I am this annoying? Wow", "Fine! >:v"
}

local stopLines = {
    "Loud and clear!", "I'll stay in my position and not move an inch!", 
    "Oke but hurry cuz I'm lowkey scared", "You got it Mrfolk!"
}

local deathLines = {
    "Nooo! Please don’t die on me :[",
    "Oh my god [user display name] noo!",
    "Oh no you could've had it!",
    "Wait no-!"
}

local respawnLines = {
    "Oh my god you're back! I thought I lost you forever...",
    "Oh you're back! I wasn't crying or anything hehe...",
    "You're back! You're still alive! if this was just a prank to scare me plz don't do that again cuz it's not funny! >:[",
    "[user display name] oh my goodness you're alright? :0"
}

-- ==========================================
-- MAIN FUNCTION
-- ==========================================
local function createMiniMe(character)
    local rootPart = character:WaitForChild("HumanoidRootPart")
    local humanoid = character:WaitForChild("Humanoid")
    
    task.wait(1) 
    
    character.Archivable = true
    local miniMe = character:Clone()
    character.Archivable = false
    
    local miniRoot = miniMe:WaitForChild("HumanoidRootPart")
    local miniHumanoid = miniMe:WaitForChild("Humanoid")
    local miniHead = miniMe:WaitForChild("Head")
    
    for _, obj in ipairs(miniMe:GetDescendants()) do
        if obj:IsA("LuaSourceContainer") or obj:IsA("Animate") then
            obj:Destroy()
        elseif obj:IsA("BasePart") then
            obj.CanCollide = false 
        end
    end
    
    miniMe:ScaleTo(0.4)
    miniMe.Name = "Mini-" .. player.Name
    miniRoot.CFrame = rootPart.CFrame * CFrame.new(3, 0, 3)
    miniMe.Parent = workspace
    
    local isActive = true
    local isHushed = false
    local isStopped = false
    local isCarried = false

    local function forceChat(linesTable)
        local chosenLine = linesTable[math.random(1, #linesTable)]
        -- Dynamically replace the tag with the player's actual display name
        chosenLine = chosenLine:gsub("%[user display name%]", player.DisplayName)
        Chat:Chat(miniHead, chosenLine, Enum.ChatColor.White)
    end

    -- ==========================================
    -- DEATH & RESPAWN LOGIC
    -- ==========================================
    if hasDiedAtLeastOnce then
        -- Wait a moment for him to settle on the ground before expressing relief
        task.delay(1.5, function()
            forceChat(respawnLines)
        end)
    end

    humanoid.Died:Connect(function()
        hasDiedAtLeastOnce = true
        isActive = false -- Instantly stop his movement and random talking
        
        if miniMe and miniHead then
            forceChat(deathLines)
            -- Let him mourn for 3 seconds before despawning
            task.delay(3, function()
                if miniMe then miniMe:Destroy() end
            end)
        end
    end)

    -- ==========================================
    -- INTERACTION UI
    -- ==========================================
    local clickDetector = Instance.new("ClickDetector")
    clickDetector.Parent = miniRoot
    
    local ui = Instance.new("ScreenGui")
    ui.Name = "MiniMeMenu"
    ui.ResetOnSpawn = false
    ui.Enabled = false
    
    pcall(function() ui.Parent = CoreGui end)
    if not ui.Parent then ui.Parent = player:WaitForChild("PlayerGui") end

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(0, 200, 0, 250)
    frame.Position = UDim2.new(0.5, -100, 0.5, -125)
    frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    frame.BorderSizePixel = 0
    frame.Parent = ui
    
    local uiCorner = Instance.new("UICorner")
    uiCorner.CornerRadius = UDim.new(0, 10)
    uiCorner.Parent = frame

    local layout = Instance.new("UIListLayout")
    layout.Parent = frame
    layout.Padding = UDim.new(0, 5)
    layout.HorizontalAlignment = Enum.HorizontalAlignment.Center
    layout.VerticalAlignment = Enum.VerticalAlignment.Center

    local function createBtn(name, text)
        local btn = Instance.new("TextButton")
        btn.Size = UDim2.new(0.9, 0, 0, 45)
        btn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
        btn.TextColor3 = Color3.fromRGB(255, 255, 255)
        btn.TextScaled = true
        btn.Font = Enum.Font.SourceSansBold
        btn.Text = text
        btn.Name = name
        local btnCorner = Instance.new("UICorner")
        btnCorner.CornerRadius = UDim.new(0, 8)
        btnCorner.Parent = btn
        btn.Parent = frame
        return btn
    end

    local btnPat = createBtn("Pat", "Pat")
    local btnCarry = createBtn("Carry", "Carry")
    local btnHush = createBtn("Hush", "Hush")
    local btnStop = createBtn("Stop", "Stop")
    local btnClose = createBtn("Close", "Close Menu")
    btnClose.BackgroundColor3 = Color3.fromRGB(150, 50, 50)

    clickDetector.MouseClick:Connect(function()
        ui.Enabled = not ui.Enabled
    end)
    btnClose.MouseButton1Click:Connect(function()
        ui.Enabled = false
    end)

    btnPat.MouseButton1Click:Connect(function() forceChat(patLines) end)

    btnCarry.MouseButton1Click:Connect(function()
        isCarried = not isCarried
        if isCarried then
            btnCarry.Text = "Drop"
            forceChat(carryLines)
        else
            btnCarry.Text = "Carry"
            miniRoot.CFrame = rootPart.CFrame * CFrame.new(3, 0, 3) 
        end
    end)

    btnHush.MouseButton1Click:Connect(function()
        isHushed = not isHushed
        if isHushed then
            btnHush.Text = "Talk"
            forceChat(hushLines)
        else
            btnHush.Text = "Hush"
            Chat:Chat(miniHead, "Yay I can speak again!", Enum.ChatColor.White)
        end
    end)

    btnStop.MouseButton1Click:Connect(function()
        isStopped = not isStopped
        if isStopped then
            btnStop.Text = "Follow me"
            forceChat(stopLines)
        else
            btnStop.Text = "Stop"
            Chat:Chat(miniHead, "On my way!", Enum.ChatColor.White)
        end
    end)

    -- ==========================================
    -- THE BRAIN LOOP
    -- ==========================================
    task.spawn(function()
        local path = PathfindingService:CreatePath({
            AgentRadius = 1, AgentHeight = 2, AgentCanJump = true
        })

        while isActive do
            if not character:IsDescendantOf(workspace) or not miniMe:IsDescendantOf(workspace) then
                if miniMe then miniMe:Destroy() end
                if ui then ui:Destroy() end
                isActive = false
                break
            end
            
            if isCarried then
                if character:FindFirstChild("Head") then
                    miniRoot.CFrame = character.Head.CFrame * CFrame.new(0, 1.2, 0)
                end
                task.wait()
                continue
            end

            if isStopped then
                task.wait(0.5)
                continue
            end
            
            local distance = (rootPart.Position - miniRoot.Position).Magnitude
            local targetPos = (rootPart.CFrame * CFrame.new(-2.5, 0, 2.5)).Position
            
            if distance > 25 then
                miniRoot.CFrame = rootPart.CFrame * CFrame.new(-2.5, 0, 2.5)
            elseif distance > 4 then
                local success = pcall(function()
                    path:ComputeAsync(miniRoot.Position, targetPos)
                end)
                
                if success and path.Status == Enum.PathStatus.Success then
                    local waypoints = path:GetWaypoints()
                    if #waypoints >= 2 then
                        if waypoints[2].Action == Enum.PathWaypointAction.Jump then
                            miniHumanoid.Jump = true
                        end
                        miniHumanoid:MoveTo(waypoints[2].Position)
                    end
                else
                    miniHumanoid:MoveTo(targetPos)
                end
            end
            
            task.wait(0.2)
        end
    end)
    
    -- ==========================================
    -- THE TALKING LOOP
    -- ==========================================
    task.spawn(function()
        while isActive do
            task.wait(math.random(5, 15))
            
            if not isActive or not miniMe:IsDescendantOf(workspace) then break end
            if isHushed then continue end 
            
            forceChat(randomLines)
        end
    end)
end

if player.Character then
    task.spawn(createMiniMe, player.Character)
end
player.CharacterAdded:Connect(createMiniMe)
