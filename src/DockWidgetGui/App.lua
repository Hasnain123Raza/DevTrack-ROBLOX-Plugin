local Roact = require(shared.DevTrack.Packages.Roact)
local Llama = require(shared.DevTrack.Packages.Llama)

local WithTheme = require(shared.DevTrack.DockWidgetGui.Services.WithTheme)

local Areas = shared.DevTrack.DockWidgetGui.Areas
local Authentication = require(Areas.Authentication)

local App = Roact.Component:extend("App")

function App:render(props)
	return Roact.createElement("Frame", {
		Name = "App",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.MainBackground),
	}, {
		Authentication = Roact.createElement(Authentication),
	})
end

local function AppWrapper(props)
	return WithTheme(function(theme)
		return Roact.createElement(App, Llama.Dictionary.merge(props, { theme = theme }))
	end)
end

return AppWrapper
