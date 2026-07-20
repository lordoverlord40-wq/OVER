local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/imhenne187/SilenceElerium/refs/heads/main/src/SilenceEleriumLibrary.luau", true))() 

local window = library:AddWindow("ALEKING HUB | Private Farming", {
    main_color = Color3.fromRGB(192, 192, 192),
    title_bar = {Color3.fromRGB(220, 220, 220), Color3.fromRGB(80, 80, 80)},
    background = {Color3.fromRGB(192, 192, 192)},
    background_transparency = 0.3,
    min_size = Vector2.new(350, 500),
    toggle_key = Enum.KeyCode.RightShift,
    can_resize = true,
})

local replicatedStorage = game:GetService("ReplicatedStorage")
local blockedFrames = {
    "strengthFrame",
    "durabilityFrame",
    "agilityFrame",
}

for _, name in ipairs(blockedFrames) do
    local frame = replicatedStorage:FindFirstChild(name)
    if frame and frame:IsA("GuiObject") then
        frame.Visible = false
    end
end

replicatedStorage.ChildAdded:Connect(function(child)
    if table.find(blockedFrames, child.Name) and child:IsA("GuiObject") then
        child.Visible = false
    end
end)

-- ====== AUTO START JUNGLE LIFT PRIMERO ======
task.wait(0.5)
local Player = game.Players.LocalPlayer
local player = game.Players.LocalPlayer
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local muscleEvent = player:WaitForChild("muscleEvent")
local leaderstats = player:WaitForChild("leaderstats")
local rebirthsStat = leaderstats:WaitForChild("Rebirths")

-- 1. Clickear Jungle Lift DOS VECES
for i = 1, 2 do
    local char = player.Character or player.CharacterAdded:Wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(-8642.396484375, 6.7980651855, 2086.1030273)
    task.wait(0.2)
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(0.05)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
    task.wait(0.3)
end

task.wait(1)

-- ====== INFO TAB ======
local infoTab = window:AddTab("ℹ️  Info")
infoTab:AddLabel("━━━━━━━━  ⚡ ALEKING HUB INFO  ━━━━━━━━")
infoTab:AddLabel("🎮  Script:   ALEKING HUB  |  Muscle Legends")
infoTab:AddLabel("👑  Author:   ALEKING")
infoTab:AddLabel("📊  Version:  1.2")
infoTab:AddLabel("📱  Discord:  discord.gg/RKCLANISBEST")
infoTab:AddLabel("🔧  Toggle:   RightShift key")
infoTab:AddLabel("━━━━━━━━  🌍 LIVE PLAYER INFO  ━━━━━━━━")
local pingLbl  = infoTab:AddLabel("📶  Ping:  calculating...")
local nameLbl  = infoTab:AddLabel("👤  Name:  "..player.Name)
local dispLbl  = infoTab:AddLabel("🏷️  Display:  "..player.DisplayName)
local idLbl    = infoTab:AddLabel("🆔  UserID:  "..player.UserId)
local charLbl  = infoTab:AddLabel("🌐  Server Players:  "..#game.Players:GetPlayers())
infoTab:AddLabel("━━━━━━━━  🖥️ SERVER INFO  ━━━━━━━━")
local jobLbl   = infoTab:AddLabel("🖥️  JobID:  "..game.JobId:sub(1,20).."...")
local placeLbl = infoTab:AddLabel("📍  PlaceID:  "..game.PlaceId)
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            charLbl.Text = "🌐  Server Players:  "..#game.Players:GetPlayers()
            local s=tick()
            game:GetService("RunService").Heartbeat:Wait()
            pingLbl.Text = "📶  Ping:  "..math.floor((tick()-s)*1000).."ms"
        end)
    end
end)
infoTab:Show()

local FastRebTab = window:AddTab("⚡  Fast Rebirth")

FastRebTab:AddLabel("Settings").TextSize = 30

