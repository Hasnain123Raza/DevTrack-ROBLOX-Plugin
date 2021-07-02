local function decodeChar(hex)
	return string.char(tonumber(hex, 16))
end

local function decodeString(str)
	local output, t = string.gsub(str, "%%(%x%x)", decodeChar)
	return output
end

return decodeString
