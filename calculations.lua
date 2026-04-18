-- CALCULATIONS.LUA
local colors = require("colors")
local M = {}

-- Loads BMI classification data from CSV file
function M.loadTable(path, searchAge)
    local archive = io.open(path, "r")

    -- If CSV file cannot be opened
    if not archive then
        print("Error: File not found at ".. path)
        return nil
    end

    for line in archive:lines() do
        local columns = {}

        -- Split CSV line by commas and parse values
        for value in line:gmatch("([^,]+)") do
            table.insert(columns, tonumber(value) or value)
        end

        local age = searchAge
        
        if searchAge > 20 then
            age = 20
        elseif searchAge < 0 then
            print(colors.RED .. "[!] Age should not be seen as something negative!" .. colors.RESET)
            os.exit()
        elseif searchAge < 2 then
            age = 2
        end

        -- Check if current row matches the search age
        if columns[1] == age then
            archive:close()

            -- Build and return the classification table
            return {
                minNormal = columns[2],
                maxNormal = columns[3],
                obesityI = columns[4],
                obesityII = columns[5]
            }
        end
    end

    archive:close()
    return nil -- Age not found in table
end

-- Calculates BMI and displays ideal weight range
function M.calculateBMI(weight, height, dataTable)
    -- Formula: BMI = weight / (height in meters)²
    local heightSquared = height * height
    local bmi = weight / heightSquared

    -- Calculate ideal weight range based on normal BMI thresholds
    local idealWeightMax = dataTable.maxNormal * heightSquared
    local idealWeightMin = dataTable.minNormal * heightSquared

    -- Check if the values ​​exceed what is possible.
    if (bmi < 8 or bmi > 150) or (idealWeightMin <= 0 or idealWeightMax > 250) then
        print(colors.RED .. "[!] The calculated values are completely at odds with biological reality." .. colors.RESET)
        os.exit()
    end

    print(string.format("Your BMI is %.2f", bmi))
    print(string.format(colors.CYAN .."Ideal weight between %.2f kg and %.2f kg.".. colors.RESET, idealWeightMin, idealWeightMax))

    return bmi
end

-- Classifies BMI into categories and displays the result
function M.classifyBMI(bmi, dataTable)
    if bmi < dataTable.minNormal then
        print(colors.YELLOW .."Underweight.".. colors.RESET)
    elseif bmi < dataTable.maxNormal then
        print(colors.GREEN .."Normal weight.".. colors.RESET)
    elseif bmi < dataTable.obesityI then
        print(colors.YELLOW.. "Obesity I.".. colors.RESET)
    elseif bmi < dataTable.obesityII then
        print(colors.BOLD .. colors.YELLOW .."Obesity II.".. colors.RESET)
    else
        print(colors.BOLD .. colors.RED .."Obesity III.".. colors.RESET)
    end
end

return M
