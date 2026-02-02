local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Grok 菜单 - 自动墙壁连跳 & 墙壁闪身",
   LoadingTitle = "加载中",
   LoadingSubtitle = "创作者：N1EL & Grok AI汉化者于溺yn",
   ConfigurationSaving = { Enabled = true, FolderName = "GrokMenu", FileName = "WallhopFlick" },
   KeySystem = false
})

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local player = Players.LocalPlayer

local character = player.Character or player.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
local root = character:WaitForChild("HumanoidRootPart")

local toggles = { wallhop = false, wallflickauto = false, ladderauto = false, speed = false }
local connections = {}

player.CharacterAdded:Connect(function(newChar)
   character = newChar
   humanoid = newChar:WaitForChild("Humanoid")
   root = newChar:WaitForChild("HumanoidRootPart")
end)

-- ========================================
-- WALL HOP (V8 original - mantido)
-- ========================================
local WallHopTab = Window:CreateTab("🧱 墙跳", nil)

WallHopTab:CreateToggle({
   Name = "墙跳 (V8)",
   CurrentValue = false,
   Callback = function(enabled)
      toggles.wallhop = enabled
      
      if connections.wallhop then connections.wallhop:Disconnect() end
      
      if enabled then
         connections.wallhop = RunService.Heartbeat:Connect(function()
            if not toggles.wallhop or not root or not humanoid then return end
            
            local params = RaycastParams.new()
            params.FilterType = Enum.RaycastFilterType.Exclude
            params.FilterDescendantsInstances = {character}
            
            local rays = {
               workspace:Raycast(root.Position, root.CFrame.LookVector * 8, params),
               workspace:Raycast(root.Position, root.CFrame.RightVector * 5, params),
               workspace:Raycast(root.Position, -root.CFrame.RightVector * 5, params),
               workspace:Raycast(root.Position + Vector3.new(0,3,0), Vector3.new(0,-8,0), params)
            }
            
            local hit = false
            for _, r in rays do
               if r and r.Instance and r.Instance.CanCollide then hit = true break end
            end
            
            if hit and humanoid:GetState() == Enum.HumanoidStateType.Jumping then
               local up = 72 + math.random(-7, 13)
               local fwd = root.CFrame.LookVector * (14 + math.random(0, 8))
               
               root.Velocity = Vector3.new(
                  root.Velocity.X * 1.18 + fwd.X,
                  up,
                  root.Velocity.Z * 1.18 + fwd.Z
               )
               
               local orig = root.CFrame
               root.CFrame = orig * CFrame.Angles(0, math.rad(math.random(35, 65)), 0)
               task.wait(0.007)
               root.CFrame = orig
               
               if toggles.speed then
                  humanoid.WalkSpeed = 26 + math.random(5, 12)
               end
               
               task.delay(0.015, function()
                  if humanoid then humanoid:ChangeState(Enum.HumanoidStateType.Jumping) end
               end)
            end
         end)
      end
   end,
})

-- ========================================
-- WALL FLICK AUTO (só no pulo, sem aviso)
-- ========================================
WallHopTab:CreateToggle({
   Name = "自动蹭墙闪身",
   CurrentValue = false,
   Callback = function(enabled)
      toggles.wallflickauto = enabled
      
      if connections.wallflick then connections.wallflick:Disconnect() end
      
      if enabled then
         connections.wallflick = UserInputService.JumpRequest:Connect(function()
            if not toggles.wallflickauto or not root then return end
            
            local params = RaycastParams.new()
            params.FilterType = Enum.RaycastFilterType.Exclude
            params.FilterDescendantsInstances = {character}
            
            local ray = workspace:Raycast(root.Position, root.CFrame.LookVector * 5, params)
            if ray and ray.Instance.CanCollide then
               local orig = root.CFrame
               root.CFrame = orig * CFrame.Angles(0, math.rad(math.random(50,70)), 0)
               task.wait(0.012)
               root.CFrame = orig
               
               root.Velocity = Vector3.new(root.Velocity.X, 70 + math.random(-5,8), root.Velocity.Z)
            end
         end)
      end
   end,
})

-- ========================================
-- LADDER FLICK AUTO (corrigido - funciona colado/subindo)
-- ========================================
local LadderTab = Window:CreateTab("🪜 自动爬梯闪身", nil)

LadderTab:CreateToggle({
   Name = "自动爬梯闪身",
   CurrentValue = false,
   Callback = function(enabled)
      toggles.ladderauto = enabled
      
      if connections.ladder then connections.ladder:Disconnect() end
      
      if enabled then
         connections.ladder = UserInputService.JumpRequest:Connect(function()
            if not toggles.ladderauto or not root then return end
            
            local params = RaycastParams.new()
            params.FilterType = Enum.RaycastFilterType.Exclude
            params.FilterDescendantsInstances = {character}
            
            local rays = {
               workspace:Raycast(root.Position, root.CFrame.LookVector * 8, params),
               workspace:Raycast(root.Position, root.CFrame.RightVector * 6, params),
               workspace:Raycast(root.Position, -root.CFrame.RightVector * 6, params)
            }
            
            local hitLadder = false
            for _, r in rays do
               if r and r.Instance and r.Instance.Name:lower():find("ladder") then
                  hitLadder = true
                  break
               end
            end
            
            if hitLadder then
               local up = 85 + math.random(-8, 10)
               root.Velocity = Vector3.new(root.Velocity.X, up, root.Velocity.Z)
               
               local orig = root.CFrame
               root.CFrame = orig * CFrame.Angles(0, math.rad(60), 0)
               task.wait(0.015)
               root.CFrame = orig
            end
         end)
      end
   end,
})

LadderTab:CreateButton({
   Name = "梯子闪身(鼠标)",
   Callback = function()
      local mouseHit = player:GetMouse().Hit.Position
      local ray = workspace:Raycast(mouseHit, Vector3.new(0, -20, 0))
      if ray and ray.Instance and ray.Instance.Name:lower():find("ladder") then
         root.CFrame = CFrame.new(mouseHit + Vector3.new(0, 9, 0))
         root.Velocity = Vector3.new(0, 100, 0)
      end
   end
})

-- ========================================
-- SPEED
-- ========================================
local SpeedTab = Window:CreateTab("🚀 速度", nil)

SpeedTab:CreateToggle({
   Name = "速度改变",
   CurrentValue = false,
   Callback = function(v)
      toggles.speed = v
      humanoid.WalkSpeed = v and 24 or 16
   end,
})

SpeedTab:CreateSlider({
   Name = "自定义速度",
   Range = {16, 40},
   Increment = 1,
   CurrentValue = 18,
   Callback = function(v) humanoid.WalkSpeed = v end
})

-- ========================================
-- INFO (sem notificações)
-- ========================================
local InfoTab = Window:CreateTab("关于")
InfoTab:CreateParagraph({
   Title = "Grok 菜单 - 自动连跳 & 自动蹭墙闪身",
   Content = [[
由 N1EL & Grok AI 制作

- 自动蹭墙跳： 在墙边跳跃即可触发
- 自动蹭墙闪身： 在墙边跳跃即可触发（伴随轻微视角甩动）
- 自动爬梯闪身： 在梯子旁/紧贴梯子时跳跃即可触发
- 无屏幕提示（不影响跳跃操作）
- 全手动模式（一次开启，直至手动关闭）

由于溺yn汉化
]]
})
