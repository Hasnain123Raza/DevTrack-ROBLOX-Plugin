local Roact = require(shared.DevTrack.Packages.Roact)
local ThemeContext = require(shared.DevTrack.DockWidgetGui.Components.Theme.Services.ThemeContext)

local function WithTheme(callback)
	return Roact.createElement(ThemeContext.Consumer, {
		render = callback,
	})
end

return WithTheme
