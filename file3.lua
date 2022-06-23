if _G.OVRHax_Loaded == true then
	print("OVRHax Already running..")
	return
end

local lp = game:GetService("Players").LocalPlayer

function getchar()
	return lp.Character or lp.CharacterAdded:Wait()
end

function getroot()
	return getchar():GetPrimaryPart()
end

function setVelocity(vec)
	getroot().Velocity = vec
end

function teleport(vec)
	getroot().CFrame = CFrame.new(vec)
end

function returnTeleport(vec, waitTime)
	local oldpos = getroot().Position
	teleport(vec)
	wait(waitTime)
	teleport(oldpos)
end

function tweenTeleport(vec, speed)
	local tweenInfo = TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0)
	local tween = game:GetService("TweenService"):Create(getroot(), tweenInfo, {CFrame = CFrame.new(vec)})
	tween:Play()
end

function returntweenTeleport(vec, speed)
	local tweenInfo = TweenInfo.new(speed, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, true, 0)
	local tween = game:GetService("TweenService"):Create(getroot(), tweenInfo, {CFrame = CFrame.new(vec)})
	tween:Play()
end

function getChildren(e)
	local t = {}
	for i,v in pairs(e:GetChildren()) do
		table.insert(t, v)
	end
	return t
end

function getDescendants(e)
	local t = {}
	for i,v in pairs(e:GetDescendants()) do
		table.insert(t, v)
	end
	return t
end

function aimAt(vec)
	game:GetService("Workspace").CurrentCamera.CFrame = CFrame.new(game:GetService("Workspace").CurrentCamera.CFrame.p, vec)
end

local weld = Instance.new("Weld")

local panel = Instance.new("Part")
weld.Name = "Weld"
weld.Parent = panel
panel.Size = getchar()["Left Arm"].Size
panel.Massless = true
panel.CanCollide = false
panel.Parent = game:GetService("Workspace").CurrentCamera
panel.Name = "Panel"
weld.Part0 = getchar()["Left Arm"]
weld.Part1 = panel
weld.C0 = CFrame.new(0,0,0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
weld.C1 = CFrame.new(-0.05,0,0) * CFrame.Angles(math.rad(0), math.rad(0), math.rad(0))
panel.Transparency = 1

local OpposerVRHax = Instance.new("SurfaceGui")
local Frame = Instance.new("Frame")
local ScrollingFrame = Instance.new("ScrollingFrame")
local UIGridLayout = Instance.new("UIGridLayout")
local TextLabel = Instance.new("TextLabel")
local Template = Instance.new("TextButton")
local UICorner = Instance.new("UICorner")

OpposerVRHax.Name = "OpposerVRHax"
syn.protect_gui(OpposerVRHax)
OpposerVRHax.Parent = panel
OpposerVRHax.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
OpposerVRHax.Adornee = panel
OpposerVRHax.Face = Enum.NormalId.Right

Frame.Parent = OpposerVRHax
Frame.BackgroundColor3 = Color3.fromRGB(59, 59, 59)
Frame.BackgroundTransparency = 0.300
Frame.Position = UDim2.new(0, 0, 0, 0)
Frame.Size = UDim2.new(1, 0, 1, 0)

ScrollingFrame.Parent = Frame
ScrollingFrame.Active = true
ScrollingFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ScrollingFrame.BackgroundTransparency = 1.000
ScrollingFrame.Position = UDim2.new(0, 0, 0.200000003, 0)
ScrollingFrame.Size = UDim2.new(1, 0, 0.8, 0)

UIGridLayout.Parent = ScrollingFrame
UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0.01, 0, 0.01, 0)
UIGridLayout.CellSize = UDim2.new(0.2, 0, 0.2, 0)

TextLabel.Parent = Frame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.100000001, 0, 0.0199999996, 0)
TextLabel.Size = UDim2.new(0.800000012, 0, 0.100000001, 0)
TextLabel.Font = Enum.Font.TitilliumWeb
TextLabel.Text = "OPPOSER VR HAX"
TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

