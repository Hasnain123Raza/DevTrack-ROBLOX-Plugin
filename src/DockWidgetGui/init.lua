local plugin = shared.plugin

local Roact = require(shared.DevTrack.Packages.Roact)
local App = require(script.App)

local function InitializeDockWidgetGui()
	local devTrackDockWidget = plugin:CreateDockWidgetPluginGui(
		"DevTrackDockWidget",
		DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, false, false, 400, 400, 300, 300)
	)

	devTrackDockWidget.Title = "DevTrack"

	Roact.mount(Roact.createElement(App), devTrackDockWidget, "App")

	return devTrackDockWidget
end

return InitializeDockWidgetGui()
