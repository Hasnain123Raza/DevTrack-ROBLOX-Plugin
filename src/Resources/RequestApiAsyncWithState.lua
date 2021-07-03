local RequestApiAsync = require(shared.DevTrack.Resources.RequestApiAsync)

local function RequestApiAsyncWithState(requestOptions, setStatus, setResponse, isMounted)
	local function initiate()
		setStatus("pending")
		local promise = RequestApiAsync(requestOptions):andThen(function(response)
			if not isMounted.value then
				return
			end

			if response.Body and response.Body.success then
				setStatus("fulfilled")
			else
				setStatus("rejected")
			end

			setResponse(response.Body)
		end)
	end

	return initiate
end

return RequestApiAsyncWithState
