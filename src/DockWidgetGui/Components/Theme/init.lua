local Roact = require(shared.DevTrack.Packages.Roact)
local ThemeContext = require(script.Services.ThemeContext)

local Theme = Roact.Component:extend("Theme")

function Theme:init()
	self:setState({
		theme = {},
	})

	self.ThemeChangedConnection = nil
end

function Theme:didMount()
	self.ThemeChangedConnection = settings().Studio.ThemeChanged:Connect(function()
		self:setState(function(state)
			return {
				theme = {},
			}
		end)
	end)
end

function Theme:render()
	return Roact.createElement(ThemeContext.Provider, {
		value = self.state.theme,
	}, self.props[Roact.Children])
end

function Theme:willUnmount()
	self.ThemeChangedConnection:Disconnect()
end

return Theme
