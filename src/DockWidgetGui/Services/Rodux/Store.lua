local Rodux = require(shared.DevTrack.Packages.Rodux)

local RouterReducer = require(shared.DevTrack.DockWidgetGui.Services.RouterSlice.Reducer)
local ThemeReducer = require(shared.DevTrack.DockWidgetGui.Services.ThemeSlice.Reducer)

local store = Rodux.Store.new(Rodux.combineReducers({
	--//Authentication = nil,
	Router = RouterReducer,
	Theme = ThemeReducer,
}))

return store
