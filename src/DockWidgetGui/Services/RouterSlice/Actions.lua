local Rodux = require(shared.DevTrack.Packages.Rodux)

local actions = {}

actions.setRoute = Rodux.makeActionCreator("SetRoute", function(route)
	return {
		payload = route,
	}
end)

return actions
