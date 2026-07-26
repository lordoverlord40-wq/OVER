--[[

Ts Code Was Deobfuscated Using Slayerson âœžâœž Private Deobf
processed time. 622.94 Ms

Obfuscator: v1.0.0 https://wearedevs.net/obfuscator

-- ]]

repeat task.wait() until game:IsLoaded()

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local CORRECT_KEY = "SLONTOP"
local GET_KEY_LINK = "https://discord.gg/jNCaMqgBdt"

getgenv().KEY_PASSED = false

local Gui = Instance.new("ScreenGui", game.CoreGui)
Gui.Name = "SL_RGB_KEY"
Gui.ResetOnSpawn = false

local Main = Instance.new("Frame", Gui)
Main.Size = UDim2.new(0, 380, 0, 240)
Main.Position = UDim2.new(0.5, -190, 0.5, -120)
Main.BackgroundColor3 = Color3.fromRGB(15,15,15)
Main.BorderSizePixel = 0
Main.Active = true
Main.Draggable = true

Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 14)

local Glow = Instance.new("UIStroke", Main)
Glow.Thickness = 2

local hue = 0
RunService.RenderStepped:Connect(function()
    hue = (hue + 0.002) % 1
    Glow.Color = Color3.fromHSV(hue, 1, 1)
end)

local Title = Instance.new("TextLabel", Main)
Title.Size = UDim2.new(1,0,0,50)
Title.BackgroundTransparency = 1
Title.Text = "ðŸ”’ SL HUB KEY SYSTEM"
Title.Font = Enum.Font.GothamBold
Title.TextSize = 20
Title.TextColor3 = Color3.fromRGB(255,255,255)

local Box = Instance.new("TextBox", Main)
Box.Size = UDim2.new(0.85,0,0,42)
Box.Position = UDim2.new(0.075,0,0.35,0)
Box.PlaceholderText = "ENTER KEY"
Box.Text = ""
Box.Font = Enum.Font.Gotham
Box.TextSize = 14
Box.BackgroundColor3 = Color3.fromRGB(30,30,30)
Box.TextColor3 = Color3.fromRGB(255,255,255)
Box.ClearTextOnFocus = false
Instance.new("UICorner", Box).CornerRadius = UDim.new(0,10)

local Verify = Instance.new("TextButton", Main)
Verify.Size = UDim2.new(0.4,0,0,38)
Verify.Position = UDim2.new(0.075,0,0.65,0)
Verify.Text = "VERIFY"
Verify.Font = Enum.Font.GothamBold
Verify.TextSize = 14
Verify.TextColor3 = Color3.fromRGB(255,255,255)
Verify.BackgroundColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner", Verify).CornerRadius = UDim.new(0,10)

local GetKey = Instance.new("TextButton", Main)
GetKey.Size = UDim2.new(0.4,0,0,38)
GetKey.Position = UDim2.new(0.525,0,0.65,0)
GetKey.Text = "GET KEY"
GetKey.Font = Enum.Font.GothamBold
GetKey.TextSize = 14
GetKey.TextColor3 = Color3.fromRGB(255,255,255)
GetKey.BackgroundColor3 = Color3.fromRGB(40,40,40)
Instance.new("UICorner", GetKey).CornerRadius = UDim.new(0,10)

for _,btn in pairs({Verify, GetKey}) do
    btn.MouseEnter:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(70,70,70)
        }):Play()
    end)
    btn.MouseLeave:Connect(function()
        TweenService:Create(btn, TweenInfo.new(0.2), {
            BackgroundColor3 = Color3.fromRGB(40,40,40)
        }):Play()
    end)
end

local function Shake()
    for i = 1,8 do
        Main.Position += UDim2.new(0, (i%2==0 and -6 or 6),0,0)
        task.wait(0.02)
    end
end

Verify.MouseButton1Click:Connect(function()
    if Box.Text == CORRECT_KEY then
        getgenv().KEY_PASSED = true

        TweenService:Create(Main, TweenInfo.new(0.5), {
            BackgroundTransparency = 1
        }):Play()

        for _,v in pairs(Main:GetChildren()) do
            if v:IsA("TextLabel") or v:IsA("TextButton") or v:IsA("TextBox") then
                TweenService:Create(v, TweenInfo.new(0.5), {
                    TextTransparency = 1,
                    BackgroundTransparency = 1
                }):Play()
            end
        end

        task.wait(0.6)
        Gui:Destroy()
    else
        Box.Text = ""
        Box.PlaceholderText = "WRONG KEY!"
        Shake()
    end
end)

