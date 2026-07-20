-- âš¡ SCP HUB | MUSCLE LEGENDS V5 | Made by TEJAZ
-- Library: SilenceElerium by imhenne187

-- Reuse library from selector if available, else load fresh
local library
if _G.scpLibrary then
    library = _G.scpLibrary
else
    library = loadstring(game:HttpGet("https://raw.githubusercontent.com/imhenne187/SilenceElerium/refs/heads/main/src/SilenceEleriumLibrary.luau", true))()
    _G.scpLibrary = library
end

-- SCP LOGO INJECTOR
local injectSCPLogo = _G.injectSCPLogo or (function(wFrame)
    task.spawn(function()
        -- Wait up to 3 seconds for Bar to exist
        local bar
        for i=1,60 do
            bar = wFrame:FindFirstChild("Bar")
            if bar then break end
            task.wait(0.05)
        end
        if not bar then return end
        local tog
        for i=1,20 do
            tog = bar:FindFirstChild("Toggle")
            if tog then break end
            task.wait(0.05)
        end
        if not tog then return end
        pcall(function()
            tog.Image="rbxassetid://3926305904"
            tog.ImageColor3=Color3.fromRGB(255,60,60)
            tog.Size=UDim2.new(0,18,0,18)
            local ex=bar:FindFirstChild("SCPLogo"); if ex then ex:Destroy() end
            local lbl=Instance.new("TextLabel")
            lbl.Name="SCPLogo"; lbl.Size=UDim2.new(0,32,0,14)
            lbl.Position=UDim2.new(0,22,0,2); lbl.BackgroundTransparency=1
            lbl.Text="SCP"; lbl.TextColor3=Color3.fromRGB(255,80,80)
            lbl.TextSize=11; lbl.Font=Enum.Font.FredokaOne
            lbl.ZIndex=tog.ZIndex+1; lbl.Parent=bar
        end)
    end)
end)

local Players    = game:GetService("Players")
local RS         = game:GetService("ReplicatedStorage")
local RunSvc     = game:GetService("RunService")
local SG         = game:GetService("StarterGui")
local LP         = Players.LocalPlayer
repeat task.wait() until LP and LP.Character

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  HELPERS
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local function notify(t,m,d)
    pcall(function() SG:SetCore("SendNotification",{Title=t,Text=m,Duration=d or 3}) end)
end
local function fmt(n)
    n=tonumber(n)or 0
    if n>=1e12 then return("%.1fT"):format(n/1e12)
    elseif n>=1e9  then return("%.1fB"):format(n/1e9)
    elseif n>=1e6  then return("%.1fM"):format(n/1e6)
    elseif n>=1e3  then return("%.1fK"):format(n/1e3)
    else return tostring(math.floor(n)) end
end
local function findPlayer(q)
    if not q or q=="" then return LP end
    local l=q:lower()
    for _,p in ipairs(Players:GetPlayers()) do
        if p.Name:lower()==l or p.DisplayName:lower()==l then return p end
    end
    for _,p in ipairs(Players:GetPlayers()) do
        if p.Name:lower():find(l,1,true) then return p end
    end
end
local function getPunch()
    local p=LP.Backpack:FindFirstChild("Punch")
    if p and LP.Character then p.Parent=LP.Character end
    return LP.Character and LP.Character:FindFirstChild("Punch")
end

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  KEY SYSTEM
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local KEY_URL = "https://pastebin.com/raw/n7UWskEA"
local function getKeys()
    local ok,res=pcall(function() return game:HttpGet(KEY_URL) end)
    if not ok then return {} end
    local k={}
    for v in res:gmatch("[^\n]+") do
        local t=v:match("^%s*(.-)%s*$"); if t~="" then table.insert(k,t) end
    end
    return k
end
local function checkKey(e)
    for _,v in pairs(getKeys()) do if v==e then return true end end
    return false
end

-- KEY SYSTEM (required every execution)
local keyPassed=false
local kWin, kFrame = library:AddWindow("ðŸ”‘ SCP HUB â€” Key System", {
    main_color          = Color3.fromRGB(185,30,30),
    title_bar           = {Color3.fromRGB(185,30,30), Color3.fromRGB(100,10,10)},
    background          = {Color3.fromRGB(18,5,5)},
    background_transparency = 0,
    min_size            = Vector2.new(600,160),
    toggle_key          = Enum.KeyCode.RightShift,
    can_resize          = false,
})
local kt,_ = kWin:AddTab("ðŸ”‘  Key")
kt:AddLabel("âš¡ SCP HUB  |  Muscle Legends V5  |  Made by TEJAZ")
kt:AddLabel("ðŸ”‘  Get your FREE key at:  discord.gg/nDSy4jdVDc")
local stLbl = kt:AddLabel("ðŸ“‹  Paste your key below then press Enter")
kt:AddTextBox("Paste key here then press Enter...", function(v)
    if checkKey(v) then
        stLbl.Text = "âœ…  Key accepted!  Loading SCP HUB..."
        keyPassed = true
    else
        stLbl.Text = "âŒ  Wrong key!  discord.gg/nDSy4jdVDc"
    end
end,{clear=true})
kt:AddButton("ðŸ’¬  Copy Discord Link", function()
    setclipboard("https://discord.gg/nDSy4jdVDc")
    notify("SCP HUB","âœ… Discord copied!",3)
end)
injectSCPLogo(kFrame)
kt:Show()
repeat task.wait(0.5) until keyPassed
kFrame:Destroy()

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  MAIN WINDOW
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local WIN_CFG = {
    main_color          = Color3.fromRGB(185,30,30),
    title_bar           = {Color3.fromRGB(200,35,35), Color3.fromRGB(100,10,10)},
    background          = {Color3.fromRGB(18,5,5)},
    background_transparency = 0,
    min_size            = Vector2.new(600,280),
    toggle_key          = Enum.KeyCode.RightShift,
    can_resize          = true,
}
local win, winFrame = library:AddWindow("âš¡ SCP HUB  |  Muscle Legends V5  |  TEJAZ", WIN_CFG)
task.defer(function() injectSCPLogo(winFrame) end)