Template.Name = "Template"
Template.Parent = OpposerVRHax
Template.BackgroundColor3 = Color3.fromRGB(103, 103, 103)
Template.BackgroundTransparency = 0.500
Template.Position = UDim2.new(0.00298062619, 0, 0.0771869645, 0)
Template.Size = UDim2.new(0, 200, 0, 50)
Template.Visible = false
Template.Font = Enum.Font.SourceSans
Template.TextColor3 = Color3.fromRGB(0, 0, 0)
Template.TextScaled = true
Template.TextSize = 14.000
Template.TextWrapped = true

UICorner.Parent = Template

bool3 = false
local lp = game:GetService("Players").LocalPlayer
local VREvents = lp.VREvents
local Events = game:GetService("ReplicatedStorage").Events
local Map = game:GetService("Workspace").Map
local Camera = game:GetService("Workspace").CurrentCamera
local Slots = Camera.Slots
blacklist = {}

function createbutton(text, code)
	local clone = OpposerVRHax.Template:Clone()
	clone.Parent = OpposerVRHax.Frame.ScrollingFrame
	clone.Visible = true
	clone.Text = text
	clone.Name = text
	clone.MouseButton1Down:Connect(function()
		pcall(code)
	end)
end

_G.LazerToggle = false
_G.LazerInit = false

function toggleLazer()
	_G.LazerToggle = not _G.LazerToggle
	if _G.LazerInit ~= true then
		_G.LazerInit = true
		local char = game:GetService("Players").LocalPlayer.Character

		local raypart = Instance.new("Part")
		raypart.Material = Enum.Material.Neon
		raypart.Position = Vector3.new(0,25005050,0)
		raypart.Name = "HandLazer"
		raypart.Color = Color3.new(1,0,0)
		raypart.Anchored = true

		laserClone = raypart:Clone()
		laserClone.Size = Vector3.new(0.1, 0.1, 500)
		laserClone.Parent = game:GetService("Workspace")
		laserClone.CanCollide = false
		laserClone.Massless = true
		laserClone.Anchored = false

		local lp = game.Players.LocalPlayer
		local char = lp.Character
		local RA = char:FindFirstChild("Right Arm") or char:FindFirstChild("RightHand")
		local laser = laserClone

		weld = Instance.new("Weld")
		weld.Parent = laser
		weld.Part0 = RA
		weld.Part1 = laser
		weld.C0 = CFrame.new(0, -250.5, -0.25) * CFrame.Angles(math.rad(90), math.rad(0), math.rad(0))
		laser.Weld.Part0 = RA
	end
	if _G.LazerToggle == true then
		laserClone.Transparency = 0
	else
		laserClone.Transparency = 1
	end
end

_G.Flight = false

function toggleFlight()
	_G.Flight = not _G.Flight
end

_G.PowerPunch = false

function togglePunch()
	_G.PowerPunch = not _G.PowerPunch
end

function clearAvatar()
	if getchar().Head:FindFirstChildOfClass("BillboardGui") then
		getchar().Head:FindFirstChildOfClass("BillboardGui"):ClearAllChildren()
	end

	if getchar().Head:FindFirstChild("face") then
		getchar().Head.face:Destroy()
	end

	for i,v in pairs(getChildren(getchar())) do 
		if v:IsA("CharacterMesh") then 
			v:Destroy() 
		end 
	end

	for i,v in pairs(getChildren(getchar())) do 
		if v:IsA("Accessory") or v:IsA("Hat") then 
			if v:FindFirstChild("Handle") then
				v.Handle:Destroy() 
			end
		end 
	end
end

function Respawn()
    local oldpos = getchar().Head.Position
    
	local args = {
		[1] = Map.SpawnPoints.VR.VRSpawn
	}

	VREvents.Respawn:FireServer(unpack(args))
	wait(1)
    getchar():SetPrimaryPartCFrame(CFrame.new(oldpos))
end

function fullRespawn()
    local oldpos = getchar().Head.Position
    
	local args = {
		[1] = Map.SpawnPoints.VR.VRSpawn
	}

	VREvents.Respawn:FireServer(unpack(args))
	wait(1)
    getchar():SetPrimaryPartCFrame(CFrame.new(oldpos))
	wait(1)
	local oldloc = getgenv().Remote.Parent
	getgenv().Remote.Parent = VREvents
	getgenv().Remote:FireServer(1000)
	getgenv().Remote.Parent = oldloc
