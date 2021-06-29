shared.Resources = script.Parent:FindFirstChild("Resources")

local DevTrackDockWidget = require(script:FindFirstChild("DockWidgetGui"))(plugin)

local Toolbar = plugin:CreateToolbar("DevTrack")
local ToggleButton = Toolbar:CreateButton(
	"Toggle",
	"Toggles the DevTrack DockWidget",
	"http://www.roblox.com/asset/?id=7019135863",
	"Toggle"
)
ToggleButton.ClickableWhenViewportHidden = true

ToggleButton.Click:Connect(function()
	DevTrackDockWidget.Enabled = not DevTrackDockWidget.Enabled
	ToggleButton:SetActive(DevTrackDockWidget.Enabled)
end)
