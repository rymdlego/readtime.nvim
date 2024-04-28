local M = {}

M.config = {}

local defaults = {
	wpm = 230,
}

local function word_count()
	local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
	local text = table.concat(lines, " ")
	local count = select(2, text:gsub("%S+", ""))
	return count
end

local function read_time()
	local time = tostring(math.ceil(word_count() / M.config.wpm))
	return time
end

M.get_word_count = function()
	return word_count()
end

M.is_text_file = function()
	if vim.bo.filetype == "markdown" or vim.bo.filetype == "text" then
		return true
	else
		return false
	end
end

M.display_read_time = function()
	print(word_count() .. " words / " .. M.config.wpm .. " WPM = " .. read_time() .. " minutes of read time.")
end

M.setup = function(user_config)
	M.config = vim.tbl_deep_extend("force", {}, defaults, user_config or {})
	vim.api.nvim_create_user_command("ReadTime", M.display_read_time, {})
end

return M
