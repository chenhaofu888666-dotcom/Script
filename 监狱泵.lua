local genv = getgenv()

task.wait()
game:IsLoaded()
task.wait()

local _ = game:GetService('Players').LocalPlayer
local _call10 = game:GetService('Workspace')

game:GetService('Lighting')

local _ = game:GetService('Players').LocalPlayer:WaitForChild('PlayerGui').FightUI.PrisonFight.BG.TapButton

require(_call10.Src.Modules.COOPFightHandler)

genv.AT_Config = genv.AT_Config

local _ = genv.TransparencyEnabled
local _32 = loadstring(game:HttpGet('https://raw.githubusercontent.com/Yisan886/Aero/refs/heads/main/ui.lua.txt'))()

_32:AddTheme({
Outline = Color3.fromHex('#FFFFFF'),
Placeholder = Color3.fromHex('#7a7a7a'),
Name = 'My Theme',
Text = Color3.fromHex('#FFFFFF'),
Button = Color3.fromHex('#52525b'),
Background = Color3.fromHex('#101010'),
Icon = Color3.fromHex('#a1a1aa'),
Accent = Color3.fromHex('#18181b'),
})

local _call58 = _32:CreateWindow({
Folder = 'Aero',
Title = 'Aero      ',
SideBarWidth = 180,
Topbar = {
Height = 44,
ButtonsType = 'Mac',
},
Background = 'https://chaton-images.s3.us-east-2.amazonaws.com/GHn9L9UJLf0XcVNyCpbG72D0rmNmBEWndPkh6CjJNya8GLnWzz1vImvt8wlJSBwv_2700x1519x1393696.jpeg',
OpenButton = {
Enabled = true,
Color = ColorSequence.new(Color3.fromHex('#30FF6A'), Color3.fromHex('#e7ff2f')),
Title = '\u{6253}\u{5f00}\u{811a}\u{672c}',
StrokeThickness = 3,
Scale = 0.9,
Draggable = true,
OnlyMobile = false,
CornerRadius = UDim.new(1, 0),
},
BackgroundImageTransparency = 0.5,
})

_call58:Tag({
Color = Color3.fromHex('00CED1'),
Radius = 2,
Title = 'V1.03',
})
_call58:Tag({
Color = Color3.fromHex('FFD700'),
Radius = 2,
Icon = 'crown',
Title = '\u{4f0a}\u{6563}',
})
_call58:Tag({
Color = Color3.fromHex('#30ff6a'),
Radius = 2,
Icon = 'square-chevron-right',
Title = '\u{82cf}\u{8fbe}',
})

local _call100 = ColorSequence.new({
[1] = ColorSequenceKeypoint.new(0, Color3.fromHex('FF0000')),
[2] = ColorSequenceKeypoint.new(0.16, Color3.fromHex('FFA500')),
[3] = ColorSequenceKeypoint.new(0.33, Color3.fromHex('FFFF00')),
[4] = ColorSequenceKeypoint.new(0.5, Color3.fromHex('00FF00')),
[5] = ColorSequenceKeypoint.new(0.66, Color3.fromHex('0000FF')),
[6] = ColorSequenceKeypoint.new(0.83, Color3.fromHex('4B0082')),
[7] = ColorSequenceKeypoint.new(1, Color3.fromHex('EE82EE')),
})

ColorSequence.new({
[1] = ColorSequenceKeypoint.new(0, Color3.fromHex('30FF6A')),
[2] = ColorSequenceKeypoint.new(0.5, Color3.fromHex('a8ff00')),
[3] = ColorSequenceKeypoint.new(1, Color3.fromHex('e7ff2f')),
})

local _Main116 = _call58.UIElements.Main

_Main116:FindFirstChild('RainbowStroke'):Destroy()
_Main116:FindFirstChildOfClass('UICorner')

local _call124 = Instance.new('UIStroke')

_call124.Name = 'RainbowStroke'
_call124.Thickness = 2
_call124.Color = Color3.new(1, 1, 1)
_call124.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
_call124.LineJoinMode = Enum.LineJoinMode.Round
_call124.Parent = _Main116

local _call132 = Instance.new('UIGradient')

_call132.Name = 'GlowEffect'
_call132.Color = _call100
_call132.Rotation = 0
_call132.Parent = _call124

_call58.UIElements.Main:FindFirstChild('RainbowStroke'):FindFirstChild('GlowEffect')
game:GetService('RunService').Heartbeat:Connect(function(...) end)

local _call145 = game:GetService('Lighting')

game:GetService('TweenService')
_call145:FindFirstChildOfClass('BlurEffect')
task.spawn(function(...) end)

local _call153 = _call58:Tab({
Title = '\u{6302}\u{673a}',
Icon = 'mouse-pointer-click',
})

_call58:SelectTab(1)
_call153:Section({
Title = '\u{70b9}\u{51fb}',
Icon = 'mouse-pointer-click',
})
_call153:Toggle({
Callback = function(...) end,
Default = true,
Title = '\u{81ea}\u{52a8}\u{6218}\u{6597}',
})
_call153:Toggle({
Callback = function(...) end,
Default = true,
Title = '\u{81ea}\u{52a8}\u{953b}\u{70bc}',
})

local _call163 = _call58:Tab({
Title = '\u{73a9}\u{5bb6}',
Icon = 'settings',
})

_call163:Section({
Title = '\u{65e0}\u{9650}\u{4f53}\u{529b}',
Icon = 'battery-full',
})
_call163:Toggle({
Callback = function(...) end,
Default = true,
Title = '\u{65e0}\u{9650}\u{4f53}\u{529b}',
})
hookfunction(require(_call10.Src.WorkoutHandler).ReachedZeroStamina, function(...) end)
task.spawn(function(...) end)
task.spawn(function(...) end)
