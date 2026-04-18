-- UI.LUA
local colors = require("colors") -- Import the colors from the other file.
local M = {}

-- Clears the terminal screen (works on Windows and Unix-like systems)
function M.clearScreen()
    io.write("\27[2J\27[H\27[3J")
    io.flush()
end

-- Displays the BMI calculator banner
function M.printBanner()
    print(colors.BOLD .. colors.CYAN ..[[
=====================================
       █████╗  ███╗   ███╗██╗
       ██╔══██╗████╗ ████║██║
       ███████║██╔████╔██║██║
       ██╔══██║██║╚██╔╝██║██║
       ███████║██║ ╚═╝ ██║██║
       ╚══════╝╚═╝     ╚═╝╚═╝
=====================================
          BODY MASS INDEX
=====================================
    ]].. colors.RESET)
end

-- Print error
function M.showError(msg)
    M.clearScreen()
    M.printBanner()

    print(colors.BOLD .. colors.RED .. msg, "\n" .. colors.RESET)
end

return M
