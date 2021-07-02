local Roact = require(shared.DevTrack.Packages.Roact)
local WithRouter = require(shared.DevTrack.DockWidgetGui.Services.WithRouter)
local Merge = require(shared.DevTrack.Resources.Merge)

local function Route(props)
	return Roact.createFragment(props.route == props.currentRoute and props[Roact.Children])
end

local function RouteWrapper(props)
	return WithRouter(function(router)
		return Roact.createElement(Route, Merge(props, { currentRoute = router.currentRoute }))
	end)
end

return RouteWrapper
