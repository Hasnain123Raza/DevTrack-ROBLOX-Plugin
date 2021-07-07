local Rodux = require(shared.DevTrack.Packages.Rodux)

local routerReducer = Rodux.createReducer({ route = "Miscellaneous/Welcome" }, {
	SetRoute = function(state, action)
		return {
			route = action.payload,
		}
	end,
})

return routerReducer
