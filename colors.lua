-- COLORS.LUA
local M = {} -- We created a table for exporting.

-- ANSI color codes for terminal output
M.BOLD    = "\27[1m"
M.RESET   = "\27[0m"

M.CYAN    = "\27[36m"
M.RED     = "\27[31m"
M.GREEN   = "\27[32m"
M.YELLOW  = "\27[33m"

return M -- Returns the table for whoever calls 'require'.