local function formatNumber(num)
    if num >= 1e15 then return string.format("%.2fQ", num/1e15) end
    if num >= 1e12 then return string.format("%.2fT", num/1e12) end
    if num >= 1e9 then return string.format("%.2fB", num/1e9) end
    if num >= 1e6 then return string.format("%.2fM", num/1e6) end
    if num >= 1e3 then return string.format("%.2fK", num/1e3) end
    return string.format("%.0f", num)
end

local isRunning = false
local startTime = 0
local totalElapsed = 0
local initialRebirths = rebirthsStat.Value
local lastPaceUpdate = 0

local serverLabel = FastRebTab:AddLabel("Time:")
serverLabel.TextSize = 20
local timeLabel = FastRebTab:AddLabel("0d 0h 0m 0s - Inactive")
local paceLabel = FastRebTab:AddLabel("Pace: 0 / Hour | 0 / Day | 0 / Week")
local averagePaceLabel = FastRebTab:AddLabel("Average Pace: 0 / Hour | 0 / Day | 0 / Week")

paceLabel.TextSize = 17
averagePaceLabel.TextSize = 17

timeLabel.TextSize = 17
timeLabel.TextColor3 = Color3.fromRGB(255, 50, 50)
paceLabel.TextSize = 17

local rebirthsStatsLabel = FastRebTab:AddLabel("Rebirths: "..formatNumber(rebirthsStat.Value).." | Gained: 0")
rebirthsStatsLabel.TextSize = 17

local lastRebirthTime = tick()
local lastRebirthValue = rebirthsStat.Value

local function updateRebirthsLabel()
    local gained = rebirthsStat.Value - initialRebirths
    rebirthsStatsLabel.Text = string.format("Rebirths: %s | Gained: %s", 
                                           formatNumber(rebirthsStat.Value), 
                                           formatNumber(gained))
end

local function updateUI(forceUpdate)
    local currentTime = tick()
    local elapsed = isRunning and (currentTime - startTime + totalElapsed) or totalElapsed
    
    local days = math.floor(elapsed / 86400)
    local hours = math.floor((elapsed % 86400) / 3600)
    local minutes = math.floor((elapsed % 3600) / 60)
    local seconds = math.floor(elapsed % 60)
    
    timeLabel.Text = string.format("%dd %dh %dm %ds - %s", days, hours, minutes, seconds,
                                 isRunning and "Rebirthing" or "Paused")
    timeLabel.TextColor3 = isRunning and Color3.fromRGB(50, 255, 50) or Color3.fromRGB(255, 50, 50)
end

local paceHistoryHour = {}
local paceHistoryDay = {}
local paceHistoryWeek = {}

local maxHistoryLength = 20

local rebirthCount = 0

local function calculatePaceOnRebirth()
    rebirthCount = rebirthCount + 1
    
    if rebirthCount < 2 then
        lastRebirthTime = tick()
        lastRebirthValue = rebirthsStat.Value
        return
    end

    local now = tick()
    local gained = rebirthsStat.Value - lastRebirthValue

    if gained > 0 then
        local avgTimePerRebirth = (now - lastRebirthTime) / gained
        local paceHour = 3600 / avgTimePerRebirth
        local paceDay = 24000 / avgTimePerRebirth
        local paceWeek = 604800 / avgTimePerRebirth

        paceLabel.Text = string.format("Pace: %s / Hour | %s / Day | %s / Week",
            formatNumber(paceHour), formatNumber(paceDay), formatNumber(paceWeek))

        table.insert(paceHistoryHour, paceHour)
        table.insert(paceHistoryDay, paceDay)
        table.insert(paceHistoryWeek, paceWeek)

        if #paceHistoryHour > maxHistoryLength then
            table.remove(paceHistoryHour, 1)
            table.remove(paceHistoryDay, 1)
            table.remove(paceHistoryWeek, 1)
        end

        local function average(tbl)
            local sum = 0
            for _, v in ipairs(tbl) do
                sum = sum + v
            end
            return #tbl > 0 and (sum / #tbl) or 0
        end

        local avgHour = average(paceHistoryHour)
        local avgDay = average(paceHistoryDay)
        local avgWeek = average(paceHistoryWeek)

        averagePaceLabel.Text = string.format("Average Pace: %s / Hour | %s / Day | %s / Week",
            formatNumber(avgHour), formatNumber(avgDay), formatNumber(avgWeek))

        lastRebirthTime = now
        lastRebirthValue = rebirthsStat.Value
    end
