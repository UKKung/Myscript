function TP_World1()
    _G.TP_Ser = true
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelMain")
end
function TP_World2()
    _G.TP_Ser = true
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelDressrosa")	
end
function TP_World3()
    _G.TP_Ser = true
    game:GetService("ReplicatedStorage").Remotes.CommF_:InvokeServer("TravelZou")
end
local World = game.PlaceId
if World == 2753915549 then
    Old_World = true
elseif World == 4442272183 then
    New_World = true
elseif World == 7449423635 then
    Three_World = true
end 

local TPToggle = true
function TP2(P1)
    while TPToggle == true do
        local Distance = (P1.Position - game.Players.LocalPlayer.Character.HumanoidRootPart.Position).Magnitude
        if Distance < 150 then
            Speed = 20000
        elseif Distance < 200 then
            Speed = 5000
        elseif Distance < 300 then
            Speed = 1030
        elseif Distance < 500 then
            Speed = 725
        elseif Distance < 1000 then
            Speed = 365
        elseif Distance >= 1000 then
            Speed = 365
                    end
        game:GetService("TweenService"):Create(
            game.Players.LocalPlayer.Character.HumanoidRootPart,
            TweenInfo.new(Distance/Speed, Enum.EasingStyle.Linear),
            {CFrame = P1}
        ):Play()
        _G.Clip = true
        wait(Distance/Speed)
        _G.Clip = false
    end
end

function toggleTP()
    TPToggle = not TPToggle
end

spawn(function()
    game:GetService("RunService").Heartbeat:Connect(function()
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") and _G.Clip then
            setfflag("HumanoidParallelRemoveNoPhysics", "False")
            setfflag("HumanoidParallelRemoveNoPhysicsNoSimulate2", "False")
            game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(11)
        end
    end)
end)

getgenv().TPPlace = "string"

local DiscordLib = loadstring(game:HttpGet"https://gist.githubusercontent.com/TheBeautiFullBeach/406a6956595916f2abaaeef8478c0164/raw/ae1362d7ea85fe289d627790521dca16fc3c8d55/PattayaBeach")()

local win = DiscordLib:Window("Lazium Blox Fruit")

local serv = win:Server("Main","")


local Island_Tab = serv:Channel("Teleport", "http://www.roblox.com/asset/?id=7040387707")
local World_Tab = serv:Channel("World", "http://www.roblox.com/asset/?id=7040387707")
local Misc_Tab = serv:Channel("Misc", "http://www.roblox.com/asset/?id=7040387707")

World_Tab:Button("Teleport to World 1", function()
                      
    TP_World1()
end)
World_Tab:Button("Teleport to World 2", function()
  
    TP_World2()
end)

World_Tab:Button("Teleport to World 3", function()
  
    TP_World3()
end)

Island_Tab:Label("Map")

Island_Tab:Toggle(
    "Tween",
    false,
    function(state)
        if state then
        if getgenv().TPPlace == "Colosseum" then
        TP2(CFrame.new(-1831, 45.82050323486328, 1364))
        elseif getgenv().TPPlace == "Flamingo's Mansion" then
            TP2(CFrame.new(-389, 331.8863525390625, 612))
        elseif getgenv().TPPlace == "Kingdom of rose" then
            TP2(CFrame.new(-392, 123.18550872802734, 1039))
        elseif getgenv().TPPlace == "Cafe" then
            TP2(CFrame.new(-471, 72.98555755615234, -88))
        elseif getgenv().TPPlace == "Mansion" then
            TP2(CFrame.new(-12541, 331.7884216308594, -7922))
        elseif getgenv().TPPlace == "Castle on the sea" then
            TP2(CFrame.new(-5513, 313.7912902832031, -2899))
        elseif getgenv().TPPlace == "Hydra" then
            TP2(CFrame.new(-471, 72.98555755615234, -88))
        elseif getgenv().TPPlace == "Areana" then
            TP2(CFrame.new(-471, 72.98555755615234, -88))
        end
        else
            
            TPToggle = false
            wait(0.1)
            TPToggle = true

            
    end
end
)
if New_World then
local drop =
    Island_Tab:Dropdown(
    "TP Place",
    {"Colosseum", "Flamingo's Mansion", "Kingdom of rose", "Cafe"},
    function(W2)
        getgenv().TPPlace = W2
    end
)
elseif Three_World then
   local drop =
    Island_Tab:Dropdown(
    "TP Place",
    {"Mansion", "Castle on the sea", "Hydra", "Areana",},
    function(W3)
        getgenv().TPPlace = W3
    end
)
end 
Island_Tab:Button("Stop_Tween", function()
    TPToggle = false
    wait(0.1)
    TPToggle = true
end)

Misc_Tab:Button("Rejoin", function()
  
    local tpservice= game:GetService("TeleportService")
local plr = game.Players.LocalPlayer

tpservice:Teleport(game.PlaceId, plr)

local target = game:GetService("Players").LocalPlayer
local message = "Rejoin.."
local gives_message = true
if gives_message then
    target:Kick(message)
else
    target:Kick()

    end
end)

---fpscap
Misc_Tab:Label("Fps Caps (Can't change!)")

Misc_Tab:Button("Fps 40", function()
    local RunService = game:GetService("RunService")
    local MaxFPS = 40
    while true do
    local t0 = tick()
    RunService.Heartbeat:Wait()
    repeat until (t0 + 1/MaxFPS) < tick()
    end
end)

Misc_Tab:Button("Fps 30", function()
    local RunService = game:GetService("RunService")
    local MaxFPS = 30
    while true do
    local t0 = tick()
    RunService.Heartbeat:Wait()
    repeat until (t0 + 1/MaxFPS) < tick()
    end
end)

Misc_Tab:Button("Fps 15", function()
    local RunService = game:GetService("RunService")
    local MaxFPS = 15
    while true do
    local t0 = tick()
    RunService.Heartbeat:Wait()
    repeat until (t0 + 1/MaxFPS) < tick()
    end
end)

Misc_Tab:Button("Fps 5", function()
    local RunService = game:GetService("RunService")
    local MaxFPS = 5
    while true do
    local t0 = tick()
    RunService.Heartbeat:Wait()
    repeat until (t0 + 1/MaxFPS) < tick()
    end
end)
---