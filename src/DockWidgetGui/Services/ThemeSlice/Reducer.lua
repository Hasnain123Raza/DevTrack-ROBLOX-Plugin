local Rodux = require(shared.DevTrack.Packages.Rodux)

local themeReducer = Rodux.createReducer({ currentTheme = {} }, {
	SetCurrentTheme = function(state, action)
		return { currentTheme = action.payload }
	end,
})

return themeReducer
