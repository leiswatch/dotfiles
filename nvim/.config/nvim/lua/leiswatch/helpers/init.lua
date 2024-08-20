local M = {}

local function contains(tab, val)
	for _, value in ipairs(tab) do
		if value == val then
			return true
		end
	end

	return false
end

M.contains = contains;

return M
