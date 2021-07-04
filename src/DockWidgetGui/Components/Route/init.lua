local Roact = require(shared.DevTrack.Packages.Roact)
local RoactRodux = require(shared.DevTrack.Packages.RoactRodux)

local RouterSelectors = require(shared.DevTrack.DockWidgetGui.Services.RouterSlice.Selectors)

local function Route(props)
	return Roact.createFragment(props.route == props.currentRoute and props[Roact.Children])
end

return RoactRodux.connect(function(state, props)
	return {
		currentRoute = RouterSelectors.selectRoute(state),
	}
end, function(dispatch)
	return {}
end)(Route)
