local Roact = require(shared.DevTrack.Packages.Roact)
local Route = require(shared.DevTrack.DockWidgetGui.Components.Route)

local Welcome = require(script.Scenes.Welcome)

local function Miscellaneous()
	return Roact.createFragment({
		WelcomeRoute = Roact.createElement(
			Route,
			{ route = "Miscellaneous/Welcome" },
			{ Welcome = Roact.createElement(Welcome) }
		),
	})
end

return Miscellaneous
