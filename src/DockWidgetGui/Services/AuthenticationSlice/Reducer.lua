local Rodux = require(shared.DevTrack.Packages.Rodux)
local Llama = require(shared.DevTrack.Packages.Llama)

local IsAuthenticatedEnum = require(shared.DevTrack.DockWidgetGui.Services.AuthenticationSlice.IsAuthenticatedEnum)

local authenticationReducer = Rodux.createReducer({
	isAuthenticated = IsAuthenticatedEnum.Undetermined,
	user = {},
	getAuthenticatedRequestStatus = "idle",
}, {
	SetAuthentication = function(state, action)
		local payload = action.payload
		return { isAuthenticated = payload.isAuthenticated, user = payload.user }
	end,

	SetGetAuthenticatedRequestStatus = function(state, action)
		return Llama.Dictionary.merge(state, { getAuthenticatedRequestStatus = action.payload })
	end,
})

return authenticationReducer
