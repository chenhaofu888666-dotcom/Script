--一撸像吸脚本
--黑壳。停止
--作者eu。屁
local WindUI  = loadstring(game:HttpGet("https://raw.githubusercontent.com/chenhaofu888666-dotcom/WindUI/refs/heads/main/WindUI.lua"))()
local RS      = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local RunSvc  = game:GetService("RunService")
local UIS     = game:GetService("UserInputService")
local LightingSvc = game:GetService("Lighting")
local LP      = Players.LocalPlayer
local Camera  = workspace.CurrentCamera
local GunStats= require(RS.GunScripts.GunStats)

local Win = WindUI:CreateWindow{
    Title="一撸像溪 by euphoria",
    Icon="gun", Theme="Dark",
    Size=UDim2.fromOffset(500,420),
    SideBarWidth=50, ScrollBarEnabled=true
}

local Tabs = {
    Combat  = Win:Tab{Title="战斗",     Icon="sword"},
    Visual  = Win:Tab{Title="视觉",     Icon="eye"},
    Gun     = Win:Tab{Title="枪械", Icon="gun"},
    Misc    = Win:Tab{Title="杂项",     Icon="flask"},
    Buy     = Win:Tab{Title="自动购买", Icon="shopping-cart"},
    Theme   = Win:Tab{Title="主题",     Icon="palette"},
}