GetKey.MouseButton1Click:Connect(function()
    if setclipboard then
        setclipboard(GET_KEY_LINK)
    end
end)

repeat task.wait() until getgenv().KEY_PASSED == true

--// Anti AFK Script
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local LocalPlayer = Players.LocalPlayer

LocalPlayer.Idled:Connect(function()
    -- Move mouse slightly and click to prevent AFK
    VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
    task.wait(1)
    VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
end)

print("Anti-AFK is active")
local WindUI = (loadstring(game:HttpGet("https://raw.githubusercontent.com/SlGHOST0/SL-HUB-PUBLIC/refs/heads/main/GUI.txt")))();
local Window = WindUI:CreateWindow({
	Title = "SL HUB",
	Author = "Legends Of Speed",
	Folder = "SL HUB",
	Icon = "rbxassetid://119025343914379",
	Background = "rbxassetid://111304528713206",
	Size = UDim2.fromOffset(450, 300),
	MinSize = Vector2.new(520, 330),
	Transparent = false,
	Theme = "Dark",
	SideBarWidth = 180,
	HideSearchBar = true,
	ScrollBarEnabled = false
});
Window:EditOpenButton({
	Icon = "rbxassetid:/88892278869374",
	CornerRadius = UDim.new(0, 10),
	Position = UDim2.new(0, 75, 0, 100),
	OnlyMobile = false,
	Enabled = true,
	Draggable = true
});
local Tabs = {
	InfoTab = Window:Tab({
		Title = "Info",
		Icon = "info",
		ShowTabTitle = false
	}),
	MainTab = Window:Tab({
		Title = "Main",
		Icon = "rbxassetid://10723407389",
		ShowTabTitle = false
	}),
	ShopTab = Window:Tab({
		Title = "Shop",
		Icon = "shopping-bag",
		ShowTabTitle = false
	}),
	PlayerTab = Window:Tab({
		Title = "Player",
		Icon = "user",
		ShowTabTitle = false
	}),
	PetTab = Window:Tab({
		Title = "Pet",
		Icon = "egg",
		ShowTabTitle = false
	}),
	TeleportTab = Window:Tab({
		Title = "Teleport",
		Icon = "map-pin",
		ShowTabTitle = false
	}),
	MiscTab = Window:Tab({
		Title = "Misc",
		Icon = "settings",
		ShowTabTitle = false
	}),
	ServerTab = Window:Tab({
		Title = "Server",
		Icon = "server",
		ShowTabTitle = false
	})
};
Window:SelectTab(1);
local ConfigManager = Window.ConfigManager;
local Config = ConfigManager:CreateConfig("Legends Of Speed Config");
Window:CreateTopbarButton("Save Config", "save", function()
	Config:Save();
	WindUI:Notify({
		Title = "Config Saved!",
		Content = "Config automatically loads when the script is run",
		Icon = "rbxassetid://7870448797430",
		Duration = 5
	});
end, 990);
Window:CreateTopbarButton("Reset Config", "trash-2", function()
	if isfile("WindUI/Relz Hub/config/Grow a Garden Config.json") then
		delfile("WindUI/Relz Hub/config/Grow a Garden Config.json");
		WindUI:Notify({
			Title = "Config Deleted!",
			Content = "Config reset to default",
			Icon = "rbxassetid://9088800761764",
			Duration = 5
		});
	end;
end, 989);
local InviteCode = "tZWbQgRHv";
DiscordLinkButton = Tabs.InfoTab:Button({
	Title = "Discord Server",
	Callback = function()
		setclipboard("https://discord.gg/".. InviteCode);
	end
});
Tabs.InfoTab:Divider();
GameTimeParagraph = Tabs.InfoTab:Paragraph({
	Title = "Game Time",
	Desc = "0",
	Image = "timer",
	ImageSize = 20
});
spawn(function()
	while task.wait() do
		pcall(function()
			local GameTime = math.floor(workspace.DistributedGameTime + 0.5);
			local Hour = math.floor(GameTime / 60 ^ 2) % 24;
			local Minute = math.floor(GameTime / 60 ^ 1) % 60;
			local Second = math.floor(GameTime / 60 ^ 0) % 60;
			GameTimeParagraph:SetDesc(Hour .. " Hours " .. Minute .. " Minute " .. Second .. " Second");
		end);
	end;
end);
FpsParagraph = Tabs.InfoTab:Paragraph({
	Title = "Fps",
	Desc = "0",
	Image = "monitor",
	ImageSize = 20
});
spawn(function()
	while task.wait() do
		pcall(function()
			FpsParagraph:SetDesc(workspace:GetRealPhysicsFPS());
		end);
	end;
end);
PingParagraph = Tabs.InfoTab:Paragraph({
	Title = "Ping",
	Desc = "0",
	Image = "signal",
	ImageSize = 20
});
spawn(function()
	while task.wait() do
		pcall(function()
			PingParagraph:SetDesc((game:GetService("Stats")).Network.ServerStatsItem["Data Ping"]:GetValueString());
		end);
	end;
end);
function CheckWorld()
	if game.PlaceId == 3101667897 then
		return "City";
	elseif game.PlaceId == 3232996272 then
		return "Space";
	elseif game.PlaceId == 3276265788 then
		return "Desert";
	end;
