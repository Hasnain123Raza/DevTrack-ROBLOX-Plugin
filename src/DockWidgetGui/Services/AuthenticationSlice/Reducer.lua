local Rodux = require(shared.DevTrack.Packages.Rodux)

local authenticationReducer = Rodux.createReducer({
	isAuthenticated = false,
	user = {},
}, {
	SetAuthentication = function(state, action)
		local payload = action.payload
		return { isAuthenticated = payload.isAuthenticated, user = payload.user }
	end,
})

return authenticationReducer
