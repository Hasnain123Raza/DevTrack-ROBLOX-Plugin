local plugin = shared.plugin

local Roact = require(shared.DevTrack.Packages.Roact)

local App = require(shared.DevTrack.DockWidgetGui.App)
local Theme = require(shared.DevTrack.DockWidgetGui.Components.Theme)
local Router = require(shared.DevTrack.DockWidgetGui.Components.Router)

local function InitializeDockWidgetGui()
	local devTrackDockWidget = plugin:CreateDockWidgetPluginGui(
		"DevTrackDockWidget",
		DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, false, false, 400, 400, 300, 300)
	)

	devTrackDockWidget.Title = "DevTrack"

	Roact.mount(
		Roact.createElement(Theme, {}, {
			Roact.createElement(Router, {}, {
				Roact.createElement(App),
			}),
		}),
		devTrackDockWidget,
		"App"
	)

	return devTrackDockWidget
end

return InitializeDockWidgetGui()
