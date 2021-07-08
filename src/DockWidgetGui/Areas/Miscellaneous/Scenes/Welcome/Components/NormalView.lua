local Roact = require(shared.DevTrack.Packages.Roact)

local WelcomePage = require(script.Parent.WelcomePage)

local function NormalView()
	return Roact.createElement(WelcomePage, {
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(0.9, 0, 1, 0),
	})
end

return NormalView
