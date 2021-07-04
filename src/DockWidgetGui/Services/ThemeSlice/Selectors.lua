local selectors = {}

function selectors.selectTheme(state)
	return state.Theme
end

function selectors.selectCurrentTheme(state)
	return selectors.selectTheme(state).currentTheme
end

return selectors
