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
    -- Get user input for height, weight, and age
    io.write(colors.GREEN .."Your weight (kg): ".. colors.RESET)
    weight = tonumber(io.read())

    io.write(colors.GREEN .."Your height (m): ".. colors.RESET)
    height = tonumber(io.read())

    io.write(colors.GREEN .."Your age (y): ".. colors.RESET)
    age = tonumber(io.read())

    if weight and height and age then
        break
    else
        ui.clearScreen()
        ui.printBanner()

        print(colors.RED .. "[!] Type valid numbers!" .. colors.RESET)
        print(" ")
    end
end

print(" ")

-- Load classification data and calculate BMI
local classData = calcs.loadTable(address, age)
local bmi = calcs.calculateBMI(weight, height, classData)

print("-------------------------------------------")

-- Display the BMI classification
calcs.classifyBMI(bmi, classData)

print("-------------------------------------------")
