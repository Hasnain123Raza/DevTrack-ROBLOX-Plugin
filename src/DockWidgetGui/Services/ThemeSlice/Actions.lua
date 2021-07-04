local Rodux = require(shared.DevTrack.Packages.Rodux)

local actions = {}

actions.setTheme = Rodux.makeActionCreator("SetCurrentTheme", function(theme)
	return {
		payload = theme,
	}
end)

return actions
