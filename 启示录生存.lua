local v1 = game:GetService("Players").LocalPlayer
local v2 = workspace:WaitForChild("Characters")
local v3 = RaycastParams.new()
v3.FilterType = Enum.RaycastFilterType.Exclude

task.spawn(function()
    while true do
        task.wait(0.3)
        local v4 = v1.Character
        if v4 then
            local v5 = v4:FindFirstChildOfClass("Tool")
            local v6 = v5 and v5:FindFirstChild("HitTargets")
            local v7 = v5 and v5:FindFirstChild("Swing")
            
            if v6 and v7 then
                v3.FilterDescendantsInstances = {v4, workspace.CurrentCamera}
                local v8 = v2:GetChildren()
                local v9 = {}
                
                for v10 = 1, #v8 do
                    local v11 = v8[v10]
                    local v12 = v11:FindFirstChildOfClass("Humanoid")
                    local v13 = v11:FindFirstChild("Head") or v11:FindFirstChild("HumanoidRootPart")
                    
                    if v12 and v12.Health > 0 and v13 and not v11:FindFirstChildOfClass("ForceField") then
                        local v14 = workspace.CurrentCamera.CFrame.Position
                        local v15 = v13.Position - v14
                        local v16 = workspace:Raycast(v14, v15, v3)
                        
                        if not v16 or v16.Instance:IsDescendantOf(v11) then
                            table.insert(v9, v11)
                        end
                    end
                end
                
                if #v9 > 0 then
                    v7:FireServer()
                    v6:FireServer(v9)
                end
            end
        end
    end
end)
