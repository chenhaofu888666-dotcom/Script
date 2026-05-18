-- mythhub Atlas团队开源
local Players = game:GetService("Players")
local v2 = Players.LocalPlayer

local v1 = {
    THREAD_COUNT = 30,
    DELAY = 0.00001
}

local function getWeaponAndTargets()
    local v6 = v2.Character
    if not v6 then return nil, {} end

    local v9 = v6:FindFirstChildOfClass("Humanoid")
    if not v9 or v9.Health <= 0 then return nil, {} end

    local v18 = v6:FindFirstChild("Machete")
    if not v18 then return nil, {} end

    local v7 = v18:FindFirstChild("Handle")
    local v14 = v18:FindFirstChild("Remote")
    if not (v7 and v14) then return nil, {} end

    local v17 = {}
    
    local v13 = Players:GetPlayers()
    for v10 = 1, #v13 do
        local v11 = v13[v10]
        if v11 ~= v2 then
            local v15 = v11.Character
            if v15 then
                local v16 = v15:FindFirstChildOfClass("Humanoid")
                local v8 = v15:FindFirstChild("HumanoidRootPart") or v15:FindFirstChild("Torso") or v15:FindFirstChild("Head")
                if v16 and v16.Health > 0 and v8 then
                    table.insert(v17, v8)
                end
            end
        end
    end

    local v5 = workspace:FindFirstChild("Animals")
    if v5 then
        local v4 = v5:GetChildren()
        for v10 = 1, #v4 do
            local v3 = v4[v10]
            if v3:IsA("Model") then
                local v16 = v3:FindFirstChildOfClass("Humanoid")
                local v8 = v3:FindFirstChild("HumanoidRootPart") or v3:FindFirstChild("Torso") or v3:FindFirstChild("Head") or v3.PrimaryPart
                if v16 and v16.Health > 0 and v8 then
                    table.insert(v17, v8)
                end
            end
        end
    end

    return {v7 = v7, v14 = v14}, v17
end

local function doMapAttack()
    local v19, v17 = getWeaponAndTargets()
    if v19 and #v17 > 0 and typeof(firetouchinterest) == "function" then
        v19.remote:FireServer(1)
        
        for v10 = 1, #v17 do
            local v12 = v17[v10]
            if v12 and v12.Parent then
                firetouchinterest(v19.handle, v12, 0)
                firetouchinterest(v19.handle, v12, 1)
            end
        end
    end
end

task.spawn(function()
    while true do
        local v6 = v2.Character
        if v6 and v6:FindFirstChild("Machete") then
            for v10 = 1, v1.THREAD_COUNT do
                task.spawn(doMapAttack)
                if v1.DELAY > 0 then
                    task.wait(v1.DELAY)
                end
            end
        end
        task.wait()
    end
end)
