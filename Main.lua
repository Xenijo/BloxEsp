BloxEsp = {}
-- services
local runService = game:GetService("RunService");
local players = game:GetService("Players");
local workspace = game:GetService("Workspace");
-- variables
local localPlayer = players.LocalPlayer;
local camera = workspace.CurrentCamera;
local viewportSize = camera.ViewportSize;
-- locals
local Plots = {}
local Players = {}
local Vehicle = {}
--Methods
local wtvp = camera.WorldToViewportPoint;
local isA = workspace.IsA;
local getPivot = workspace.GetPivot;
local findFirstChild = workspace.FindFirstChild;
local findFirstChildOfClass = workspace.FindFirstChildOfClass;
--//functions
function BloxEsp:GetPlots()
    local plots = {}
    for i, v in pairs(game:GetService("Workspace").Plots:GetChildren()) do 
       for i,v in pairs(v:GetChildren()) do 
        if v:IsA("Part") then 
       table.insert(plots, v)
       end
      end
    end
    return plots
end


function BloxEsp:GetPlayers()
    local players = {}
    for i, v in pairs(game:GetService("Players"):GetPlayers()) do 
        table.insert(players, v)
    end
    return players
end

function BloxEsp:GetVehicles()
    local vehicles = {}
for i,v in pairs(game:GetService("Players"):GetPlayers()) do 
    for i, v in pairs(v.Character:GetChildren()) do 
        if v:FindFirstChild("SeatPart") then 
            table.insert(vehicles, v)
         end
       end
    end
    return vehicles
end

function BloxEsp:CreateLine(from, to, color)
    local Line = Drawing.new("Line")
    Line.Visible = true
    Line.From = from
    Line.To = to
    Line.Color = color or Color3.new(1, 1, 1)
    Line.Thickness = 2
    Line.Transparency = 1
    Line.ZIndex = 1
    return Line
end


function BloxEsp:CreateText(position, text, size, color, font)
    local Text = Drawing.new("Text")
    Text.Visible = true
    Text.Position = position
    Text.Text = text
    Text.Size = size or 14
    Text.Color = color or Color3.new(1, 1, 1)
    Text.Font = font or Drawing.Fonts[1] -- Default to UI font
    Text.Center = true
    Text.Outline = true
    Text.OutlineColor = Color3.new(0, 0, 0) -- Default outline color
    Text.ZIndex = 1
    return Text
end

function BloxEsp:IsInCameraView(position)
    local viewVector = (position - camera.CFrame.Position).unit
    local dot = viewVector:Dot(camera.CFrame.LookVector)
    return dot > 0 -- You can adjust this threshold based on your preference
end

return BloxEsp
