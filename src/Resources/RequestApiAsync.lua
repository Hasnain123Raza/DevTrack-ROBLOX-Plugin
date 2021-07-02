local plugin = shared.plugin
local HttpService = game:GetService("HttpService")
local Protocol = "https://"
local Host = "devtrack-roblox.herokuapp.com"

local Promise = require(shared.DevTrack.Packages.Promise)
local UrlDecode = require(shared.DevTrack.Resources.UrlDecode)

local Cookie = plugin:GetSetting("Cookie [DO NOT SHARE THIS WITH ANYONE]")

local function RequestApiAsync(requestOptions)
	requestOptions.Url = Protocol .. Host .. requestOptions.Url
	requestOptions.Headers = requestOptions.Headers or {}
	requestOptions.Headers.Cookie = Cookie

	return Promise.new(function(resolve, reject)
		local success, response = pcall(function()
			if requestOptions.Body then
				requestOptions.Body = HttpService:JSONEncode(requestOptions.Body)
			end

			return HttpService:RequestAsync(requestOptions)
		end)

		if not success then
			return resolve({
				success = false,
				errors = {
					{ path = { "alert" }, message = "There was a problem trying to reach the server" },
					{ path = { "pcall" }, message = response },
				},
			})
		end

		local setCookieHeader = response.Headers["set-cookie"]
		if setCookieHeader then
			local rawCookie = setCookieHeader:match("(.-);")
			local urlDecodedCookie = UrlDecode(rawCookie)
			Cookie = urlDecodedCookie
			plugin:SetSetting("Cookie [DO NOT SHARE THIS WITH ANYONE]", Cookie)
		end

		return resolve(response)
	end)
end

return RequestApiAsync
