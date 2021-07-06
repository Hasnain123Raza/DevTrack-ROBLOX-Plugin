local Roact = require(shared.DevTrack.Packages.Roact)
local RoactRodux = require(shared.DevTrack.Packages.RoactRodux)

local RouterActions = require(shared.DevTrack.DockWidgetGui.Services.RouterSlice.Actions)

local NormalView = require(script.Components.NormalView)
local TallView = require(script.Components.TallView)
local WideView = require(script.Components.WideView)

local Login = Roact.Component:extend("Login")

function Login:init()
	self:setState({ absoluteSize = Vector2.new() })
end

function Login:render()
	local selectedView
	local absoluteSize = self.state.absoluteSize

	if absoluteSize.X > 500 then
		selectedView = WideView
	elseif absoluteSize.Y > 400 then
		selectedView = TallView
	else
		selectedView = NormalView
	end

	return Roact.createElement("Frame", {
		Name = "Login",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, -16, 1, -16),
		BackgroundTransparency = 1,
		[Roact.Change.AbsoluteSize] = function(rbx)
			self:setState(function(state)
				return { absoluteSize = rbx.AbsoluteSize }
			end)
		end,
	}, {
		View = Roact.createElement(selectedView),
	})
end

return RoactRodux.connect(function(state, props)
	return {}
end, function(dispatch)
	return {
		setRoute = function(route)
			dispatch(RouterActions.setRoute(route))
		end,
	}
end)(Login)
