local Roact = require(shared.DevTrack.Packages.Roact)

local LoginForm = require(script.Parent.LoginForm)

local function NormalView()
	return Roact.createElement(LoginForm, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, 0, 1, 0),
	})
end

return NormalView
