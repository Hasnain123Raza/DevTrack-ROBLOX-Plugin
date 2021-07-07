local Roact = require(shared.DevTrack.Packages.Roact)

local function NormalView()
	return Roact.createElement("Frame", {
		Name = "WelcomePage",
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Size = UDim2.new(1, -16, 1, -16),
	}, {})
end

return NormalView
