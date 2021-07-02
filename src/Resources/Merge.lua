local function Merge(...)
	local newTable = {}

	for _, mergeTable in pairs({ ... }) do
		for key, value in pairs(mergeTable) do
			newTable[key] = value
		end
	end

	return newTable
end

return Merge
