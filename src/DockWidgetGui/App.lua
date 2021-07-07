local Roact = require(shared.DevTrack.Packages.Roact)
local RoactRodux = require(shared.DevTrack.Packages.RoactRodux)

local ThemeActions = require(shared.DevTrack.DockWidgetGui.Services.ThemeSlice.Actions)
local ThemeSelectors = require(shared.DevTrack.DockWidgetGui.Services.ThemeSlice.Selectors)

local Areas = shared.DevTrack.DockWidgetGui.Areas
local Authentication = require(Areas.Authentication)
local Miscellaneous = require(Areas.Miscellaneous)

local App = Roact.Component:extend("App")

function App:init()
	self.ThemeChangedConnection = nil
end

function App:didMount()
	self.ThemeChangedConnection = settings().Studio.ThemeChanged:Connect(function()
		self.props:setTheme({})
	end)
end

function App:render()
	return Roact.createElement("Frame", {
		Name = "App",
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = settings().Studio.Theme:GetColor(Enum.StudioStyleGuideColor.MainBackground),
	}, {
		Authentication = Roact.createElement(Authentication),
		Miscellaneous = Roact.createElement(Miscellaneous),
	})
end

function App:willUnmount()
	self.ThemeChangedConnection:Disconnect()
end

return RoactRodux.connect(function(state, props)
	return { Theme = ThemeSelectors.selectCurrentTheme(state) }
end, function(dispatch)
	return {
		setTheme = function(theme)
			dispatch(ThemeActions.setTheme(theme))
		end,
	}
end)(App)
