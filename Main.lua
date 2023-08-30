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
        table.insert(plots, v)
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
    for i, v in pairs(game:GetService("Workspace").Plots:GetDescendants()) do 
        if v:FindFirstChild("Driver") then
            table.insert(vehicles, v)
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

return BloxEsp