end

function StompSound()
	VREvents.PlaySound:FireServer("HardGroundImpact", true) 
end

_G.God = false

if VREvents:FindFirstChild("TakeDamage") then
	getgenv().Remote = VREvents:FindFirstChild("TakeDamage")
end

if VREvents:FindFirstChild("Drop") then
	getgenv().Remote1 = VREvents:FindFirstChild("Drop")
end

function godToggle()
	_G.God = not _G.God

	if VREvents:FindFirstChild("Drop") then
		getgenv().Remote1.Parent = nil
	else
		getgenv().Remote1.Parent = VREvents
		for i,v in pairs(getChildren(game:GetService("Workspace").Items)) do
			--local rtool = getchar()["Right Arm"]:FindFirstChild("Hold").Part1.Parent.Parent
			--local ltool = getchar()["Left Arm"]:FindFirstChild("Hold").Part1.Parent.Parent
			--print(rtool:GetFullName())

			VREvents.Drop:FireServer(getchar():FindFirstChild("Right Arm"), nil, nil, v)
			VREvents.Drop:FireServer(getchar():FindFirstChild("Left Arm"), nil, nil, v)
		end
        fullRespawn()
	end
end

Events.MapChange.OnClientEvent:Connect(function()
	_G.God = false
	for i,v in pairs(getChildren(game:GetService("Workspace").Items)) do
		--local rtool = getchar()["Right Arm"]:FindFirstChild("Hold").Part1.Parent.Parent
		--local ltool = getchar()["Left Arm"]:FindFirstChild("Hold").Part1.Parent.Parent
		--print(rtool:GetFullName())

		VREvents.Drop:FireServer(getchar():FindFirstChild("Right Arm"), nil, nil, v)
		VREvents.Drop:FireServer(getchar():FindFirstChild("Left Arm"), nil, nil, v)
	end
end)

function falldmgToggle()
	if VREvents:FindFirstChild("TakeDamage") then
		getgenv().Remote.Parent = nil
	else
		getgenv().Remote.Parent = VREvents
	end
end

_G.AutoRespawn = false

function deathrespawnToggle()
	_G.AutoRespawn = not _G.AutoRespawn
end

getchar().VRHealth.Changed:Connect(function(val)
	if val <= 0 and _G.AutoRespawn == true then
        Respawn()
	elseif val <= 0 and _G.God == true then
        Respawn()
	end
end)

function extraSlots()
	local v131 = game:GetService("Workspace").CurrentCamera.Slots

	local p41 = getchar().Torso

	local function v132(p42, p43, p44, p45, p46, p47, p48, p49, p50, p51)
		local v133 = Instance.new("Part");
		v133.CanCollide = false;
		v133.Name = "Slot";
		v133.Material = Enum.Material.SmoothPlastic;
		v133.CastShadow = false;
		v133.Parent = v131;
		v133:SetAttribute("Offset", Vector3.new(p42, p43, p44));
		v133:SetAttribute("Rotation", Vector3.new(p45, p46, p47));
		if p50 then
			local v134 = Instance.new("Part");
			v134.Name = "Trigger";
			v134.Shape = p48;
			v134.Size = p49;
			v134.CanCollide = false;
			v134.Material = Enum.Material.ForceField;
			v134.Transparency = 1;
			v134.Parent = v133;
			local v135 = Instance.new("Weld");
			v135.Part0 = v134;
			v135.Part1 = p41;
			v135.Parent = v134;
			v135.C0 = CFrame.new(p51);
			v133.Size = Vector3.new(0.05, 0.05, 0.05);
			v133.Transparency = 1;
			v133.CanQuery = false;
		else
			v133.Size = p49;
			v133.Shape = p48;
			v133.Transparency = 0.9;
		end;
		local v136 = Instance.new("Weld");
		v136.C0 = v136.C0 + Vector3.new(p42, p43, p44);
		v136.C0 = v136.C0 * CFrame.fromEulerAnglesXYZ(math.rad(p45), math.rad(p46), math.rad(p47));
		v136.Part0 = p41;
		v136.Part1 = v133;
		v136.Parent = v133;
		local v137 = Instance.new("ObjectValue");
		v137.Name = "Occupant";
		v137.Parent = v133;
		return v133, v136;
	end;

	v141 = v132(0.425, 0.2, -0.34, -45, 90, 0, Enum.PartType.Ball, Vector3.new(0.4, 0.4, 0.4));
	v141:SetAttribute("BalanceItem", false);
	v141.Name = "ChestSlot";
