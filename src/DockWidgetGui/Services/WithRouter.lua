local Roact = require(shared.DevTrack.Packages.Roact)
local RouterContext = require(shared.DevTrack.DockWidgetGui.Components.Router.Services.RouterContext)

local function WithRouter(callback)
	return Roact.createElement(RouterContext.Consumer, { render = callback })
end

return WithRouter
