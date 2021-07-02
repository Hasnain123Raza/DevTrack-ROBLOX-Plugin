shared.plugin = plugin

local DevTrackFolder = script.Parent
shared.DevTrack = {
	Packages = DevTrackFolder.Packages,
	Resources = DevTrackFolder.Resources,
	DockWidgetGui = DevTrackFolder.DockWidgetGui,
}

local DevTrackDockWidget = require(shared.DevTrack.DockWidgetGui)

local Toolbar = plugin:CreateToolbar("DevTrack")
local ToggleButton = Toolbar:CreateButton(
	"Toggle",
	"Toggles the DevTrack DockWidget",
	"http://www.roblox.com/asset/?id=7021313691",
	"Toggle"
)
ToggleButton.ClickableWhenViewportHidden = true

ToggleButton.Click:Connect(function()
	DevTrackDockWidget.Enabled = not DevTrackDockWidget.Enabled
	ToggleButton:SetActive(DevTrackDockWidget.Enabled)
end)