end;
RemoteEvent = (game:GetService("ReplicatedStorage")).rEvents;
ReplicatedStorage = game:GetService("ReplicatedStorage");
TeleportService = game:GetService("TeleportService");
Players = game:GetService("Players");
LocalPlayer = Players.LocalPlayer;
Character = LocalPlayer.Character;
Humanoid = Character.Humanoid;
HumanoidRootPart = Character.HumanoidRootPart;
local listOrbs = {};
for i, v in pairs((game:GetService("ReplicatedStorage")).Orbs:GetChildren()) do
	table.insert(listOrbs, v.Name);
end;
function getPlaces()
	local result = {};
	for i, v in pairs(workspace.orbFolder:GetChildren()) do
		table.insert(result, v);
	end;
	return result;
end;
local listPlaces = {};
task.spawn(function()
	for i, v in pairs(getPlaces()) do
		if not string.find(v.Name, "Race") then
			table.insert(listPlaces, v.Name);
		end;
	end;
end);
local crystalList = {};
task.spawn(function()
	for i, v in pairs(game.workspace.mapCrystalsFolder:GetChildren()) do
		table.insert(crystalList, v.Name);
	end;
end);
function getCurrentMap()
	return LocalPlayer.currentMap.Value;
end;
function CollectOrb(orb)
	RemoteEvent.orbEvent:FireServer("collectOrb", orb, getCurrentMap());
end;
function OpenCrystal(name)
	RemoteEvent.openCrystalRemote:InvokeServer("openCrystal", name);
end;
function Teleport(id)
	TeleportService:Teleport(id, LocalPlayer);
end;
function ClaimGift(value)
	RemoteEvent.freeGiftClaimRemote:InvokeServer("claimGift", value);
end;
function getHoops()
	local result = {};
	for i, v in pairs(workspace.Hoops:GetChildren()) do
		table.insert(result, v);
	end;
	return result;
end;
function getPetShopFolder()
	local result = {};
	for i, v in pairs((ReplicatedStorage:WaitForChild("cPetShopFolder")):GetChildren()) do
		table.insert(result, v);
	end;
	return result;
end;
function getPetShopByName(pet)
	for i, v in pairs(getPetShopFolder()) do
		if v.Name == pet then
			return v;
		end;
	end;
	return nil;
end;
local petShopList = {};
task.spawn(function()
	for i, v in pairs(getPetShopFolder()) do
		table.insert(petShopList, v.Name);
	end;
end);
function BuyPet(pet)
	(ReplicatedStorage:WaitForChild("cPetShopRemote")):InvokeServer(pet);
end;
function EvolveAllPets()
	for i, v in pairs(LocalPlayer.petsFolder:GetChildren()) do
		for _, pet in pairs(v:GetChildren()) do
			if not pet:FindFirstChild("evolved") then
				RemoteEvent.petEvolveEvent:FireServer("evolvePet", pet.Name);
			end;
		end;
	end;
end;
function getAreaCircle(name)
	for i, v in pairs(workspace.areaCircles:GetChildren()) do
		if v.areaName.Value == name then
			return v;
		end;
	end;
	return nil;
end;
function TravelToArea(area)
	(RemoteEvent:WaitForChild("areaTravelRemote")):InvokeServer("travelToArea", getAreaCircle(area));
