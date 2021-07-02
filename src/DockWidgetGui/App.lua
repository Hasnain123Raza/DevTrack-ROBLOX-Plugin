local plugin = shared.plugin

local RequestApiAsync = require(shared.DevTrack.Resources.RequestApiAsync)

local Roact = require(shared.DevTrack.Packages.Roact)
local Router = require(shared.DevTrack.DockWidgetGui.Components.Router)

local Areas = shared.DevTrack.DockWidgetGui.Areas
local Authentication = require(Areas.Authentication)

local App = Roact.Component:extend("App")

function App:didMount()
	-- RequestApiAsync({
	-- 	Url = "/api/authentication/login",
	-- 	Method = "POST",
	-- 	Headers = { ["Content-Type"] = "application/json" },
	-- 	Body = { user = { email = "hasnain.mohsan@gmail.com", password = "Aspose123$$" } },
	-- }):andThen(function(response)
	-- 	print(response)
	-- end)

	RequestApiAsync({ Url = "/api/authentication/authenticated" }):andThen(function(response)
		print(response.Body)
	end)
end

function App:render()
	return Roact.createElement(Router, {}, {
		Frame = Roact.createElement("Frame", {
			Name = "App",
			Size = UDim2.new(1, 0, 1, 0),
		}, {
			Authentication = Roact.createElement(Authentication),
		}),
	})
end

return App
