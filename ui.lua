-- UI.LUA
local colors = require("colors") -- Import the colors from the other file.
local M = {}

-- Clears the terminal screen (works on Windows and Unix-like systems)
function M.clearScreen()
    if package.config:sub(1,1) == "\\" then
        os.execute("cls")
    else
        os.execute("clear")
    end
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

return M