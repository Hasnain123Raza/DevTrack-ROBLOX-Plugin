local Roact = require(shared.DevTrack.Packages.Roact)

local function Resource(props)
	local asyncStatus = props.asyncStatus

	return (asyncStatus == "idle" and props.IdleComponent)
		or (asyncStatus == "pending" and props.PendingComponent)
		or (asyncStatus == "rejected" and props.RejectedComponent)
		or (asyncStatus == "fulfilled" and props.FulfilledComponent)
end

return Resource
