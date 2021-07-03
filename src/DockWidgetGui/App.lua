local plugin = shared.plugin

local RequestApiAsyncWithState = require(shared.DevTrack.Resources.RequestApiAsyncWithState)

local Resource = require(shared.DevTrack.DockWidgetGui.Components.Resource)
local Roact = require(shared.DevTrack.Packages.Roact)
local Router = require(shared.DevTrack.DockWidgetGui.Components.Router)
local Llama = require(shared.DevTrack.Packages.Llama)

local Areas = shared.DevTrack.DockWidgetGui.Areas
local Authentication = require(Areas.Authentication)

local App = Roact.Component:extend("App")

function App:init()
	self:setState({
		getAuthenticationRequestStatus = "idle",
		authenticationResponse = {},
	})

	self.isMounted = { value = false }

	self.initiateGetAuthenticationRequest = RequestApiAsyncWithState(
		{ Url = "/api/authentication/authenticated", Headers = { ["Content-Type"] = "application/json" } },
		function(status)
			self:setState(function(state)
				return Llama.Dictionary.merge(state, {getAuthenticationRequestStatus = status})
			end)
		end,
		function(response)
			self:setState(function(state)
				return Llama.Dictionary.merge(state, {authenticationResponse = response})
			end)
		end,
		self.isMounted
	)
end

function App:didMount()
	-- RequestApiAsync({
	-- 	Url = "/api/authentication/login",
	-- 	Method = "POST",
	-- 	Headers = { ["Content-Type"] = "application/json" },
	-- 	Body = { user = { email = "hasnain.mohsan@gmail.com", password = "Aspose123$$" } },
	-- }):andThen(function(response)
	-- 	print(response)
	-- end)

	-- RequestApiAsync({ Url = "/api/authentication/authenticated" }):andThen(function(response)
	-- 	print(response.Body)
	-- end)
	self.isMounted.value = true
end

function App:render()
	local getAuthenticationRequestStatus = self.state.getAuthenticationRequestStatus

	return Roact.createElement(Router, {}, {
		Frame = Roact.createElement("Frame", {
			Name = "App",
			Size = UDim2.new(1, 0, 1, 0),
		}, {
			-- Authentication = Roact.createElement(Authentication),
			Roact.createElement(Resource, {
				asyncStatus = self.state.getAuthenticationRequestStatus,
				IdleComponent = Roact.createElement("TextButton", {
					Name = "GetAuthenticationButton",
					Text = "Get Authentication",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.new(0.5, 0, 0, 32),
					Position = UDim2.new(0.5, 0, 0.5, 16),
					[Roact.Event.MouseButton1Click] = function(rbx)
						self.initiateGetAuthenticationRequest()
					end,
				}),
				PendingComponent = Roact.createElement("TextLabel", {
					Name = "GetAuthenticationButton",
					Text = "Loading...",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.new(0.5, 0, 0, 32),
					Position = UDim2.new(0.5, 0, 0.5, 16),
				}),
				RejectedComponent = Roact.createElement("TextButton", {
					Name = "GetAuthenticationButton",
					Text = "Retry",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.new(0.5, 0, 0, 32),
					Position = UDim2.new(0.5, 0, 0.5, 16),
					[Roact.Event.MouseButton1Click] = function(rbx)
						self.initiateGetAuthenticationRequest()
					end,
				}),
				FulfilledComponent = Roact.createElement("TextButton", {
					Name = "GetAuthenticationButton",
					Text = "Congratulations!",
					AnchorPoint = Vector2.new(0.5, 0.5),
					Size = UDim2.new(0.5, 0, 0, 32),
					Position = UDim2.new(0.5, 0, 0.5, 16),
					[Roact.Event.MouseButton1Click] = function(rbx)
						self.initiateGetAuthenticationRequest()
					end,
				}),
			}),
		}),
	})
end

function App:willUnmount()
	self.isMounted.value = false
end

return App