do
    local Aimbot_HBSize, Aimbot_HBEnable = 30, false
    local aimbot_originalProps = {}
    
    local function applyHitbox(char, enable)
        local root = char:FindFirstChild("HumanoidRootPart")
        if not root then return end
        
        if enable then
            if not aimbot_originalProps[root] then aimbot_originalProps[root] = {Size = root.Size, Transparency = root.Transparency, CanCollide = root.CanCollide} end
            root.Size = Vector3.new(Aimbot_HBSize, Aimbot_HBSize, Aimbot_HBSize); root.Transparency = 0.95; root.CanCollide = true;
            pcall(function() root.CollisionGroup = "Default" end)
        elseif aimbot_originalProps[root] then
            root.Size = aimbot_originalProps[root].Size; root.Transparency = aimbot_originalProps[root].Transparency; root.CanCollide = aimbot_originalProps[root].CanCollide;
            aimbot_originalProps[root] = nil
        end
    end

    Tabs.Combat:Input{Title="玩家 HitBox 尺寸", Value=tostring(Aimbot_HBSize), Callback=function(txt) Aimbot_HBSize = math.max(4, tonumber(txt) or Aimbot_HBSize) end}
    Tabs.Combat:Toggle{Title="开启玩家 HitBox", Value=false, Callback=function(flag) Aimbot_HBEnable = flag; if not flag then for _, p in ipairs(Players:GetPlayers()) do if p.Character then applyHitbox(p.Character, false) end end end; WindUI:Notify{Title="玩家 HitBox",Content=flag and "已开启" or "已关闭",Duration=2} end}
    Tabs.Combat:Divider()
    
    local aimbotTeamCheck = true
    local maxAimDistance = 500
    local showFOVCircle = true
    local fovCircleColor = Color3.new(1, 1, 1)
    
    _G.CurrentAimbotTarget = nil
    _G.LockedTarget = nil
    _G.TargetLocked = false
    _G.AimBotEnabled = false

    Tabs.Combat:Toggle{
        Title = "开启自瞄", Value = false,
        Callback = function(state)
            _G.AimBotEnabled = state
            if state then
                local predictionFactor, aimSpeed = 0.042, 10
                local holding = false

                if not _G.FOVCircle then
                    if not (getfenv().Drawing and getfenv().Drawing.new) then
                         WindUI:Notify{Title="错误",Content="Drawing library not found! FOV Circle cannot be created.",Duration=5,Color=Color3.new(1,0,0)}
                         showFOVCircle = false 
                    else
                        _G.FOVCircle = Drawing.new("Circle")
                        _G.FOVCircle.Thickness = 1
                        _G.FOVCircle.Filled = false
                        _G.FOVCircle.Transparency = 0.7
                        _G.FOVCircle.Radius = 200
                    end
                end
                
                if _G.FOVCircle then
                    _G.FOVCircle.Visible = showFOVCircle
                    _G.FOVCircle.Color = fovCircleColor
                end

                local function getClosestPlayer()
                    local closest, minDist = nil, math.huge
                    local currentRadius = _G.FOVCircle and _G.FOVCircle.Radius or 200
                    local screenCenter = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                    
                    if not LP.Character or not LP.Character:FindFirstChild("HumanoidRootPart") then return nil end
                    
                    for _, player in pairs(Players:GetPlayers()) do
                        if player ~= LP and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                            if aimbotTeamCheck and player.Team and player.Team == LP.Team then continue end

                            local worldDist = (LP.Character.HumanoidRootPart.Position - player.Character.HumanoidRootPart.Position).Magnitude
                            if worldDist > maxAimDistance then continue end

                            local head = player.Character:FindFirstChild("Head")
                            if head then
                                local screenPos, onScreen = Camera:WorldToScreenPoint(head.Position)
                                if onScreen then
                                    local distance = (Vector2.new(screenPos.X, screenPos.Y) - screenCenter).Magnitude
                                    if distance <= currentRadius and distance < minDist then
                                        closest, minDist = player, distance
                                    end
                                end
                            end
                        end
                    end
                    return closest
                end

                local function predictHead(target)
                    local head = target.Character.Head
                    local velocity = target.Character.HumanoidRootPart.AssemblyLinearVelocity or Vector3.zero
                    return head.Position + velocity * predictionFactor
                end

                _G.AimbotInputBegan = UIS.InputBegan:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton2 or input.UserInputType == Enum.UserInputType.Touch then holding = true end end)
                _G.AimbotInputEnded = UIS.InputEnded:Connect(function(input) if input.UserInputType == Enum.UserInputType.MouseButton2 or input.UserInputType == Enum.UserInputType.Touch then holding = false; _G.CurrentAimbotTarget = nil; if _G.UpdateLockButtonVisuals then _G.UpdateLockButtonVisuals() end end end)
                
                _G.AimbotRenderStepped = RunSvc.RenderStepped:Connect(function()
                    if not _G.AimBotEnabled then return end
                    if _G.FOVCircle then
                        _G.FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
                    end

                    if holding then
                        local finalTarget = nil
                        
                        if _G.TargetLocked and _G.LockedTarget then
                            local char = _G.LockedTarget.Character
                            local hum = char and char:FindFirstChildOfClass("Humanoid")
                            if hum and hum.Health > 0 and Players:GetPlayerFromCharacter(char) then
                                finalTarget = _G.LockedTarget
                            else
                                _G.TargetLocked = false
                                _G.LockedTarget = nil
                                if _G.UpdateLockButtonVisuals then _G.UpdateLockButtonVisuals() end
                            end
                        else
                           finalTarget = getClosestPlayer()
                        end
                        
                        _G.CurrentAimbotTarget = finalTarget
                        if _G.UpdateLockButtonVisuals then _G.UpdateLockButtonVisuals() end

                        if finalTarget then
                            local predicted = predictHead(finalTarget)
                            Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, predicted), aimSpeed * 0.1)
                        end
                    end
                end)
            else
                if _G.FOVCircle then _G.FOVCircle:Remove(); _G.FOVCircle = nil end
                if _G.AimbotInputBegan then _G.AimbotInputBegan:Disconnect(); _G.AimbotInputBegan = nil end
                if _G.AimbotInputEnded then _G.AimbotInputEnded:Disconnect(); _G.AimbotInputEnded = nil end
                if _G.AimbotRenderStepped then _G.AimbotRenderStepped:Disconnect(); _G.AimbotRenderStepped = nil end
                
                _G.TargetLocked = false; _G.LockedTarget = nil; _G.CurrentAimbotTarget = nil;
                if _G.UpdateLockButtonVisuals then _G.UpdateLockButtonVisuals() end
                if _G.LockGUIVisible then _G.SetLockGUIVisible(false) end
            end
            WindUI:Notify{Title="屏幕中心自瞄",Content=state and "已开启" or "已关闭",Duration=2}
            if _G.SetLockGUIVisible then _G.SetLockGUIVisible(state) end
        end
    }
    
    Tabs.Combat:Toggle{Title="显示FOV圈", Value=showFOVCircle, Callback=function(v) 
        showFOVCircle = v 
        if _G.FOVCircle then _G.FOVCircle.Visible = v end
    end}
    Tabs.Combat:Colorpicker{
        Title="FOV圈颜色", Default = fovCircleColor,
        Callback = function(newColor)
            fovCircleColor = newColor
            if _G.FOVCircle then _G.FOVCircle.Color = newColor end
        end
    }
    Tabs.Combat:Toggle{Title="启用队伍检测", Value=aimbotTeamCheck, Callback=function(v) aimbotTeamCheck=v end}
    Tabs.Combat:Input{Title="最大瞄准距离", Value=tostring(maxAimDistance), Callback=function(t) maxAimDistance = tonumber(t) or maxAimDistance end}
    Tabs.Combat:Input{Title="设置FOV半径", Value="200", Callback=function(txt) if tonumber(txt) and _G.FOVCircle then _G.FOVCircle.Radius = math.clamp(tonumber(txt), 10, 1000) end end}
    
    RunSvc.Heartbeat:Connect(function() 
        if not Aimbot_HBEnable then return end
        fo
