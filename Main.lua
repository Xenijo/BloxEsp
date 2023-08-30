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
for i,v in pairs(game:GetService("Workspace").Plots:GetChildren()) do 
table.insert(Plots,v)
  end
end

function BloxEsp:GetPlayers()
for i,v in pairs(game:GetService("Players"):GetPlayers()) do 
table.insert(Players,v)
end
end

function BloxEsp:GetVehicles()
for i,v in pairs(game:GetService("Workspace").Plots:GetDescendants()) do 
if v:FindFirstChild("Driver") then
table.insert(Vehicle,v)
end
end
end

return BloxEsp
