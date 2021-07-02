local Roact = require(shared.DevTrack.Packages.Roact)
local WithRouter = require(shared.DevTrack.DockWidgetGui.Services.WithRouter)
local Merge = require(shared.DevTrack.Resources.Merge)

local function Register(props)
	return Roact.createFragment({
		TextLabel = Roact.createElement("TextLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0.5, 0, 0, 32),
			Position = UDim2.new(0.5, 0, 0.5, -16),
			Text = "Register",
		}),

		TextButton = Roact.createElement("TextButton", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0.5, 0, 0, 32),
			Position = UDim2.new(0.5, 0, 0.5, 16),
			Text = "Go To Login",
			[Roact.Event.MouseButton1Click] = function(rbx)
				props.router.setCurrentRoute("Authentication/Login")
			end,
		}),
	})
end

local function RegisterWrapper(props)
	return WithRouter(function(router)
		return Roact.createElement(Register, Merge(props, { router = router }))
	end)
end

return RegisterWrapper
