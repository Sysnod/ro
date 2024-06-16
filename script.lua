local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Ant V2",
   LoadingTitle = "Sofia Hub",
   LoadingSubtitle = "by Sofia",
   ConfigurationSaving = {
      Enabled = false,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Sofia Hub"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },
   KeySystem = false, -- Set this to true to use our key system
   KeySettings = {
      Title = "Untitled",
      Subtitle = "Key System",
      Note = "No method of obtaining the key is provided",
      FileName = "Key", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"Hello"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

local MainTab = Window:CreateTab("Home", nil) -- Title, Image
local MainSection = MainTab:CreateSection("Main")

Rayfield:Notify({
   Title = "Executed",
   Content = "Good",
   Duration = 5,
   Image = nil,
   Actions = { -- Notification Buttons
      Ignore = {
         Name = "Okay!",
         Callback = function()
         print("The user tapped Okay!")
      end
   },
},
})


local Button = MainTab:CreateButton({
   Name = "Infinie Jump",
   Callback = function()
       --Toggles the infinite jump between on or off on every script run
_G.infinjump = not _G.infinjump

if _G.infinJumpStarted == nil then
	--Ensures this only runs once to save resources
	_G.infinJumpStarted = true
	
	--Notifies readiness
	game.StarterGui:SetCore("SendNotification", {Title="Youtube Hub"; Text="Infinite Jump Activated!"; Duration=5;})

	--The actual infinite jump
	local plr = game:GetService('Players').LocalPlayer
	local m = plr:GetMouse()
	m.KeyDown:connect(function(k)
		if _G.infinjump then
			if k:byte() == 32 then
			humanoid = game:GetService'Players'.LocalPlayer.Character:FindFirstChildOfClass('Humanoid')
			humanoid:ChangeState('Jumping')
			wait()
			humanoid:ChangeState('Seated')
			end
		end
	end)
end
   end,
})

local Button = MainTab:CreateButton({
   Name = "Teleport",
   Callback = function()
-- This is a standalone teleport script for Roblox executor/injector.

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local TargetPlayerName = "Tiarka1101" -- Replace with the name of the player you want to teleport to

local function teleportToLocalPlayer()
    local TargetPlayer = Players:FindFirstChild(TargetPlayerName)
    if TargetPlayer and TargetPlayer.Character and TargetPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetRootPart = TargetPlayer.Character.HumanoidRootPart
        while wait() do
            LocalPlayer.Character:MoveTo(targetRootPart.Position)
        end
    end
end

-- Teleport LocalPlayer to the target player's position continuously
teleportToLocalPlayer()
   end,
})

local Slider = MainTab:CreateSlider({
   Name = "Walk Speed",
   Range = {0, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 16,
   Flag = "Slider1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = (Value)
   end,
})

local Button = MainTab:CreateButton({
   Name = "ESP",
   Callback = function()
       --Toggles the infinite jump between on or off on every script run
getgenv().tspyen = true
local funcs = {}
funcs.normalizeblue = function(nnnn)
return "%"..nnnn
end
funcs.normalizemagic = function(magic)
return string.gsub(magic,"[%(+%)+%^+%*+%$+%.+%[+%]+%++%-+%?+%%+]",funcs.normalizeblue)
end
funcs.plrs = game:GetService("Players")
local newf = Instance.new("Folder")
newf.Parent = game:GetService("CoreGui")
newf.Name = "smx"
local function addn(plr)
local nm = plr.Character and plr.Character:GetChildren()
local v = nm and plr.Character:WaitForChild("Head",10)
if v ~= nil then
local BillboardGui = Instance.new("BillboardGui")
local TextLabel = Instance.new("TextLabel")
BillboardGui.Parent = newf
BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
BillboardGui.Active = true
BillboardGui.Adornee = v
BillboardGui.AlwaysOnTop = true
BillboardGui.MaxDistance = 10000
BillboardGui.Size = UDim2.new(4, 0, 1, 0)
BillboardGui.SizeOffset = Vector2.new(0, 4.5)
local con
con = plr.CharacterRemoving:Connect(function()
BillboardGui:Destroy()
con:Disconnect()
end)
TextLabel.Parent = BillboardGui
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Size = UDim2.new(1, 0, 1, 0)
TextLabel.Font = Enum.Font.SourceSansSemibold
TextLabel.Text = "\n"
local tm = ""
if plr.Neutral ~= true then
tm = " ("..plr.Team.Name..")"
TextLabel.TextColor3 = plr.TeamColor.Color
else
tm = " (Neutral)"
TextLabel.TextColor3 = Color3.new(1,1,1)
end
TextLabel.TextSize = 15
TextLabel.TextYAlignment = Enum.TextYAlignment.Top
local p = plr.Backpack and plr.Backpack:GetChildren()
local nu = 1
local hpt = ""
local hm = plr.Character:FindFirstChildOfClass("Humanoid") or plr.Character:WaitForChild("Humanoid",10)
if hm then
hpt = plr.DisplayName..": "..hm.Health.."/"..hm.MaxHealth..tm.."\n"
TextLabel.Text = hpt..TextLabel.Text
hm.HealthChanged:Connect(function()
local ohttp = funcs.normalizemagic(hpt)
hpt = plr.DisplayName..": "..hm.Health.."/"..hm.MaxHealth..tm.."\n"
TextLabel.Text = hpt..string.gsub(TextLabel.Text,ohttp,"")
end)
end
plr:GetPropertyChangedSignal("Team"):Connect(function()
if plr.Neutral ~= true and plr.Team then
tm = " ("..plr.Team.Name..")"
TextLabel.TextColor3 = plr.TeamColor.Color
else
tm = " (Neutral)"
TextLabel.TextColor3 = Color3.new(1,1,1)
end
local ohttp = funcs.normalizemagic(hpt)
hpt = (hm and plr.DisplayName..": "..hm.Health.."/"..hm.MaxHealth..tm.."\n") or plr.DisplayName..tm.."\n"
TextLabel.Text = hpt..string.gsub(TextLabel.Text,ohttp,"")
end)
for m,x in pairs(nm) do
local tn = string.gsub(x.Name,"\n"," ")
if string.find(TextLabel.Text,tn,1,true) then

elseif x ~= nil and x:IsA("Tool") and nu%4 == 0  then
TextLabel.Text = TextLabel.Text.."\n"..tn
nu=1
elseif x ~= nil and x:IsA("Tool") then
TextLabel.Text = TextLabel.Text..tn..","
nu=nu+1
end
end
plr.Character.ChildAdded:Connect(function(n)
local tn = string.gsub(n.Name,"\n"," ")
if string.find(TextLabel.Text,tn,1,true) then

elseif nu%4 == 0 and n:IsA("Tool") then
TextLabel.Text = TextLabel.Text.."\n"..tn.." (EQUIPPED),"
nu=1
BillboardGui.SizeOffset = BillboardGui.SizeOffset+Vector2.new(0,.1)
elseif n:IsA("Tool") then
TextLabel.Text = TextLabel.Text..tn.." (EQUIPPED),"
nu=nu+1
BillboardGui.SizeOffset = BillboardGui.SizeOffset+Vector2.new(0,.1)
end
end)
plr.Character.ChildRemoved:Connect(function(n)
local tn = funcs.normalizemagic(string.gsub(n.Name,"\n"," "))
if n:IsA("Tool") then
local repl = (string.find(TextLabel.Text,"\n"..tn.." %(EQUIPPED%),") and string.gsub(TextLabel.Text,"\n"..tn.." %(EQUIPPED%),","")) or (string.find(TextLabel.Text,tn.." %(EQUIPPED%),") and string.gsub(TextLabel.Text,tn.." %(EQUIPPED%),","")) or TextLabel.Text
TextLabel.Text = repl
nu=nu-1
BillboardGui.SizeOffset = BillboardGui.SizeOffset-Vector2.new(0,.1)
end
end)
if p then
for m,x in pairs(p) do
local tn = string.gsub(x.Name,"\n"," ")
if string.find(TextLabel.Text,tn,1,true) then

elseif x ~= nil and x:IsA("Tool") and nu%4 == 0 then
TextLabel.Text = TextLabel.Text.."\n"..tn..","
nu = 1
BillboardGui.SizeOffset = BillboardGui.SizeOffset+Vector2.new(0,.1)
elseif x ~= nil and x:IsA("Tool") then
TextLabel.Text = TextLabel.Text..tn..","
nu=nu+1
BillboardGui.SizeOffset = BillboardGui.SizeOffset+Vector2.new(0,.1)
end
end
plr.Backpack.ChildAdded:Connect(function(n)
local tn = string.gsub(n.Name,"\n"," ")
if string.find(TextLabel.Text,tn,1,true) then

elseif nu%4 == 0 and n:IsA("Tool") then
TextLabel.Text = TextLabel.Text.."\n"..tn..","
nu = 1
BillboardGui.SizeOffset = BillboardGui.SizeOffset+Vector2.new(0,.1)
elseif n:IsA("Tool") then
TextLabel.Text = TextLabel.Text..tn..","
nu=nu+1
BillboardGui.SizeOffset = BillboardGui.SizeOffset+Vector2.new(0,.1)
end
end)
plr.Backpack.ChildRemoved:Connect(function(n)
local tn = funcs.normalizemagic(string.gsub(n.Name,"\n"," "))
if n:IsA("Tool") then
local repl = (string.find(TextLabel.Text,"\n"..tn..",") and string.gsub(TextLabel.Text,"\n"..tn..",","")) or (string.find(TextLabel.Text,tn..",") and string.gsub(TextLabel.Text,tn..",","")) or TextLabel.Text
TextLabel.Text = repl
nu=nu-1
BillboardGui.SizeOffset = BillboardGui.SizeOffset-Vector2.new(0,.1)
end
end)
end
end
end

local function plrj(ml)
if getgenv().tspyen then
addn(ml)
ml.CharacterAdded:Connect(function(L)
local hd = L:WaitForChild("Head",200)
if hd then
addn(ml)
end
end)
end
end
for i,plr in pairs(funcs.plrs:GetPlayers()) do
plrj(plr)
end
funcs.plrs.PlayerAdded:Connect(plrj)

   end,
})
