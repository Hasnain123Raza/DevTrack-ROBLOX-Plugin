local plugin = shared.plugin

local Roact = require(shared.DevTrack.Packages.Roact)
local RoactRodux = require(shared.DevTrack.Packages.RoactRodux)
local Store = require(shared.DevTrack.DockWidgetGui.Services.Rodux.Store)

local App = require(shared.DevTrack.DockWidgetGui.App)

local function InitializeDockWidgetGui()
	local devTrackDockWidget = plugin:CreateDockWidgetPluginGui(
		"DevTrackDockWidget",
		DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Float, false, false, 400, 400, 250, 250)
	)

	devTrackDockWidget.Title = "DevTrack"

	Roact.mount(
		Roact.createElement(RoactRodux.StoreProvider, {
			store = Store,
		}, {
			App = Roact.createElement(App),
		}),
		devTrackDockWidget,
		"App"
	)

	return devTrackDockWidget
end

return InitializeDockWidgetGui()
