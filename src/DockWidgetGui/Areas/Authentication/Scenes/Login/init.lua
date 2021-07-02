local Roact = require(shared.DevTrack.Packages.Roact)
local WithRouter = require(shared.DevTrack.DockWidgetGui.Services.WithRouter)
local Merge = require(shared.DevTrack.Resources.Merge)

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
				self.props.router.setCurrentRoute("Authentication/Register")
			end,
		}),
	})
end

local function LoginWrapper(props)
	return WithRouter(function(router)
		return Roact.createElement(Login, Merge(props, { router = router }))
	end)
end

return LoginWrapper
