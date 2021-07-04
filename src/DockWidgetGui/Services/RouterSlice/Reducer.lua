local Rodux = require(shared.DevTrack.Packages.Rodux)

local routerReducer = Rodux.createReducer({ route = "Authentication/Login" }, {
	SetRoute = function(state, action)
		return {
			route = action.payload,
		}
	end,
})

return routerReducer
