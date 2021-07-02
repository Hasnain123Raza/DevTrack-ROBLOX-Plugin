local Roact = require(shared.DevTrack.Packages.Roact)
local Route = require(shared.DevTrack.DockWidgetGui.Components.Route)

local Login = require(script.Scenes.Login)
local Register = require(script.Scenes.Register)

local function Authentication()
	return Roact.createFragment({
		LoginRoute = Roact.createElement(
			Route,
			{ route = "Authentication/Login" },
			{ Login = Roact.createElement(Login) }
		),
		RegisterRoute = Roact.createElement(
			Route,
			{ route = "Authentication/Register" },
			{ Register = Roact.createElement(Register) }
		),
	})
end

return Authentication