-- Replace Silence logo with SCP skull icon
pcall(function()
    local bar=winFrame:FindFirstChild("Bar")
    if bar then local tog=bar:FindFirstChild("Toggle")
        if tog then tog.Image="rbxassetid://6031075931"; tog.ImageColor3=Color3.fromRGB(255,80,80) end
    end
end)
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  TAB: INFO
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local infoTab,_ = win:AddTab("ðŸ“‹  Info")
infoTab:AddLabel("â”â”â”â”â”â”â”  âš¡ SCP HUB INFO  â”â”â”â”â”â”â”")
infoTab:AddLabel("ðŸŽ®  Script:   SCP HUB  |  Muscle Legends V5")
infoTab:AddLabel("ðŸ‘‘  Author:   TEJAZ  (SCP_TEJAZ)")
infoTab:AddLabel("ðŸ’Ž  Version:  4.5")
infoTab:AddLabel("ðŸ”‘  Key:      discord.gg/nDSy4jdVDc")
infoTab:AddLabel("ðŸ’¬  Discord:  discord.gg/nDSy4jdVDc")
infoTab:AddLabel("ðŸ”„  Toggle:   RightShift key")
infoTab:AddLabel("â”â”â”â”â”â”â”  ðŸ“Š LIVE PLAYER INFO  â”â”â”â”â”â”â”")
local pingLbl  = infoTab:AddLabel("ðŸ“¶  Ping:  calculating...")
local nameLbl  = infoTab:AddLabel("ðŸ‘¤  Name:  "..LP.Name)
local dispLbl  = infoTab:AddLabel("ðŸ·ï¸  Display:  "..LP.DisplayName)
local idLbl    = infoTab:AddLabel("ðŸ†”  UserID:  "..LP.UserId)
local charLbl  = infoTab:AddLabel("ðŸŒ  Server Players:  "..#Players:GetPlayers())
infoTab:AddLabel("â”â”â”â”â”â”â”  ðŸ”§ SERVER INFO  â”â”â”â”â”â”â”")
local jobLbl   = infoTab:AddLabel("ðŸ–¥ï¸  JobID:  "..game.JobId:sub(1,20).."...")
local placeLbl = infoTab:AddLabel("ðŸ“  PlaceID:  "..game.PlaceId)
task.spawn(function()
    while task.wait(2) do
        pcall(function()
            charLbl.Text = "ðŸŒ  Server Players:  "..#Players:GetPlayers()
            local s=tick()
            game:GetService("RunService").Heartbeat:Wait()
            pingLbl.Text = "ðŸ“¶  Ping:  "..math.floor((tick()-s)*1000).."ms"
        end)
    end
end)
infoTab:AddLabel("â”â”â”â”â”â”â”  ðŸ”— LINKS  â”â”â”â”â”â”â”")
infoTab:AddButton("ðŸ’¬  Copy Discord Link", function()
    setclipboard("https://discord.gg/nDSy4jdVDc")
    notify("SCP HUB","âœ… Discord copied!",3)
end)
infoTab:AddButton("ðŸ—‘ï¸  Clear Saved Key", function()
    if writefile then writefile("SCP_HUB/key.txt","") end
    notify("SCP HUB","ðŸ—‘ï¸ Key cleared â€” rejoin to re-enter",4)
end)

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  TAB: OP MAIN
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local opTab,_ = win:AddTab("âš¡  Op Main")
local killM = "Teleport"
local wl = {}

opTab:AddLabel("â”â”â”â”â”â”â”  ðŸ‘Š AUTO PUNCH  â”â”â”â”â”â”â”")
opTab:AddSwitch("ðŸ‘Š  Auto Punch", function(v)
    _G.scpAP=v
    if v then task.spawn(function() while _G.scpAP do
        local p=LP.Backpack:FindFirstChild("Punch") or (LP.Character and LP.Character:FindFirstChild("Punch"))
        if p then if p.Parent~=LP.Character then p.Parent=LP.Character end; p:Activate() end
        task.wait()
    end end) end
end)
opTab:AddSwitch("âš¡  Fast Punch (0 cooldown)", function(v)
    local p=LP.Backpack:FindFirstChild("Punch") or (LP.Character and LP.Character:FindFirstChild("Punch"))
    if p then local at=p:FindFirstChild("attackTime"); if at then at.Value=v and 0 or 0.35 end end
end)

opTab:AddLabel("â”â”â”â”â”â”â”  ðŸ‘‘ AUTO KING  â”â”â”â”â”â”â”")
opTab:AddSwitch("ðŸ‘‘  Auto King (Lock at throne)", function(v)
    local kCF=CFrame.new(-8865,430,-5749)
    if v then
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame=kCF
        end
        getgenv().scpKL=RunSvc.Heartbeat:Connect(function()
            if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                LP.Character.HumanoidRootPart.CFrame=kCF
            end
        end)
    else
        if getgenv().scpKL then getgenv().scpKL:Disconnect(); getgenv().scpKL=nil end
    end
end)

opTab:AddLabel("â”â”â”â”â”â”â”  ðŸ›¡ï¸ DEFENSE  â”â”â”â”â”â”â”")
opTab:AddSwitch("ðŸ›¡ï¸  Anti Knockback", function(v)
    local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
    if v and hrp then
        local bv=Instance.new("BodyVelocity",hrp)
        bv.MaxForce=Vector3.new(1e5,0,1e5); bv.Velocity=Vector3.zero; bv.P=1250
    elseif not v and hrp then
        local bv=hrp:FindFirstChild("BodyVelocity"); if bv then bv:Destroy() end
    end
end)
opTab:AddSwitch("â™¾ï¸  Infinite Jump", function(v)
    getgenv().scpIJ=v
    if v then
        getgenv().scpIJC=game:GetService("UserInputService").JumpRequest:Connect(function()
            if getgenv().scpIJ and LP.Character and LP.Character:FindFirstChild("Humanoid") then
                LP.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
            end
        end)
    elseif getgenv().scpIJC then getgenv().scpIJC:Disconnect() end
end)
opTab:AddSwitch("ðŸŒŒ  Low Gravity", function(v) workspace.Gravity=v and 50 or 196.2 end)
opTab:AddSwitch("ðŸ‘»  Noclip", function(v)
    getgenv().scpNC=v
    if v then
        getgenv().scpNCC=RunSvc.Stepped:Connect(function()
            if getgenv().scpNC and LP.Character then
                for _,p in pairs(LP.Character:GetDescendants()) do
                    if p:IsA("BasePart") then p.CanCollide=false end
                end
            end
        end)
    elseif getgenv().scpNCC then getgenv().scpNCC:Disconnect() end
end)
opTab:AddSwitch("ðŸŒ€  Spin (Anti-Aim)", function(v)
    getgenv().scpSpin=v
    if v then task.spawn(function() while getgenv().scpSpin do
        if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
            LP.Character.HumanoidRootPart.CFrame=LP.Character.HumanoidRootPart.CFrame*CFrame.Angles(0,math.rad(10),0)
        end; task.wait(0.05)
    end end) end
end)

opTab:AddLabel("â”â”â”â”â”â”â”  âš”ï¸ KILL PLAYERS  â”â”â”â”â”â”â”")
opTab:AddButton("ðŸ”„  Toggle Kill Method (now: Teleport)", function()
    killM=killM=="Teleport" and "None" or "Teleport"
    notify("SCP HUB","Kill Method: "..killM,2)
end)
opTab:AddTextBox("âž•  Whitelist name (enter to add/remove)", function(v)
    if table.find(wl,v) then
        for i,n in ipairs(wl) do if n==v then table.remove(wl,i); break end end
        notify("SCP","âŒ Removed: "..v,2)
    else table.insert(wl,v); notify("SCP","âœ… Added: "..v,2) end
end,{clear=true})

local function doKill(target)
    if not target or target==LP then return end
    local hrp=target.Character and target.Character:FindFirstChild("HumanoidRootPart")
    local punch=getPunch(); if not hrp then return end
    if killM=="Teleport" and LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
        hrp.CFrame=LP.Character.HumanoidRootPart.CFrame*CFrame.new(0,0,-3)
    end
    if punch then punch:Activate() end
    local rh=LP.Character:FindFirstChild("RightHand"); local lh=LP.Character:FindFirstChild("LeftHand")
    if rh and lh then
        pcall(firetouchinterest,rh,hrp,1); pcall(firetouchinterest,lh,hrp,1)
        pcall(firetouchinterest,rh,hrp,0); pcall(firetouchinterest,lh,hrp,0)
    end
    pcall(function() LP.muscleEvent:FireServer("punch","rightHand") end)
    pcall(function() LP.muscleEvent:FireServer("punch","leftHand") end)
end

opTab:AddSwitch("â˜ ï¸  Kill All Players", function(v)
    getgenv().scpKA=v
    if v then task.spawn(function() while getgenv().scpKA do
        for _,p in ipairs(Players:GetPlayers()) do
            if p~=LP and not table.find(wl,p.Name) then pcall(doKill,p) end
        end; task.wait(0.1)
    end end) end
end)
local kTgt=""
opTab:AddTextBox("ðŸŽ¯  Kill specific â€” player name", function(v) kTgt=v end,{clear=false})
opTab:AddSwitch("ðŸŽ¯  Kill Specific Player", function(v)
    getgenv().scpKO=v
    if v then task.spawn(function() while getgenv().scpKO do
        local p=findPlayer(kTgt)
        if p and p~=LP and not table.find(wl,p.Name) then pcall(doKill,p) end
        task.wait(0.1)
    end end) end
end)
local scN=""
opTab:AddTextBox("ðŸ“¹  Spy camera â€” player name", function(v) scN=v end,{clear=false})
opTab:AddSwitch("ðŸ“¹  Spy Camera", function(v)
    if v then
        getgenv().scpSC=true
        task.spawn(function() while getgenv().scpSC do
            local p=findPlayer(scN)
            if p and p.Character and p.Character:FindFirstChild("Humanoid") then
                workspace.CurrentCamera.CameraSubject=p.Character.Humanoid
            end; task.wait(0.25)
        end end)
    else
        getgenv().scpSC=false
        if LP.Character and LP.Character:FindFirstChild("Humanoid") then
            workspace.CurrentCamera.CameraSubject=LP.Character.Humanoid
        end
    end
end)

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  TAB: FARM
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local farmTab,_ = win:AddTab("ðŸŒ´  Farm")

farmTab:AddLabel("â”â”â”â”â”â”â”  âš¡ AUTO LIFT  â”â”â”â”â”â”â”")
farmTab:AddSwitch("âš¡  Auto Lift (FireServer rep)", function(v)
    getgenv().scpAL=v
    if v then task.spawn(function() while getgenv().scpAL do
        pcall(function()
            local pu=LP.Backpack:FindFirstChild("Pushup") or LP.Backpack:FindFirstChild("Pushups")
            if pu and LP.Character then pu.Parent=LP.Character end
            LP.muscleEvent:FireServer("rep")
        end); task.wait(0.1)
    end end) end
end)
farmTab:AddSwitch("âš–ï¸  Auto Weight Rep", function(v)
    getgenv().scpWR=v
    if v then task.spawn(function() while getgenv().scpWR do
        pcall(function()
            local w=LP.Backpack:FindFirstChild("Weight")
            if w and LP.Character then LP.Character.Humanoid:EquipTool(w) end
            LP.muscleEvent:FireServer("rep")
        end); task.wait(0.01)
    end end) end
end)
farmTab:AddSwitch("ðŸ‹ï¸  Auto Bench Press", function(v)
    getgenv().scpBP=v
    if v then task.spawn(function() while getgenv().scpBP do
        pcall(function() LP.muscleEvent:FireServer("rep","bench") end); task.wait(0.05)
    end end) end
end)

farmTab:AddLabel("â”â”â”â”â”â”â”  ðŸŽ’ AUTO EQUIP  â”â”â”â”â”â”â”")
for _,tn in ipairs({"Weight","Pushups","Situps","Handstand","Dumbbell"}) do
    farmTab:AddSwitch("ðŸŽ’  Equip "..tn, function(v)
        getgenv()["scpEQ"..tn]=v
        if v then task.spawn(function() while getgenv()["scpEQ"..tn] do
            local w=LP.Backpack:FindFirstChild(tn)
            if w and LP.Character then w.Parent=LP.Character end
            task.wait(0.1)
        end end) end
    end)
end

farmTab:AddLabel("â”â”â”â”â”â”â”  ðŸŒ´ JUNGLE MACHINES  â”â”â”â”â”â”â”")
local machines={
    {"ðŸŒ´  Jungle Bench",  "Jungle Bench",   CFrame.new(-8629.88,64.88,1855.03)},
    {"ðŸ‹ï¸  Bar Lift",      "Jungle Bar Lift", CFrame.new(-8678.06,14.50,2089.26)},
    {"ðŸ¦µ  Squat",         "Jungle Squat",    CFrame.new(-8374.26,34.59,2932.45)},
}
for _,m in ipairs(machines) do
    local gk="scpJM"..m[2]:gsub(" ","")
    farmTab:AddSwitch(m[1], function(v)
        getgenv()[gk]=v
        if v then task.spawn(function() while getgenv()[gk] do
            pcall(function()
                if LP.Character then
                    LP.Character:SetPrimaryPartCFrame(m[3])
                    RS.rEvents.machineInteractRemote:InvokeServer("useMachine",workspace.machinesFolder[m[2]].interactSeat)
                end
            end); task.wait(0.1)
        end end) end
    end)
end

farmTab:AddLabel("â”â”â”â”â”â”â”  ðŸ”„ AUTO REBIRTH  â”â”â”â”â”â”â”")
local tReb=nil
farmTab:AddTextBox("Target rebirths (blank = infinite)", function(v) tReb=tonumber(v) end,{clear=false})
farmTab:AddSwitch("ðŸ”„  Auto Rebirth", function(v)
    getgenv().scpAReb=v
    if v then task.spawn(function() while getgenv().scpAReb do
        local r=LP:FindFirstChild("leaderstats") and LP.leaderstats:FindFirstChild("Rebirths")
        if r and tReb and r.Value>=tReb then
            getgenv().scpAReb=false; notify("SCP","âœ… Rebirth goal reached!",4); break
        end
        pcall(function() RS.rEvents.rebirthRemote:InvokeServer("rebirthRequest") end)
        task.wait(0.15)
    end end) end
end)
farmTab:AddSwitch("ðŸ“  Auto Size 2", function(v)
    getgenv().scpAS2=v
    if v then task.spawn(function() while getgenv().scpAS2 do
        pcall(function() RS.rEvents.changeSpeedSizeRemote:InvokeServer("changeSize",2) end)
        task.wait(0)
    end end) end
end)
farmTab:AddSwitch("ðŸ“  Lock Position", function(v)
    if v then
        local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local pos=hrp.CFrame
            getgenv().scpPL=RunSvc.Heartbeat:Connect(function()
                if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                    LP.Character.HumanoidRootPart.CFrame=pos
                end
            end)
        end
    else
        if getgenv().scpPL then getgenv().scpPL:Disconnect(); getgenv().scpPL=nil end
    end
end)
farmTab:AddSwitch("ðŸ™ˆ  Hide Frames (FPS Boost)", function(v)
    for _,f in pairs(RS:GetChildren()) do
        if f.Name:match("Frame$") then f.Visible=not v end
    end
end)
farmTab:AddSwitch("ðŸŽ®  Free AutoLift Gamepass", function(v)
    if v then pcall(function()
        for _,gp in pairs(RS.gamepassIds:GetChildren()) do
            local val=Instance.new("IntValue"); val.Name=gp.Name; val.Value=gp.Value; val.Parent=LP.ownedGamepasses
        end
    end); notify("SCP","ðŸŽ® Gamepass unlocked!",3) end
end)

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  TAB: FAST FARM (Rocks)
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local fastTab,_ = win:AddTab("âš¡  Fast Farm")

fastTab:AddLabel("â”â”â”â”â”â”â”  ðŸª¨ ROCK SETUP  â”â”â”â”â”â”â”")
fastTab:AddSwitch("ðŸ‘Š  Auto Punch", function(v)
    _G.scpAP2=v
    if v then task.spawn(function() while _G.scpAP2 do
        local p=LP.Backpack:FindFirstChild("Punch") or (LP.Character and LP.Character:FindFirstChild("Punch"))
        if p then if p.Parent~=LP.Character then p.Parent=LP.Character end; p:Activate() end
        task.wait()
    end end) end
end)
fastTab:AddSwitch("âš¡  Fast Punch (0 cooldown)", function(v)
    local p=LP.Backpack:FindFirstChild("Punch") or (LP.Character and LP.Character:FindFirstChild("Punch"))
    if p then local at=p:FindFirstChild("attackTime"); if at then at.Value=v and 0 or 0.3 end end
end)
fastTab:AddSwitch("ðŸ“  Lock Position", function(v)
    if v then
        local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then
            local pos=hrp.CFrame
            getgenv().scpPL2=RunSvc.Heartbeat:Connect(function()
                if LP.Character and LP.Character:FindFirstChild("HumanoidRootPart") then
                    LP.Character.HumanoidRootPart.CFrame=pos
                end
            end)
        end
    else
        if getgenv().scpPL2 then getgenv().scpPL2:Disconnect(); getgenv().scpPL2=nil end
    end
end)
fastTab:AddSwitch("ðŸ™ˆ  Hide Frames", function(v)
    for _,f in pairs(RS:GetChildren()) do if f.Name:match("Frame$") then f.Visible=not v end end
end)

fastTab:AddLabel("â”â”â”â”â”â”â”  ðŸª¨ SELECT ROCK  â”â”â”â”â”â”â”")
local rockList={
    {"ðŸŒ´  Jungle Rock",10000000},{"ðŸ‘‘  Muscle King",5000000},{"âš¡  Legnds",1000000},
    {"ðŸª¨  Large Rock",1000000},{"ðŸ”¥  Inferno",750000},{"ðŸ”®  Mystic",400000},
    {"â„ï¸  Froze",150000},{"ðŸ¥‡  Golden",5000},{"ðŸ‘Š  Punch Rock",10},{"ðŸª¨  Tiny Rock",0},
}
for _,rd in ipairs(rockList) do
    local rN,rD=rd[1],rd[2]
    fastTab:AddSwitch(rN.." ("..fmt(rD)..")", function(v)
        _G.scpRock=v
        if v then
            notify("SCP","ðŸª¨ Farming: "..rN,2)
            task.spawn(function() while _G.scpRock do
                pcall(function()
                    if not LP.Character then return end
                    local punch=LP.Backpack:FindFirstChild("Punch")
                    if punch then punch.Parent=LP.Character end
                    local mf=workspace:FindFirstChild("machinesFolder")
                    if mf then for _,obj in pairs(mf:GetDescendants()) do
                        if obj.Name=="neededDurability" and obj.Value==rD then
                            local rock=obj.Parent:FindFirstChild("Rock")
                            if rock then
                                local rh=LP.Character:FindFirstChild("RightHand")
                                local lh=LP.Character:FindFirstChild("LeftHand")
                                if rh then pcall(firetouchinterest,rh,rock,0); pcall(firetouchinterest,rh,rock,1) end
                                if lh then pcall(firetouchinterest,lh,rock,0); pcall(firetouchinterest,lh,rock,1) end
                            end
                        end
                    end end
                    LP.muscleEvent:FireServer("punch","rightHand")
                    LP.muscleEvent:FireServer("punch","leftHand")
                    local pu=LP.Character:FindFirstChild("Punch"); if pu then pu:Activate() end
                end); task.wait(0.05)
            end end)
        end
    end)
end

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  TAB: GIFTS
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local giftTab,_ = win:AddTab("ðŸŽ  Gifts")

giftTab:AddLabel("â”â”â”â”â”â”â”  ðŸ“¦ INVENTORY  â”â”â”â”â”â”â”")
local eLbl=giftTab:AddLabel("ðŸ¥š  Eggs: 0")
local sLbl=giftTab:AddLabel("ðŸ¥¤  Shakes: 0")
local function refInv()
    local cf=LP:FindFirstChild("consumablesFolder"); local e,s=0,0
    if cf then for _,i in ipairs(cf:GetChildren()) do
        if i.Name=="Protein Egg" then e=e+1
        elseif i.Name=="Tropical Shake" then s=s+1 end
    end end
    eLbl.Text="ðŸ¥š  Eggs: "..e; sLbl.Text="ðŸ¥¤  Shakes: "..s
end
task.spawn(function() while task.wait(5) do refInv() end end); refInv()
giftTab:AddButton("ðŸ”„  Refresh Inventory", function() refInv() end)

giftTab:AddLabel("â”â”â”â”â”â”â”  ðŸ¥š EGG GIFTER  â”â”â”â”â”â”â”")
local eTarget,eAmount=nil,1
giftTab:AddTextBox("Target player name", function(v)
    local p=Players:FindFirstChild(v) or findPlayer(v)
    if p then eTarget=p; notify("SCP","Target: "..p.Name,2)
    else notify("SCP","âŒ Player not found",2) end
end,{clear=false})
giftTab:AddTextBox("Amount of eggs", function(v) eAmount=tonumber(v) or 1 end,{clear=false})
giftTab:AddButton("ðŸ¥š  Gift Eggs Now", function()
    if not eTarget then notify("SCP","âŒ Set target first!",3); return end
    task.spawn(function()
        local n=0; local cf=LP:FindFirstChild("consumablesFolder")
        if cf then for i=1,eAmount do
            local egg=cf:FindFirstChild("Protein Egg")
            if egg then pcall(function() RS.rEvents.giftRemote:InvokeServer(eTarget,egg) end); n=n+1 end
            task.wait(0.5)
        end end
        notify("SCP","âœ… Gifted "..n.." eggs â†’ "..eTarget.Name,4); refInv()
    end)
end)

giftTab:AddLabel("â”â”â”â”â”â”â”  ðŸ¥¤ SHAKE GIFTER  â”â”â”â”â”â”â”")
local sTarget,sAmount=nil,1
giftTab:AddTextBox("Target player name", function(v)
    local p=Players:FindFirstChild(v) or findPlayer(v)
    if p then sTarget=p; notify("SCP","Target: "..p.Name,2)
    else notify("SCP","âŒ Player not found",2) end
end,{clear=false})
giftTab:AddTextBox("Amount of shakes", function(v) sAmount=tonumber(v) or 1 end,{clear=false})
giftTab:AddButton("ðŸ¥¤  Gift Shakes Now", function()
    if not sTarget then notify("SCP","âŒ Set target first!",3); return end
    task.spawn(function()
        local n=0; local cf=LP:FindFirstChild("consumablesFolder")
        if cf then for i=1,sAmount do
            local sh=cf:FindFirstChild("Tropical Shake")
            if sh then pcall(function() RS.rEvents.giftRemote:InvokeServer(sTarget,sh) end); n=n+1 end
            task.wait(0.5)
        end end
        notify("SCP","âœ… Gifted "..n.." shakes â†’ "..sTarget.Name,4); refInv()
    end)
end)

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  TAB: MISC
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local miscTab,_ = win:AddTab("âš™ï¸  Misc")

miscTab:AddLabel("â”â”â”â”â”â”â”  ðŸ–¥ï¸ PERFORMANCE  â”â”â”â”â”â”â”")
miscTab:AddSwitch("ðŸ–¥ï¸  Low Graphics (FPS Boost)", function(v)
    game.Lighting.GlobalShadows=not v; game.Lighting.FogEnd=v and 9e9 or 1e5
    game.Lighting.Brightness=v and 0 or 2; settings().Rendering.QualityLevel=v and "Level01" or "Level21"
    if v then for _,f in pairs(game:GetDescendants()) do
        pcall(function() if f:IsA("ParticleEmitter") or f:IsA("Trail") then f.Lifetime=NumberRange.new(0) end end)
    end end
end)
miscTab:AddSwitch("ðŸ”†  Fullbright", function(v)
    game.Lighting.Brightness=v and 10 or 2; game.Lighting.GlobalShadows=not v
    game.Lighting.ClockTime=v and 14 or 6
end)
miscTab:AddSwitch("ðŸŒŠ  Walk on Water", function(v)
    if v then
        local sz=2048; local ct=math.ceil(50000/sz)
        for x=-ct,ct do for z=-ct,ct do
            local p=Instance.new("Part"); p.Size=Vector3.new(sz,1,sz)
            p.Position=Vector3.new(x*sz,-9.5,z*sz); p.Anchored=true
            p.Transparency=1; p.CanCollide=true; p.Name="SCPWater"; p.Parent=workspace
        end end
    else
        for _,p in pairs(workspace:GetChildren()) do if p.Name=="SCPWater" then p:Destroy() end end
    end
end)
miscTab:AddButton("ðŸš«  Remove Ad Portals", function()
    local c=0
    for _,v in pairs(game:GetDescendants()) do if v.Name=="RobloxForwardPortals" then v:Destroy(); c=c+1 end end
    if _G.scpAdC then _G.scpAdC:Disconnect() end
    _G.scpAdC=game.DescendantAdded:Connect(function(v) if v.Name=="RobloxForwardPortals" then v:Destroy() end end)
    notify("SCP","ðŸš« Removed "..c.." portals",3)
end)
miscTab:AddButton("ðŸ›¡ï¸  Anti AFK", function()
    pcall(function() loadstring(game:HttpGet("https://raw.githubusercontent.com/hassanxzayn-lua/Anti-afk/main/antiafkbyhassanxzyn"))() end)
    notify("SCP","ðŸ›¡ï¸ Anti AFK ON",3)
end)
miscTab:AddSwitch("âš¡  Speed Hack (100)", function(v)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed=v and 100 or 16 end
end)
miscTab:AddSwitch("ðŸš€  Ultra Speed (250)", function(v)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.WalkSpeed=v and 250 or 16 end
end)
miscTab:AddSwitch("ðŸ¦˜  High Jump", function(v)
    if LP.Character and LP.Character:FindFirstChild("Humanoid") then LP.Character.Humanoid.JumpPower=v and 100 or 50 end
end)

miscTab:AddLabel("â”â”â”â”â”â”â”  ðŸŒ€ TELEPORT  â”â”â”â”â”â”â”")
local tpList={
    {"ðŸ–ï¸  Beach",Vector3.new(0,0,0)},{"â„ï¸  Frost Gym",Vector3.new(-2650,7,-393)},
    {"ðŸ”®  Mythical Gym",Vector3.new(2255,7,1071)},{"â™¾ï¸  Eternal Gym",Vector3.new(-6768,7,-1287)},
    {"âš¡  Legend Gym",Vector3.new(4429,991,-3880)},{"ðŸ‘‘  Muscle King",Vector3.new(-8799,17,-5798)},
    {"ðŸŒ´  Jungle Gym",Vector3.new(-7894,6,2386)},{"ðŸ”¥  Lava Brawl",Vector3.new(4471,119,-8836)},
    {"ðŸœï¸  Desert Brawl",Vector3.new(960,17,-7398)},{"ðŸ‹ï¸  Tiny Gym",Vector3.new(50,7,1918)},
}
for _,loc in ipairs(tpList) do
    miscTab:AddButton(loc[1], function()
        local hrp=LP.Character and LP.Character:FindFirstChild("HumanoidRootPart")
        if hrp then hrp.CFrame=CFrame.new(loc[2]); notify("SCP","ðŸŒ€ "..loc[1],2) end
    end)
end

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  TAB: BUY PETS
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local petsTab,_ = win:AddTab("ðŸ’Ž  Buy Pets")

petsTab:AddLabel("â”â”â”â”â”â”â”  ðŸ¥š BUY PETS  â”â”â”â”â”â”â”")
local petNames={
    "Neon Guardian","Shadow Titan","Crystal Drake","Golden Phoenix","Storm Wolf",
    "Void Serpent","Frost Bear","Lava Golem","Thunder Eagle","Mystic Fox",
    "Iron Gorilla","Plasma Shark","Celestial Lion","Doom Reaper","Emerald Dragon",
}
local selPet=petNames[1]
local petDrop,_=petsTab:AddDropdown("ðŸ¥š  Select Pet", function(v) selPet=v end)
for _,pn in ipairs(petNames) do petDrop:Add(pn) end
petsTab:AddTextBox("Or type pet name manually", function(v) selPet=v end,{clear=false})
petsTab:AddSwitch("ðŸ¥š  Auto Buy Pet", function(v)
    getgenv().scpPet=v
    if v then task.spawn(function() while getgenv().scpPet do
        pcall(function()
            local f=RS.cPetShopFolder:FindFirstChild(selPet)
            if f then RS.cPetShopRemote:InvokeServer(f) end
        end); task.wait(1)
    end end) end
end)
petsTab:AddButton("ðŸ¥š  Buy Once", function()
    pcall(function()
        local f=RS.cPetShopFolder:FindFirstChild(selPet)
        if f then RS.cPetShopRemote:InvokeServer(f); notify("SCP","ðŸ¥š Bought: "..selPet,3) end
    end)
end)

petsTab:AddLabel("â”â”â”â”â”â”â”  ðŸŒ€ BUY AURAS  â”â”â”â”â”â”â”")
local auraNames={
    "Blue Aura","Red Aura","Gold Aura","Shadow Aura","Neon Aura",
    "Crystal Aura","Storm Aura","Frost Aura","Flame Aura","Void Aura",
}
local selAura=auraNames[1]
local auraDrop,_=petsTab:AddDropdown("ðŸŒ€  Select Aura", function(v) selAura=v end)
for _,an in ipairs(auraNames) do auraDrop:Add(an) end
petsTab:AddTextBox("Or type aura name manually", function(v) selAura=v end,{clear=false})
petsTab:AddSwitch("ðŸŒ€  Auto Buy Aura", function(v)
    getgenv().scpAura=v
    if v then task.spawn(function() while getgenv().scpAura do
        pcall(function()
            local f=RS.cPetShopFolder:FindFirstChild(selAura)
            if f then RS.cPetShopRemote:InvokeServer(f) end
        end); task.wait(1)
    end end) end
end)
petsTab:AddButton("ðŸŒ€  Buy Aura Once", function()
    pcall(function()
        local f=RS.cPetShopFolder:FindFirstChild(selAura)
        if f then RS.cPetShopRemote:InvokeServer(f); notify("SCP","ðŸŒ€ Bought: "..selAura,3) end
    end)
end)

petsTab:AddLabel("â”â”â”â”â”â”â”  âš¡ ULTIMATES  â”â”â”â”â”â”â”")
local ultNames={
    "Ultimate 1","Ultimate 2","Ultimate 3","Ultimate 4","Ultimate 5",
}
local selUlt=ultNames[1]
local ultDrop,_=petsTab:AddDropdown("âš¡  Select Ultimate", function(v) selUlt=v end)
for _,un in ipairs(ultNames) do ultDrop:Add(un) end
petsTab:AddTextBox("Or type ultimate name manually", function(v) selUlt=v end,{clear=false})
petsTab:AddSwitch("âš¡  Auto Buy Ultimate", function(v)
    getgenv().scpUlt=v
    if v then task.spawn(function() while getgenv().scpUlt do
        pcall(function()
            local f=RS.ultimatesFolder and RS.ultimatesFolder:FindFirstChild(selUlt)
            if f then RS.rEvents.buyUltimateRemote:InvokeServer(f) end
        end); task.wait(1)
    end end) end
end)
petsTab:AddSwitch("ðŸŽ¡  Auto Spin Fortune Wheel", function(v)
    getgenv().scpWheel=v
    if v then task.spawn(function() while getgenv().scpWheel do
        pcall(function()
            RS.rEvents.openFortuneWheelRemote:InvokeServer("openFortuneWheel",RS.fortuneWheelChances["Fortune Wheel"])
        end); task.wait(1)
    end end) end
end)

-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
--  TAB: STATS
-- â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•â•
local statsTab,_ = win:AddTab("ðŸ“Š  Stats")

statsTab:AddLabel("â”â”â”â”â”â”â”  â±ï¸ SESSION TIMER  â”â”â”â”â”â”â”")
local ss=os.time()
local timeLbl=statsTab:AddLabel("â±ï¸  0d 0h 0m 0s")
task.spawn(function() while task.wait(1) do
    local e=os.time()-ss
    timeLbl.Text="â±ï¸  "..math.floor(e/86400).."d "..math.floor(e%86400/3600).."h "..math.floor(e%3600/60).."m "..(e%60).."s"
end end)

statsTab:AddLabel("â”â”â”â”â”â”â”  ðŸ“ˆ STATS GAINED  â”â”â”â”â”â”â”")
local ls=LP:WaitForChild("leaderstats",10)
local strS=ls and ls:FindFirstChild("Strength")
local rebS=ls and ls:FindFirstChild("Rebirths")
local killS=ls and ls:FindFirstChild("Kills")
local durS=LP:FindFirstChild("Durability")
local evilS=LP:FindFirstChild("evilKarma")
local goodS=LP:FindFirstChild("goodKarma")
local iStr=strS and strS.Value or 0; local iDur=durS and durS.Value or 0
local iReb=rebS and rebS.Value or 0; local iKill=killS and killS.Value or 0
local SL=statsTab:AddLabel("ðŸ’ª  Strength:    â€”")
local DL=statsTab:AddLabel("ðŸ›¡ï¸  Durability:  â€”")
local RL=statsTab:AddLabel("ðŸ”„  Rebirths:    â€”")
local KL=statsTab:AddLabel("âš”ï¸  Kills:       â€”")
local EL=statsTab:AddLabel("ðŸ˜ˆ  Evil Karma:  â€”")
local GL=statsTab:AddLabel("ðŸ˜‡  Good Karma:  â€”")
task.spawn(function() while task.wait(0.5) do pcall(function()
    if strS then SL.Text="ðŸ’ª  Strength:    "..fmt(strS.Value).."  (+"..fmt(strS.Value-iStr)..")" end
    if durS then DL.Text="ðŸ›¡ï¸  Durability:  "..fmt(durS.Value).."  (+"..fmt(durS.Value-iDur)..")" end
    if rebS then RL.Text="ðŸ”„  Rebirths:    "..fmt(rebS.Value).."  (+"..fmt(rebS.Value-iReb)..")" end
    if killS then KL.Text="âš”ï¸  Kills:       "..fmt(killS.Value).."  (+"..fmt(killS.Value-iKill)..")" end
    if evilS then EL.Text="ðŸ˜ˆ  Evil Karma:  "..fmt(evilS.Value) end
    if goodS then GL.Text="ðŸ˜‡  Good Karma:  "..fmt(goodS.Value) end
end) end end)

statsTab:AddLabel("â”â”â”â”â”â”â”  ðŸ“‰ GAIN RATE / HR  â”â”â”â”â”â”â”")
local RSL=statsTab:AddLabel("ðŸ’ª  Str/hr:  warming up...")
local RDL=statsTab:AddLabel("ðŸ›¡ï¸  Dur/hr:  warming up...")
local sH,dH={},{}
task.spawn(function() while task.wait(0.5) do pcall(function()
    local n=tick()
    if strS then table.insert(sH,{t=n,v=strS.Value}) end
    if durS then table.insert(dH,{t=n,v=durS.Value}) end
    while #sH>0 and n-sH[1].t>30 do table.remove(sH,1) end
    while #dH>0 and n-dH[1].t>30 do table.remove(dH,1) end
    if #sH>=2 and sH[#sH].t~=sH[1].t then
        RSL.Text="ðŸ’ª  Str/hr:  "..fmt(math.floor((sH[#sH].v-sH[1].v)/(sH[#sH].t-sH[1].t)*3600))
    end
    if #dH>=2 and dH[#dH].t~=dH[1].t then
        RDL.Text="ðŸ›¡ï¸  Dur/hr:  "..fmt(math.floor((dH[#dH].v-dH[1].v)/(dH[#dH].t-dH[1].t)*3600))
    end
end) end end)

statsTab:AddLabel("â”â”â”â”â”â”â”  ðŸ” PLAYER SPY  â”â”â”â”â”â”â”")
local spyT=LP
local spyName=statsTab:AddLabel("ðŸ‘¤  Spying:  "..LP.Name)
local spyStat=statsTab:AddLabel("ðŸ“Š  Stats loading...")
statsTab:AddTextBox("Enter player name to spy", function(v)
    local p=findPlayer(v); if p then spyT=p; spyName.Text="ðŸ‘¤  Spying:  "..p.Name end
end,{clear=false})
task.spawn(function() while task.wait(1) do pcall(function()
    if not spyT then return end
    local tls=spyT:FindFirstChild("leaderstats")
    local s1=tls and tls:FindFirstChild("Strength") and fmt(tls.Strength.Value) or "?"
    local s2=spyT:FindFirstChild("Durability") and fmt(spyT.Durability.Value) or "?"
    local s3=tls and tls:FindFirstChild("Rebirths") and fmt(tls.Rebirths.Value) or "?"
    local s4=tls and tls:FindFirstChild("Kills") and fmt(tls.Kills.Value) or "?"
    spyStat.Text="ðŸ’ª"..s1.."  ðŸ›¡ï¸"..s2.."  ðŸ”„"..s3.."  âš”ï¸"..s4
end) end end)

-- Show info tab first
infoTab:Show()
notify("SCP HUB","âš¡ V5 Loaded! RShift to toggle  ðŸ‘‘  Made by TEJAZ",5)
