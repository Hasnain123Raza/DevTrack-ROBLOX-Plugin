local Roact = require(shared.Resources.Roact)
local App = require(script:FindFirstChild("App"))

local function InitializeDockWidgetGui(plugin)
	local devTrackDockWidget = plugin:CreateDockWidgetPluginGui(
		"DevTrackDockWidget",
		DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, false, false, 200, 300, 150, 150)
	)

	devTrackDockWidget.Title = "DevTrack"

	Roact.mount(Roact.createElement(App), devTrackDockWidget, "App")

	return devTrackDockWidget
end

return InitializeDockWidgetGui
