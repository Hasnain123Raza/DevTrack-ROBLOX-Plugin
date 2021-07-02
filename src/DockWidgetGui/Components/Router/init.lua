local Roact = require(shared.DevTrack.Packages.Roact)
local RouterContext = require(script.Services.RouterContext)

local Router = Roact.Component:extend("Router")

function Router:init()
	self:setState({
		currentRoute = "Authentication/Login",
	})
end

function Router:render()
	return Roact.createElement(RouterContext.Provider, {
		value = {
			currentRoute = self.state.currentRoute,
			setCurrentRoute = function(newRoute)
				self:setState({ currentRoute = newRoute })
			end,
		},
	}, self.props[Roact.Children])
end

return Router
