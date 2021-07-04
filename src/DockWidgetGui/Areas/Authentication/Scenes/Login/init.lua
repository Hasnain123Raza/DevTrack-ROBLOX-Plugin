local Roact = require(shared.DevTrack.Packages.Roact)
local RoactRodux = require(shared.DevTrack.Packages.RoactRodux)

local RouterActions = require(shared.DevTrack.DockWidgetGui.Services.RouterSlice.Actions)

local Login = Roact.Component:extend("Login")

function Login:render()
	return Roact.createFragment({
		TextLabel = Roact.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0.5, 0, 0, 32),
			Position = UDim2.new(0.5, 0, 0.5, -16),
			Text = "Login",
		}),

		TextButton = Roact.createElement("TextButton", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0.5, 0, 0, 32),
			Position = UDim2.new(0.5, 0, 0.5, 16),
			Text = "Go To Register",
			[Roact.Event.MouseButton1Click] = function(rbx)
				self.props.setRoute("Authentication/Register")
			end,
		}),
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