end

createbutton("Toggle Fly", toggleFlight)
createbutton("Clear Avatar & Name", clearAvatar)
createbutton("Laser", toggleLazer)
createbutton("Power Punch", togglePunch)
createbutton("Stomp Sound", StompSound)
createbutton("Respawn On Death Point", deathrespawnToggle)
createbutton("God Toggle (Buggy)", godToggle)
createbutton("Toggle Fall Damage", falldmgToggle)
createbutton("Extra Slot", extraSlots)
createbutton("Respawn", Respawn)
createbutton("Hard Respawn", fullRespawn)

game:GetService("Players").PlayerAdded:Connect(function(newplayer)
	wait()
	if newplayer:GetRankInGroup(9959763) > 249 then
		lp:Kick("Moderator joined. Bailing... (Player: "..newplayer.Name..", Group Rank: "..newplayer:GetRankInGroup(9959763)..")")
	end
	if newplayer.DisplayName == newplayer.Name then
		args = {
			[1] = newplayer.Name" has joined the game",
			[2] = "blue",
			[3] = 10
		}
		firesignal(game:GetService("ReplicatedStorage").Events.SystemMessage.OnClientEvent, unpack(args))
	else
		args = {
			[1] = newplayer.DisplayName.." ("..newplayer.Name..") has joined the game",
			[2] = "blue",
			[3] = 10
		}
		firesignal(game:GetService("ReplicatedStorage").Events.SystemMessage.OnClientEvent, unpack(args))
	end
end)

game:GetService("Players").PlayerRemoving:Connect(function(newplayer)
	wait()
	if newplayer.DisplayName == newplayer.Name then
		args = {
			[1] = newplayer.Name" has left the game",
			[2] = "blue",
			[3] = 10
		}
		firesignal(game:GetService("ReplicatedStorage").Events.SystemMessage.OnClientEvent, unpack(args))
	else
		args = {
			[1] = newplayer.DisplayName.." ("..newplayer.Name..") has left the game",
			[2] = "blue",
			[3] = 10
		}
		firesignal(game:GetService("ReplicatedStorage").Events.SystemMessage.OnClientEvent, unpack(args))
	end
end)

bool = false
bool2 = false
bool3 = false

game:GetService("UserInputService").InputBegan:Connect(function(kc)
	if kc.KeyCode == Enum.KeyCode.ButtonA then
		bool = not bool
	end
	if kc.KeyCode == Enum.KeyCode.ButtonX then
		bool2 = not bool2
	end
	if kc.KeyCode == Enum.KeyCode.ButtonY then
		bool3 = not bool3
	end
end)

game:GetService("UserInputService").InputEnded:Connect(function(kc)
	if kc.KeyCode == Enum.KeyCode.ButtonA then
		bool = not bool
	end
	if kc.KeyCode == Enum.KeyCode.ButtonX then
		bool2 = not bool2
	end
end)

local loop1 = coroutine.create(function()
	while true do
		if bool == true and _G.Flight == true then
			getchar().LocoSphere.Velocity = getchar().Head.CFrame.lookVector * 200
		end
		if bool2 == true and _G.Flight == true then
			getchar().LocoSphere.Velocity = Vector3.new(0,0,0) 
		end
		if bool3 == true and _G.PowerPunch == true then
			getchar()["Right Arm"].Velocity = getchar()["Right Arm"].CFrame.lookVector * 1000
		end
		ScrollingFrame.CanvasSize = UDim2.new(0, UIGridLayout.AbsoluteContentSize.X, 0, UIGridLayout.AbsoluteContentSize.Y)
		wait()
	end
end)

coroutine.resume(loop1)

_G.OVRHax_Loaded = true

args = {
	[1] = "OVRHax Loaded",
	[2] = "red",
	[3] = 10
}
firesignal(game:GetService("ReplicatedStorage").Events.SystemMessage.OnClientEvent, unpack(args))
