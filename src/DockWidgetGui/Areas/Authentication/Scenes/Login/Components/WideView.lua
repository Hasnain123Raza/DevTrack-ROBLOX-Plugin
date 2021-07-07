local Roact = require(shared.DevTrack.Packages.Roact)

local LoginForm = require(script.Parent.LoginForm)

local function WideView(props)
	local Form

	if props.absoluteSize.Y < 250 then
		Form = Roact.createElement("ScrollingFrame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.7, 0, 0.5, 0),
			Size = UDim2.new(0.5, 0, 1, 0),
			CanvasSize = UDim2.new(0, 0, 0, 275),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			BottomImage = "",
			ScrollBarImageColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.ScrollBar),
			ScrollBarThickness = 4,
			TopImage = "",
		}, {
			LoginForm = Roact.createElement(LoginForm, {
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(0.5, 0, 0.5, 0),
				Size = UDim2.new(1, -32, 0, 250),
			}),
		})
	else
		Form = Roact.createElement(LoginForm, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.7, 0, 0.5, 0),
			Size = UDim2.new(0.5, 0, 1, 0),
		})
	end

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
		LoginForm = Form,
	})
end

return WideView
