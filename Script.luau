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
    Killer = 28.75,
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
for _,v in ipairs(workspace.Players.Killers:GetDescendants()) do
  if v.Name == "Killers" then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color.Killers
  end
end
for _,v in ipairs(workspace.Players.Survivors:GetDescendants()) do
  if v.Name == "Survivors" then
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
  end
end
for _,v in ipairs(workspace.Map.Ingame:GetDescendants()) do
  if v.Name == "BloxyCola" then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color["Bloxy Cola"]
  end
end
for _,v in ipairs(workspace.Map.Ingame:GetDescendants()) do
  if v.Name == "SubspaceTripmine" then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color["Subspace Tripmine"]
  end
end

workspace.Map.Ingame.Map.DescendantAdded:Connect(function(v)
    if v.Name == "Generator" then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color.Generator
    end
  end)
workspace.Players.Killers.DescendantAdded:Connect(function(v)
    if v.Name == "Killers" then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color.Killers
    elseif v.Name == "Survivors" then
    local h = Instance.new("Highlight",v)
    h.FillTransparency = 1
    h.OutlineColor = Color.Survivors
    end
  end)
workspace.Map.Ingame.DescendantAdded:Connect(function(v)
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
  end)


