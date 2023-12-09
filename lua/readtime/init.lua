local M = {}

local default_config = {
    wpm = 230
}

local user_config = vim.g.readtime_options or default_config

local function word_count()
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, true)
    local text = table.concat(lines, " ")
    local count = select(2, text:gsub("%S+", ""))
    return count
end

local function read_time()
  local time = tostring(math.ceil(word_count() / user_config.wpm))
  return time
end

M.display_read_time = function()
    print(word_count() .. " words / " .. user_config.wpm .. " WPM = " .. read_time() .. " minutes of read time.")
end

M.setup = function()
    vim.api.nvim_create_user_command('ReadTime', M.display_read_time, {})
end

return M