end

rebirthsStat:GetPropertyChangedSignal("Value"):Connect(function()
    calculatePaceOnRebirth()
    updateRebirthsLabel()
end)

local function managePets(petName)
    for _, folder in pairs(player.petsFolder:GetChildren()) do
        if folder:IsA("Folder") then
            for _, pet in pairs(folder:GetChildren()) do
                replicatedStorage.rEvents.equipPetEvent:FireServer("unequipPet", pet)
            end
        end
    end
    task.wait(0.01)
    
    for _, pet in pairs(player.petsFolder.Unique:GetChildren()) do
        if pet.Name == petName then
            replicatedStorage.rEvents.equipPetEvent:FireServer("equipPet", pet)
        end
    end
end

local function doRebirth()
    local rebirths = rebirthsStat.Value
    local strengthTarget = 5000 + (rebirths * 2550)
    
    while isRunning and player.leaderstats.Strength.Value < strengthTarget do
        local reps = player.MembershipType == Enum.MembershipType.Premium and 8 or 14
        for _ = 1, reps do
            muscleEvent:FireServer("rep")
        end
        task.wait(0.01)
    end
    
    if isRunning and player.leaderstats.Strength.Value >= strengthTarget then
        managePets("Tribal Overlord")
        task.wait(0.1)
        
        local before = rebirthsStat.Value
        repeat
            replicatedStorage.rEvents.rebirthRemote:InvokeServer("rebirthRequest")
            task.wait(0.05)
        until rebirthsStat.Value > before or not isRunning
    end
end

local function fastRebirthLoop()
    while isRunning do
        managePets("Swift Samurai")
        doRebirth()
        task.wait(0.05)
    end
end

FastRebTab:AddLabel("")

local RebirthLabel = FastRebTab:AddLabel("Rebirthing:")
RebirthLabel.TextSize = 20

local fastRebirthSwitch = FastRebTab:AddSwitch("⚡  Fast Rebirth", function(state)
    isRunning = state
    
    if state then
        startTime = tick()
        task.spawn(fastRebirthLoop)
    else
        totalElapsed = totalElapsed + (tick() - startTime)
        updateUI(true)
    end
end)
fastRebirthSwitch:Set(true)

rebirthsStat:GetPropertyChangedSignal("Value"):Connect(function()
    updateRebirthsLabel() 
end)

task.spawn(function()
    while true do
        updateUI(false)
        task.wait(0.1)
    end
end)

-- Hide Frames Switch
FastRebTab:AddLabel("")
FastRebTab:AddLabel("Misc:").TextSize = 20

local hideFramesActive = true
local hideFramesSwitch = FastRebTab:AddSwitch("Hide Frames", function(bool)
    hideFramesActive = bool
    for _, name in ipairs(blockedFrames) do
        local frame = replicatedStorage:FindFirstChild(name)
        if frame and frame:IsA("GuiObject") then
            frame.Visible = not bool
        end
    end
end)
hideFramesSwitch:Set(true)

-- Lock Position Switch
local lockPositionActive = true
local lockPositionConnection = nil

local function activateLockPosition()
    if lockPositionActive and not lockPositionConnection then
        local currentPos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        lockPositionConnection = game:GetService("RunService").Heartbeat:Connect(function()
            if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = currentPos
            end
        end)
    elseif not lockPositionActive and lockPositionConnection then
        lockPositionConnection:Disconnect()
        lockPositionConnection = nil
    end
end

local lockPositionSwitch = FastRebTab:AddSwitch("Lock Position", function(Value)
    lockPositionActive = Value
    activateLockPosition()
end)
lockPositionSwitch:Set(true)

local running = false
local thread = nil

