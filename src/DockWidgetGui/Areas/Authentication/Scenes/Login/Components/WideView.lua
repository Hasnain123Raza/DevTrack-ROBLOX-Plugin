local Roact = require(shared.DevTrack.Packages.Roact)

local LoginForm = require(script.Parent.LoginForm)

local function WideView()
	return Roact.createFragment({
		DevTrackLogo = Roact.createElement("ImageLabel", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.2, 0, 0.5, 0),
			Size = UDim2.new(0.3, 0, 0.9, 0),
			BackgroundTransparency = 1,
			Image = "http://www.roblox.com/asset/?id=7021313691",
		}, {
			Roact.createElement("UIAspectRatioConstraint"),
		}),
		LoginForm = Roact.createElement(LoginForm, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.7, 0, 0.5, 0),
			Size = UDim2.new(0.5, 0, 1, 0),
		}),
	})
end

return WideView
