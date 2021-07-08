local Rodux = require(shared.DevTrack.Packages.Rodux)

local AuthenticationReducer = require(shared.DevTrack.DockWidgetGui.Services.AuthenticationSlice.Reducer)
local RouterReducer = require(shared.DevTrack.DockWidgetGui.Services.RouterSlice.Reducer)
local ThemeReducer = require(shared.DevTrack.DockWidgetGui.Services.ThemeSlice.Reducer)

local store = Rodux.Store.new(
	Rodux.combineReducers({
		Authentication = AuthenticationReducer,
		Router = RouterReducer,
		Theme = ThemeReducer,
	}),
	nil,
	{ Rodux.thunkMiddleware }
)

return store
