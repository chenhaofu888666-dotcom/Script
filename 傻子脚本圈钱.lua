local _5 = loadstring(game:HttpGet('https://raw.githubusercontent.com/Yisan886/Aero/refs/heads/main/ui.lua.txt'))()

_5:AddTheme({
    Outline = Color3.fromHex('#FFFFFF'),
    Placeholder = Color3.fromHex('#7a7a7a'),
    Name = 'My Theme',
    Text = Color3.fromHex('#FFFFFF'),
    Button = Color3.fromHex('#52525b'),
    Background = Color3.fromHex('#101010'),
    Icon = Color3.fromHex('#a1a1aa'),
    Accent = Color3.fromHex('#18181b'),
})

local _call31 = _5:CreateWindow({
    Folder = 'Aero',
    Title = 'Aero      ',
    SideBarWidth = 180,
    Topbar = {
        Height = 44,
        ButtonsType = 'Mac',
    },
    Background = 'https://chaton-images.s3.us-east-2.amazonaws.com/GHn9L9UJLf0XcVNyCpbG72D0rmNmBEWndPkh6CjJNya8GLnWzz1vImvt8wlJSBwv_2700x1519x1393696.jpeg',
    OpenButton = {
        StrokeThickness = 3,
        Color = ColorSequence.new(Color3.fromHex('#30FF6A'), Color3.fromHex('#e7ff2f')),
        Title = '\u{6253}\u{5f00}\u{811a}\u{672c}',
        Enabled = true,
        Scale = 0.9,
        Draggable = true,
        OnlyMobile = false,
        CornerRadius = UDim.new(1, 0),
    },
    BackgroundImageTransparency = 0.5,
})

_call31:Tag({
    Color = Color3.fromHex('00CED1'),
    Radius = 2,
    Title = 'V1.03',
})
_call31:Tag({
    Color = Color3.fromHex('FFD700'),
    Radius = 2,
    Title = '\u{4f0a}\u{6563}',
    Icon = 'crown',
})
_call31:Tag({
    Color = Color3.fromHex('#30ff6a'),
    Radius = 2,
    Title = '\u{82cf}\u{8fbe}',
    Icon = 'square-chevron-right',
})

local _call47 = game:GetService('RunService')
local _call49 = game:GetService('Lighting')

game:GetService('TweenService')

local _ = game:GetService('Players').LocalPlayer
local _call54 = _call31:Tab({
    Title = '\u{4e3b}\u{8981}\u{529f}\u{80fd}',
    Icon = 'sparkles',
})

_call31:SelectTab(1)
_call54:Toggle({
    Value = false,
    Title = '\u{6740}\u{622e}\u{5149}\u{73af}',
    Callback = function(...) end,
})
_call54:Toggle({
    Value = false,
    Title = '\u{4f20}\u{9001}\u{5168}\u{90e8}\u{4eba}',
    Callback = function(...) end,
})
_call54:Button({
    Title = '\u{5220}\u{9664}\u{6559}\u{5b66}\u{697c}\u{5927}\u{95e8}',
    Callback = function(...) end,
})
_call54:Button({
    Title = '\u{5220}\u{9664}\u{4e8c}\u{53f7}\u{5c0f}\u{95e8}',
    Callback = function(...) end,
})
task.spawn(function(...) end)
_call47.Stepped:Connect(function(...) end)
task.spawn(function(...) end)
_call47.Heartbeat:Connect(function(...) end)

local _ = _call49:FindFirstChildOfClass('BlurEffect') and 1756371

task.spawn(function(...) end)

local _Main81 = _call31.UIElements.Main
local _call84 = _Main81:FindFirstChild('RainbowStroke')

_call84.Name = 'RainbowStroke'
_call84.Thickness = 2
_call84.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
_call84.Parent = _Main81

local _call89 = _call84:FindFirstChild('GlowEffect')

_call89.Name = 'GlowEffect'

local _call104 = ColorSequence.new({
    [1] = ColorSequenceKeypoint.new(0, Color3.fromHex('FF0000')),
    [2] = ColorSequenceKeypoint.new(0.5, Color3.fromHex('00FF00')),
    [3] = ColorSequenceKeypoint.new(1, Color3.fromHex('0000FF')),
})

_call89.Color = _call104
_call89.Parent = _call84