local sizeSwitch = FastRebTab:AddSwitch("Set Size 1", function(bool)
    running = bool
    if running then
        thread = coroutine.create(function()
            while running do
                game:GetService("ReplicatedStorage").rEvents.changeSpeedSizeRemote:InvokeServer("changeSize", 1)
                wait(0.01)
            end
        end)
        coroutine.resume(thread)
    end
end)

FastRebTab:AddButton("Anti Lag", function()
    local player = game.Players.LocalPlayer
    local playerGui = player:WaitForChild("PlayerGui")
    local lighting = game:GetService("Lighting")

    for _, gui in pairs(playerGui:GetChildren()) do
        if gui:IsA("ScreenGui") then
            gui:Destroy()
        end
    end

    local function darkenSky()
        for _, v in pairs(lighting:GetChildren()) do
            if v:IsA("Sky") then
                v:Destroy()
            end
        end

        local darkSky = Instance.new("Sky")
        darkSky.Name = "DarkSky"
        darkSky.SkyboxBk = "rbxassetid://0"
        darkSky.SkyboxDn = "rbxassetid://0"
        darkSky.SkyboxFt = "rbxassetid://0"
        darkSky.SkyboxLf = "rbxassetid://0"
        darkSky.SkyboxRt = "rbxassetid://0"
        darkSky.SkyboxUp = "rbxassetid://0"
        darkSky.Parent = lighting

        lighting.Brightness = 0
        lighting.ClockTime = 0
        lighting.TimeOfDay = "00:00:00"
        lighting.OutdoorAmbient = Color3.new(0, 0, 0)
        lighting.Ambient = Color3.new(0, 0, 0)
        lighting.FogColor = Color3.new(0, 0, 0)
        lighting.FogEnd = 100

        task.spawn(function()
            while true do
                wait(5)
                if not lighting:FindFirstChild("DarkSky") then
                    darkSky:Clone().Parent = lighting
                end
                lighting.Brightness = 0
                lighting.ClockTime = 0
                lighting.OutdoorAmbient = Color3.new(0, 0, 0)
                lighting.Ambient = Color3.new(0, 0, 0)
                lighting.FogColor = Color3.new(0, 0, 0)
                lighting.FogEnd = 100
            end
        end)
    end

    local function removeParticleEffects()
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("ParticleEmitter") then
                obj:Destroy()
            end
        end
    end

    local function removeLightSources()
        for _, obj in pairs(workspace:GetDescendants()) do
            if obj:IsA("PointLight") or obj:IsA("SpotLight") or obj:IsA("SurfaceLight") then
                obj:Destroy()
            end
        end
    end

    removeParticleEffects()
    removeLightSources()
    darkenSky()
end)

local lockRunning = false
local lockThread = nil

local lockSwitch = FastRebTab:AddSwitch("Lock Position v2", function(state)
    lockRunning = state
    if lockRunning then
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        local lockPosition = hrp.Position

        lockThread = coroutine.create(function()
            while lockRunning do
                hrp.Velocity = Vector3.new(0, 0, 0)
                hrp.RotVelocity = Vector3.new(0, 0, 0)
                hrp.CFrame = CFrame.new(lockPosition)
                wait(0.05) 
            end
        end)

        coroutine.resume(lockThread)
    end
end)

local function activateShake()
    local tool = player.Character:FindFirstChild("Tropical Shake") or player.Backpack:FindFirstChild("Tropical Shake")
    if tool then
        muscleEvent:FireServer("tropicalShake", tool)
    end
end

local autoShakeRunning = false

task.spawn(function()
    while true do
        if autoShakeRunning then
            activateShake()
            task.wait(450)
        else
            task.wait(1)
        end
    end
end)

local autoshakeSwitch = FastRebTab:AddSwitch("Auto Shake", function(state)
    autoShakeRunning = state
    if state then
        activateShake()
    end
end)
autoshakeSwitch:Set(false)

local spinwheelSwitch = FastRebTab:AddSwitch("Spin Fortune Wheel", function(bool)
    _G.AutoSpinWheel = bool
    
    if bool then
        spawn(function()
            while _G.AutoSpinWheel and wait(1) do
                game:GetService("ReplicatedStorage").rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel", game:GetService("ReplicatedStorage").fortuneWheelChances["Fortune Wheel"])
            end
        end)
    end
end)

