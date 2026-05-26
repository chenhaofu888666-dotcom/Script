-- SB HUB 脚本
-- 加载 Rayfield 库
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua'))()

-- 创建主窗口
local Window = Rayfield:CreateWindow({
    Name = "SB HUB",
    LoadingTitle = "作者老木正在升空中...",
    LoadingSubtitle = "by SB",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = "SB_HUB_Config",
        FileName = "Settings"
    }
})

-- 保存窗口实例，用于后续销毁UI
local MainWindow = Window

-- 主页标签
local HomeTab = Window:CreateTab("主页","home")
HomeTab:CreateLabel("作者：SB 没啥群（此脚本免费禁止倒卖）")

-- 王朝崩溃标签
local DynastyTab = Window:CreateTab("王朝崩溃", 4483362458)
DynastyTab:CreateButton({
    Name = "ragebot作者eu。屁",
    Callback = function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/chenhaofu888666-dotcom/-/refs/heads/main/Collapse%20of%20dynasty.lua"))()
    end
})

-- 一路向西标签
local WestTab = Window:CreateTab("一路向西", 4483362458)
WestTab:CreateButton({
    Name = "rage作者eup",
    Callback = function() 
        loadstring(game:HttpGet("https://pastebin.com/raw/4wacSMn2"))()
    end
})
WestTab:CreateButton({
    Name = "刀刀刀（我最爱eup的脚本了😍）",
    Callback = function() 
        loadstring(game:HttpGet("https://pastefy.app/GFGLd0i0/raw"))()
    end
})

-- 通用功能标签
local CommonTab = Window:CreateTab("通用", "user")
CommonTab:CreateButton({
    Name = "飞行v3",
    Callback = function() 
        loadstring(game:HttpGet("https://pastefy.app/NrQxAB92/raw"))()
    end
})
CommonTab:CreateButton({
    Name = "起源",
    Callback = function() 
        loadstring(game:HttpGet("https://pastefy.app/gtk6VLVy/raw",true))()
    end
})

CommonTab:CreateButton({
    Name = "改名（仅自己可见）",
    Callback = function() loadstring(game:HttpGet("https://raw.githubusercontent.com/q639977310-design/ui-/refs/heads/main/%E6%94%B9%E5%90%8D"))()
    end
})

-- 自然灾害标签
local DisasterTab = Window:CreateTab("自然灾害", 4483362458)
DisasterTab:CreateButton({
    Name = "黑洞",
    Callback = function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/ke9460394-dot/ugik/refs/heads/main/%E5%8F%8C%E7%8E%AF%E6%8E%A7%E5%88%B6%E9%BB%91%E6%B4%9E.txt"))()
    end
})
DisasterTab:CreateButton({
    Name = "防摔伤",
    Callback = function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/chenhaofu888666-dotcom/Script/refs/heads/main/自然灾害防摔落.lua"))()
    end
})

-- 启示录生存标签
local SurviveTab = Window:CreateTab("启示录生存", "sword")
SurviveTab:CreateButton({
    Name = "Aura（eup😍）",
    Callback = function() 
        loadstring(game:HttpGet("https://raw.githubusercontent.com/chenhaofu888666-dotcom/-/refs/heads/main/Collapse%20of%20dynasty.lua"))()
    end
})

-- LC标签页 + 点击按钮销毁原有UI（核心修复）
local LCTab = Window:CreateTab("lc", "sword")
LCTab:CreateButton({
    Name = "lc害人精（点击会销毁脚本UI）",
    Callback = function()
        -- 销毁Rayfield主界面
        if MainWindow and MainWindow.Destroy then
            MainWindow:Destroy()
        end
        -- 清空全局UI引用，彻底销毁
        MainWindow = nil
        Window = nil
        -- 加载新LC脚本
        loadstring(game:HttpGet("https://pastefy.app/AIkdqUgV/raw"))()
    end
})

local Tab = Window:CreateTab("血与铁", "sword")

Tab:CreateButton({
    Name = "秋白",
    Callback = function() loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\108\101\101\110\110\100\110\47\77\97\116\100\115\47\114\101\102\115\47\104\101\97\100\115\47\109\97\105\110\47\98\105\50\46\48"))()
    end
})