end;
local playerList = {};
task.spawn(function()
	for i, v in pairs(Players:GetChildren()) do
		table.insert(playerList, v.Name);
	end;
end);
FarmSection = Tabs.MainTab:Section({
	Title = "Farm",
	TextXAlignment = "Left"
});
SelectedOrbDropdown = FarmSection:Dropdown({
	Title = "Select Orb",
	Values = listOrbs,
	Value = {},
	Multi = true,
	AllowNone = true,
	Callback = function(option)
		_G.SelectedOrbs = option;
	end
});
FarmSpeedSlider = FarmSection:Slider({
	Title = "Farm Speed",
	Step = 1,
	Value = {
		Min = 1,
		Max = 100,
		Default = 50
	},
	Callback = function(value)
		_G.FarmMultiplier = value;
	end
});
Config:Register("FarmSpeedSlider", FarmSpeedSlider);
InfoMultiplierParagraph = FarmSection:Paragraph({
	Title = "Warning",
	Desc = "It is not recommended to use numbers that are too large, it will cause you to experience lag on the server.",
})
AutoFarmToggle = FarmSection:Toggle({
	Title = "Auto Farm",
	Desc = "Auto collect selected orbs with farm multiplier",
	Value = false,
	Callback = function(state)
		_G.AutoFarm = state;
	end
});
Config:Register("AutoFarmToggle", AutoFarmToggle);
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoFarm then
				for i, v in pairs(_G.SelectedOrbs) do
					for i = 1, _G.FarmMultiplier or 20 do
						CollectOrb(v);
					end
				end;
			end;
		end);
	end;
end);
AutoHoopsToggle = FarmSection:Toggle({
	Title = "Auto Hoops",
	Desc = "Auto touch all hoops",
	Value = false,
	Callback = function(state)
		_G.AutoHoops = state;
	end
});
Config:Register("AutoHoopsToggle", AutoHoopsToggle);
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoHoops then
				for i, v in pairs(getHoops()) do
					firetouchinterest(HumanoidRootPart, v, 0);
					firetouchinterest(HumanoidRootPart, v, 1);
				end;
			end;
		end);
	end;
end);
RebirthSection = Tabs.MainTab:Section({
	Title = "Rebirth",
	TextXAlignment = "Left"
});
AutoRebirthToggle = RebirthSection:Toggle({
	Title = "Auto Rebirth",
	Desc = "Auto rebirth",
	Value = false,
	Callback = function(state)
		_G.AutoRebirth = state;
	end
});
Config:Register("AutoRebirthToggle", AutoRebirthToggle);
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoRebirth then
				RemoteEvent.rebirthEvent:FireServer("rebirthRequest");
			end;
		end);
	end;
end);
RaceSection = Tabs.MainTab:Section({
	Title = "Race",
	TextXAlignment = "Left"
});
AutoRaceToggle = RaceSection:Toggle({
	Title = "Auto Race",
	Desc = "Auto join race and win race",
	Value = false,
	Callback = function(state)
		_G.AutoRace = state;
	end
});
Config:Register("AutoRaceToggle", AutoRaceToggle);
ReplicatedStorage.raceInProgress.Changed:Connect(function(state)
	if not _G.AutoRace then
		return;
	end;
	if state then
		RemoteEvent.raceEvent:FireServer("joinRace");
		LocalPlayer.PlayerGui.gameGui.raceJoinLabel.Visible = false;
	end;
end);
ReplicatedStorage.raceStarted.Changed:Connect(function(state)
	if not _G.AutoRace then
		return;
	end;
	if state then
		for _, map in pairs(workspace.raceMaps:GetChildren()) do
			if map:FindFirstChild("finishPart") then
				local finishPart = map.finishPart;
				local oldFinishPosition = finishPart.CFrame;
				finishPart.CFrame = HumanoidRootPart.CFrame;
				wait();
				finishPart.CFrame = oldFinishPosition;
			end;
		end;
	end;
end);
GiftsSection = Tabs.MainTab:Section({
	Title = "Gifts",
	TextXAlignment = "Left"
});
AutoClaimGiftsToggle = GiftsSection:Toggle({
	Title = "Auto Claim Gifts",
	Value = false,
	Callback = function(state)
		_G.AutoClaimGifts = state;
	end
});
Config:Register("AutoClaimGiftsToggle", AutoClaimGiftsToggle);
function getHighestGiftNumber()
	local result = 0;
	for i, v in pairs(LocalPlayer.freeGiftsClaimedFolder:GetChildren()) do
		if tonumber(v.Name) > result then
			result = tonumber(v.Name);
		end;
	end;
	return result;
