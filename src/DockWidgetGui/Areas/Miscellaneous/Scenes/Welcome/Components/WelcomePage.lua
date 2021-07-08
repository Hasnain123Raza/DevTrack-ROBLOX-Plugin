local Roact = require(shared.DevTrack.Packages.Roact)

local function WelcomePage(props)
	return Roact.createElement("Frame", {
		Name = "WelcomePage",
		AnchorPoint = props.AnchorPoint,
		Position = props.Position,
		Size = props.Size,
		BackgroundTransparency = 1,
	}, {
		Title = Roact.createElement("TextLabel", {
			Name = "Title",
			Position = UDim2.new(0, 0, 0, 0),
			Size = UDim2.new(1, 0, 0, 32),
			BackgroundTransparency = 1,
			TextColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.MainText),
			Font = Enum.Font.RobotoMono,
			TextSize = 32,
			Text = "Welcome",
		}),
		Description = Roact.createElement("TextLabel", {
			Name = "Description",
			AnchorPoint = Vector2.new(0, 0.5),
			Position = UDim2.new(0, 0, 0.5, 0),
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundTransparency = 1,
			TextColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.MainText),
			TextYAlignment = Enum.TextYAlignment.Center,
			RichText = true,
			Font = Enum.Font.RobotoMono,
			TextSize = 32,
			Text = "<b>Track</b>\n<b>Level up</b>\n<b>Compete</b>",
		}),
		Continue = Roact.createElement("TextButton", {
			Name = "ContinueButton",
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			Size = UDim2.new(1, 0, 0, 24),
			BackgroundColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.Button),
			BorderColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.ButtonBorder),
			TextColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.MainText),
			Font = Enum.Font.RobotoMono,
			TextSize = 24,
			Text = "Continue",
		}),
	})
end

return WelcomePage
