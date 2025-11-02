local Color = {
  Generator = Color3.fromRGB(0,0,255),
  Killers = Color3.fromRGB(255,0,0),
  Survivors = Color3.fromRGB(0,255,255),
  Medkit = Color3.fromRGB(255,10,100),
  ["Bloxy Cola"] = Color3.fromRGB(255,150,0),
  ["Subspace Tripmine"] = Color3.fromRGB(255,0,150),
}
local Players = {
  ["Max Stamina"] = 5000,
  ["Stamina Gain"] = 5000,
  ["Stamina Loss"] = 0.1,
  ["Sprint Speed"] = {
    Killer = 29,
    Survivor = 28.5
  }
}
local Effect = {
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
