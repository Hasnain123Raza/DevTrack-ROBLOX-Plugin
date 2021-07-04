local selectors = {}

function selectors.selectRouter(state)
	return state.Router
end

function selectors.selectRoute(state)
	return selectors.selectRouter(state).route
end

return selectors