end;
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoClaimGifts then
				ClaimGift(getHighestGiftNumber() + 1);
			end;
		end);
	end;
end);
SpeedPlayerSection = Tabs.PlayerTab:Section({
	Title = "Speed Player",
	TextXAlignment = "Left"
});
SpeedPlayer = SpeedPlayerSection:Slider({
	Title = "Speed Player",
	Step = 1,
	Value = {
		Min = 16,
		Max = 5000,
		Default = 300
	},
	Callback = function(value)
		_G.SpeedPlayer = value;
	end
});
Config:Register("SpeedPlayer", SpeedPlayer);
SetSpeedPlayerToggle = SpeedPlayerSection:Toggle({
	Title = "Set Speed Player",
	Value = false,
	Callback = function(Value)
		_G.SetSpeedPlayer = Value;
	end
});
Config:Register("SetSpeedPlayer", SetSpeedPlayerToggle);
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.SetSpeedPlayer then
				Humanoid.WalkSpeed = _G.SpeedPlayer or 300;
			end;
		end);
	end;
end);
JumpPowerSection = Tabs.PlayerTab:Section({
	Title = "Jump Power",
	TextXAlignment = "Left"
});
JumpPower = JumpPowerSection:Slider({
	Title = "Jump Power",
	Step = 1,
	Value = {
		Min = 50,
		Max = 1000,
		Default = 100
	},
	Callback = function(value)
		_G.JumpPower = value;
	end
});
Config:Register("JumpPower", JumpPower);
SetJumpPowerToggle = JumpPowerSection:Toggle({
	Title = "Set Jump Power",
	Value = false,
	Callback = function(Value)
		_G.SetJumpPower = Value;
	end
});
Config:Register("SetJumpPower", SetJumpPowerToggle);
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.SetJumpPower then
				Humanoid.JumpPower = _G.JumpPower or 100;
			end;
		end);
	end;
end);
JumpPowerSection:Divider();
InfiniteJumpToggle = JumpPowerSection:Toggle({
	Title = "Infinite Jump",
	Value = false,
	Callback = function(Value)
		_G.InfiniteJump = Value;
	end
});
Config:Register("InfiniteJump", InfiniteJumpToggle);
(game:GetService("UserInputService")).JumpRequest:Connect(function()
	if _G.InfiniteJump and Humanoid then
		Humanoid:ChangeState(Enum.HumanoidStateType.Jumping);
	end;
end);
TeleportSection = Tabs.TeleportTab:Section({
	Title = "Teleport",
	TextXAlignment = "Left"
});
SelectedPlaceDropdown = TeleportSection:Dropdown({
	Title = "Select Place",
	Values = listPlaces,
	Callback = function(Place)
		_G.SelectedPlace = Place;
	end
});
TeleportToPlace = TeleportSection:Button({
	Title = "Teleport",
	Callback = function()
		TravelToArea(_G.SelectedPlace);
	end
});
WorldTeleportSection = Tabs.TeleportTab:Section({
	Title = "World Teleport",
	TextXAlignment = "Left"
});
TeleportToCityButton = WorldTeleportSection:Button({
	Title = "Teleport To City",
	Callback = function()
		Teleport(3101667897);
	end
});
TeleportToSpaceButton = WorldTeleportSection:Button({
	Title = "Teleport To Space",
	Callback = function()
		Teleport(3232996272);
	end
});
TeleportToDesertButton = WorldTeleportSection:Button({
	Title = "Teleport To Desert",
	Callback = function()
		Teleport(3276265788);
	end
});
TeleportPlayerSection = Tabs.TeleportTab:Section({
	Title = "Teleport Player",
	TextXAlignment = "Left"
});
SelectedPlayerDropdown = TeleportPlayerSection:Dropdown({
	Title = "Select Player",
	Values = playerList,
	Value = nil,
	Callback = function(Player)
		_G.SelectedPlayer = Player;
	end
});
TeleportToPlayerButton = TeleportPlayerSection:Button({
	Title = "Teleport To Player",
	Callback = function()
		HumanoidRootPart.CFrame = Players[_G.SelectedPlayer].Character.HumanoidRootPart.CFrame;
	end
});
CrystalSection = Tabs.ShopTab:Section({
	Title = "Crystal",
	TextXAlignment = "Left"
});
SelectedCrystalDropdown = CrystalSection:Dropdown({
	Title = "Select Crystal",
	Values = crystalList,
	Callback = function(Crystal)
		_G.SelectedCrystal = Crystal;
	end
});
Config:Register("SelectedCrystal", SelectedCrystalDropdown);
AutoOpenCrystalToggle = CrystalSection:Toggle({
	Title = "Auto Open Crystal",
	Value = false,
	Callback = function(Value)
		_G.AutoOpenCrystal = Value;
	end
});
Config:Register("AutoOpenCrystal", AutoOpenCrystalToggle);
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoOpenCrystal then
				OpenCrystal(_G.SelectedCrystal);
			end;
		end);
	end;
