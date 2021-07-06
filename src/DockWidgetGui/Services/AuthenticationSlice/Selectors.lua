local selectors = {}

function selectors.selectAuthentication(state)
	return state.Authentication
end

function selectors.selectIsAuthenticated(state)
  return selectors.selectAuthentication(state).isAuthenticated
end

function selectors.selectUser(state)
  return selectors.selectAuthentication(state).user
end

return selectors