FastRebTab:AddButton("Jungle Lift",function()
    local player = game.Players.LocalPlayer
    local char = player.Character or Player.CharacterAdded:wait()
    local hrp = char:WaitForChild("HumanoidRootPart")
    hrp.CFrame = CFrame.new(-8642.396484375, 6.7980651855, 2086.1030273)
    task.wait(0.2)
    VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
    task.wait(0.05)
    VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
end)

-- ====== CUADRO DE ESTADÍSTICAS EN PANTALLA ======

task.wait(0.5)

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "TimeTrackerGui"
screenGui.ResetOnSpawn = false
screenGui.Parent = game.CoreGui

-- Crear el cuadro principal
local mainFrame = Instance.new("Frame")
mainFrame.Name = "TimeFrame"
mainFrame.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
mainFrame.BackgroundTransparency = 0.2
mainFrame.BorderSizePixel = 2
mainFrame.BorderColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Position = UDim2.new(0.7, 0, 0.1, 0)
mainFrame.Size = UDim2.new(0, 120, 0, 180)
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = true

-- Título
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "Title"
titleLabel.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
titleLabel.BorderSizePixel = 0
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.Size = UDim2.new(1, 0, 0, 35)
titleLabel.Font = Enum.Font.GothamBold
titleLabel.TextColor3 = Color3.fromRGB(192, 192, 192)
titleLabel.TextSize = 14
titleLabel.Text = "⏱️ Stats"
titleLabel.Parent = mainFrame

-- Contenedor de stats
local statsContainer = Instance.new("Frame")
statsContainer.Name = "StatsContainer"
statsContainer.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
statsContainer.BackgroundTransparency = 0.2
statsContainer.BorderSizePixel = 0
statsContainer.Position = UDim2.new(0, 0, 0, 35)
statsContainer.Size = UDim2.new(1, 0, 1, -35)
statsContainer.Parent = mainFrame

-- Label de estadísticas
local statsLabel = Instance.new("TextLabel")
statsLabel.Name = "StatsLabel"
statsLabel.BackgroundColor3 = Color3.fromRGB(192, 192, 192)
statsLabel.BackgroundTransparency = 0.2
statsLabel.BorderSizePixel = 0
statsLabel.Position = UDim2.new(0, 5, 0, 5)
statsLabel.Size = UDim2.new(1, -10, 1, -10)
statsLabel.Font = Enum.Font.GothamSemibold
statsLabel.TextColor3 = Color3.fromRGB(30, 30, 30)
statsLabel.TextSize = 12
statsLabel.TextXAlignment = Enum.TextXAlignment.Left
statsLabel.TextYAlignment = Enum.TextYAlignment.Top
statsLabel.TextWrapped = true
statsLabel.Parent = statsContainer

-- Actualizar estadísticas en tiempo real
task.spawn(function()
    while true do
        local elapsed = isRunning and (tick() - startTime + totalElapsed) or totalElapsed
        local days = math.floor(elapsed / 86400)
        local hours = math.floor((elapsed % 86400) / 3600)
        local minutes = math.floor((elapsed % 3600) / 60)
        local seconds = math.floor(elapsed % 60)
        
        local gained = rebirthsStat.Value - initialRebirths
        
        statsLabel.Text = string.format(
            "⏱️ %dd %dh %dm %ds\n✨ %s\n📊 %s\n🚀 %s",
            days, hours, minutes, seconds,
            formatNumber(rebirthsStat.Value),
            formatNumber(gained),
            isRunning and "RUNNING" or "PAUSED"
        )
        task.wait(0.5)
    end
end)

-- Anti AFK
local antiAfkService = game:service'VirtualUser'
game:service'Players'.LocalPlayer.Idled:connect(function()
    antiAfkService:CaptureController()
    antiAfkService:ClickButton2(Vector2.new())
end)
