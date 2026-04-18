-- MAIN.LUA
local colors = require("colors")
local ui = require("ui")
local calcs = require("calculations")

-- Disable output buffering for real-time terminal feedback
io.stdout:setvbuf("no")

ui.clearScreen()
ui.printBanner()

-- Variables
local address = "assets/dados.csv"
local weight, height, age

while true do
    while true do
        -- Get user input for height, weight, and age
        io.write(colors.GREEN .."Your weight (kg): ".. colors.RESET)
        weight = tonumber(io.read())

        io.write(colors.GREEN .."Your height (m): ".. colors.RESET)
        height = tonumber(io.read())

        io.write(colors.GREEN .."Your age (y): ".. colors.RESET)
        age = tonumber(io.read())

        -- Checks
        -- Weight
        if (weight < 0) then
            ui.showError("[!] Weight should not be seen as something negative!")

        -- Height
        elseif (height and height > 3) then
            ui.showError("[!] Type height in meters!")

        elseif (height < 0) then
            ui.showError("[!] Height should not be seen as something negative!")

        -- Age
        elseif (age < 0) then
            ui.showError("[!] Age should not be seen as something negative!")

        -- Check if it's a number
        elseif (weight and height and age) then
            break

        else
            ui.showError("[!] Type valid numbers!")
        end
    end

    print("\n-------------------------------------------")

    -- Load classification data and calculate BMI
    local classData, path = calcs.loadTable(address, age)

    if (type(classData) == "nil") then
        ui.showError("[!] File not found an '" .. path .. "'")

        break
    end

    local result = calcs.calculateBMI(weight, height, classData)

    if (type(result) ~= "nil") then
        -- Display the BMI classification
        calcs.classifyBMI(result, classData)

        print("-------------------------------------------\n")

        break

    else
        ui.showError("[!] The calculated values are completely at odds with biological reality.")
    end
end
