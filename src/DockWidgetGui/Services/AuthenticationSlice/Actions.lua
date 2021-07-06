local Rodux = require(shared.DevTrack.Packages.Rodux)

local actions = {}

actions.setAuthentication = Rodux.createAction("SetAuthentication", function(payload)
	return {
		payload = payload,
	}
end)

return actions