end);
OpenCrystalButton = CrystalSection:Button({
	Title = "Open Crystal",
	Callback = function()
		OpenCrystal(_G.SelectedCrystal);
	end
});
PetShopSection = Tabs.ShopTab:Section({
	Title = "Shop",
	TextXAlignment = "Left"
});
SelectedItemsShopDropdown = PetShopSection:Dropdown({
	Title = "Select Item",
	Values = petShopList,
	Callback = function(option)
		_G.SelectedItem = option;
	end
});
Config:Register("SelectedItem", SelectedItemsShopDropdown);
AutoBuySelectedItemsToggle = PetShopSection:Toggle({
	Title = "Auto Buy",
	Desc = "Auto buy selected items",
	Value = false,
	Callback = function(Value)
		_G.AutoBuySelectedItems = Value;
	end
});
Config:Register("AutoBuySelectedItemsToggle", AutoBuySelectedItemsToggle);
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoBuySelectedItems then
				BuyPet(getPetShopByName(_G.SelectedItem));
			end;
		end);
	end;
end);
BuyItemsButton = PetShopSection:Button({
	Title = "Buy Items",
	Callback = function()
		BuyPet(getPetShopByName(_G.SelectedItem));
	end
});
EvolvePetSection = Tabs.PetTab:Section({
	Title = "Evolve Pet",
	TextXAlignment = "Left"
});
AutoEvolveAllPetToggle = EvolvePetSection:Toggle({
	Title = "Auto Evolve Pet",
	Value = false,
	Callback = function(Value)
		_G.AutoEvolvePet = Value;
	end
});
Config:Register("AutoEvolvePet", AutoEvolveAllPetToggle);
spawn(function()
	while task.wait() do
		pcall(function()
			if _G.AutoEvolvePet then
				EvolveAllPets();
			end;
		end);
	end;
end);
MiscSection = Tabs.MiscTab:Section({
	Title = "Misc",
	TextXAlignment = "Left"
});
CollectAllChestButton = MiscSection:Button({
	Title = "Collect All Chest",
	Callback = function()
		for i, v in pairs(workspace:GetChildren()) do
			if string.find(v.Name, "Chest") then
				if v:FindFirstChild("circleInner") then
					firetouchinterest(HumanoidRootPart, v.circleInner, 0);
					firetouchinterest(HumanoidRootPart, v.circleInner, 1);
				end;
			end;
		end;
	end
});
ServerSection = Tabs.ServerTab:Section({
	Title = "Server",
	TextXAlignment = "Left"
});
RejoinServerButton = ServerSection:Button({
	Title = "Rejoin Server",
	Callback = function()
		Teleport(game.PlaceId);
	end
});
HopServerButton = ServerSection:Button({
	Title = "Hop Server",
	Callback = function()
		local module = (loadstring(game:HttpGet("https://raw.githubusercontent.com/raw-scriptpastebin/FE/main/Server_Hop_Settings")))();
		module:Teleport(game.PlaceId);
	end
});
ServerSection:Divider();
JobIdSection = ServerSection:Section({
	Title = "Job ID",
	TextXAlignment = "Left"
});
JobIdParagraph = ServerSection:Paragraph({
	Title = "Job ID",
	Desc = game.JobId
});
CopyJobIdButton = ServerSection:Button({
	Title = "Copy Job ID",
	Callback = function()
		setclipboard(game.JobId);
	end
});
JobIdInput = ServerSection:Input({
	Title = "Job ID",
	Placeholder = "Enter Job ID",
	Type = "Input",
	Callback = function(value)
		_G.JobId = value;
	end
});
JoinJobIdServerButton = ServerSection:Button({
	Title = "Join Job ID",
	Callback = function()
		(game:GetService("TeleportService")):TeleportToPlaceInstance(game.PlaceId, _G.JobId);
	end
});
Config:Save();
