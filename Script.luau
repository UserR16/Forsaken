local Color = {
  Generator = Color3.fromRGB(0,0,255),
  Killers = Color3.fromRGB(255,0,0),
  Survivors = Color3.fromRGB(0,255,255),
  Medkit = Color3.fromRGB(255,10,100),
  ["Bloxy Cola"] = Color3.fromRGB(255,150,0),
  ["Subspace Tripmine"] = Color3.fromRGB(255,0,150),
}
local Players = {
  ["Field Of View"] = 100,
  ["Max Stamina"] = 5000,
  ["Stamina Gain"] = 5000,
  ["Stamina Loss"] = 0.1,
  ["Sprint Speed"] = {
    Killer = 29,
    Survivor = 28.5
  }
}
local EffectFile = {
  "Burning",
  "Hallucination",
  "Hemorrhage",
  "Weakness",
  "Slowness",
  "Blindness",
  "Subspaced"
}
local AutoGenerator = {
  Delay = 3.75,
  Auto = true,
  FixWhenShow = true
}

for _,v in ipairs(workspace.Map.Ingame.Map:GetDescendants()) do
  if v.Name == "Generator" then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color.Generator
  end
end
for _,v in ipairs(workspace.Players:GetDescendants()) do
  if v.Parent.Name == "Killers" then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color.Killers
    elseif v.Parent.Name == "Survivors" then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color.Survivors
  end
end
for _,v in ipairs(workspace.Map.Ingame:GetDescendants()) do
  if v.Name == "Medkit" then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color.Medkit
    elseif v.Name == "BloxyCola" then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color["Bloxy Cola"]
    elseif v.Name == "SubspaceTripmine" then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color["Subspace Tripmine"]
    end
end

workspace.Map.Ingame.Map.DescendantAdded:Connect(function(v)
    if v.Name == "Generator" and v then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color.Generator
    end
  end)
workspace.Players.DescendantAdded:Connect(function(v)
    if v.Parent.Name == "Killers" and v then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color.Killers
    elseif v.Parent.Name == "Survivors" and v then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color.Survivors
    end
  end)
workspace.Map.Ingame.DescendantAdded:Connect(function(v)
    if v.Name == "Medkit" and v then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color.Medkit
    elseif v.Name == "BloxyCola" and v then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color["Bloxy Cola"]
    elseif v.Name == "SubspaceTripmine" and v then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color["Subspace Tripmine"]
    end
  end)
StaminaScript = require(game:GetService("ReplicatedStorage").Systems.Character.Game.Sprinting)
game:GetService("RunService").RenderStepped:Connect(function()
workspace.CurrentCamera.FieldOfView = Players["Field Of View"]
StaminaScript.MaxStamina = Players["Max Stamina"]
StaminaScript.StaminaGain = Players["Stamina Gain"]
StaminaScript.StaminaLoss = Players["Stamina Loss"]
for _,v in pairs(workspace.Players.Survivors:GetChildren()) do
if v.Parent.Name == "Survivors" and v and v:GetAttribute("Username") == game.Players.LocalPlayer.Name then
StaminaScript.SprintSpeed = Players["Sprint Speed"].Survivor
end
end
for _,v in pairs(workspace.Players.Killers:GetChildren()) do
if v.Parent.Name == "Killers" and v and v:GetAttribute("Username") == game.Players.LocalPlayer.Name then
StaminaScript.SprintSpeed = Players["Sprint Speed"].Killers
end
end
end)
for _, v in ipairs(game.ReplicatedStorage.Modules.StatusEffects:GetDescendants()) do
if v.Name == EffectFile and v then
v:Destroy()
end
end
task.spawn(function()
while true do
if AutoGenerator.Auto and not AutoGenerator.FixWhenShow then
wait(4)
for _,v in ipairs(workspace.Map.Ingame.Map:GetChildren()) do
if v.Name == "Generator" then
v.Remotes.RE:FireServer()
end
end
end
if AutoGenerator.Auto and AutoGenerator.FixWhenShow and game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("PuzzleUI") then
wait(4)
for _,v in ipairs(workspace.Map.Ingame.Map:GetChildren()) do
if v.Name == "Generator" then
v.Remotes.RE:FireServer()
end
end
end
wait()
end
end)

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FPS_UI"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = game.CoreGui

local Shadow = Instance.new("Frame")
Shadow.Size = UDim2.new(0, 150, 0, 25)
Shadow.Position = UDim2.new(0.625, 0, 0, -50)
Shadow.BackgroundTransparency = 1
Shadow.Parent = ScreenGui

local Text = Instance.new("TextLabel", Shadow)
Text.Size = UDim2.new(1,0,1,0)
Text.Text = "FPS : 60 | Ping : 50"
Text.Font = "SourceSansBold"
Text.BackgroundTransparency = 1
Text.TextSize = "20"
Text.TextColor3 = Color3.new(1,1,1)

local US = Instance.new("UIStroke", Shadow)
US.Color = Color3.new(1,1,1)
local UT = Instance.new("UIStroke", Text)
local CS = Instance.new("UICorner", Shadow)

local FrameTimer = tick()
local FrameCounter = 0;
local FPS = 60;
game:GetService('RunService').RenderStepped:Connect(function()
	FrameCounter += 1;
	if (tick() - FrameTimer) >= 1 then
		FPS = FrameCounter;
		FrameTimer = tick();
		FrameCounter = 0;
	end;
Text.Text = tostring("FPS : %s | Ping : %s", math.floor(FPS), math.floor(game:GetService('Stats').Network.ServerStatsItem['Data Ping']:GetValue()))
end)
