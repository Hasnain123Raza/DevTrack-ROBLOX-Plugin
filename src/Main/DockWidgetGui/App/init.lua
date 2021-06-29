local Roact = require(shared.Resources.Roact)

local App = Roact.Component:extend("App")

function App:init()
	self:setState({
		counter = 1,
	})
end

function App:render()
	return Roact.createElement("Frame", {
		Name = "App",
		Size = UDim2.new(1, 0, 1, 0),
	}, {
		Roact.createElement("TextLabel", {
			Name = "CounterLabel",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0.5, 0, 0, 32),
			Position = UDim2.new(0.5, 0, 0.5, -16),
			Text = self.state.counter,
		}),
		Roact.createElement("TextButton", {
			Name = "IncrementCounter",
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0.5, 0, 0, 32),
			Position = UDim2.new(0.5, 0, 0.5, 16),
			Text = "Increment",
			[Roact.Event.MouseButton1Click] = function(roblox)
				self:setState(function(currentState)
					return { counter = currentState.counter + 1 }
				end)
			end,
		}),
	})
end

return App
