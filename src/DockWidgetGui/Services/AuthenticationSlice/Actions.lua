local Rodux = require(shared.DevTrack.Packages.Rodux)

local RequestApiAsync = require(shared.DevTrack.Resources.RequestApiAsync)

local IsAuthenticatedEnum = require(shared.DevTrack.DockWidgetGui.Services.AuthenticationSlice.IsAuthenticatedEnum)

local actions = {}

actions.setAuthentication = Rodux.makeActionCreator("SetAuthentication", function(payload)
	return {
		payload = payload,
	}
end)

actions.setGetAuthenticatedRequestStatus = Rodux.makeActionCreator("SetGetAuthenticatedRequestStatus", function(payload)
	return {
		payload = payload,
	}
end)

actions.getAuthenticationAsync = function(store)
	local promise = RequestApiAsync({ Url = "/api/authentication/authenticated" })

	store:dispatch(actions.setGetAuthenticatedRequestStatus("pending"))
	store:dispatch(actions.setAuthentication({ isAuthenticated = IsAuthenticatedEnum.Undetermined, user = {} }))

	promise:andThen(function(response)
		if response.Body and response.Body.success then
			store:dispatch(actions.setGetAuthenticatedRequestStatus("fulfilled"))
			store:dispatch(actions.setAuthentication({
				isAuthenticated = response.Body.isAuthenticated and IsAuthenticatedEnum.Authenticated
					or IsAuthenticatedEnum.Unauthenticated,
				user = response.Body.user,
			}))
		else
			store:dispatch(actions.setGetAuthenticatedRequestStatus("rejected"))
			store:dispatch(actions.setAuthentication({ isAuthenticated = IsAuthenticatedEnum.Undetermined, user = {} }))
		end
	end)
end

return actions
