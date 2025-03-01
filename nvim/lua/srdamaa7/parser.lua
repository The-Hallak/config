local M = {}

-- Function to read file and parse content
function M.readFileAndParse(filePath)
    local file = io.open(filePath, "r")
    if not file then
        print("Error: Unable to open file.")
        return nil
    end

    local parsedData = {}
    local currentKey = nil
    local currentText = {}

    for line in file:lines() do
        if line == "$$$" then
            if currentKey then
                parsedData[currentKey] = table.concat(currentText, "\n")
            end
            currentKey = nil
            currentText = {}
        elseif not currentKey then
            currentKey = line
        else
            table.insert(currentText, line)
        end
    end

    if currentKey then
        parsedData[currentKey] = table.concat(currentText, "\n")
    end

    file:close()
    return parsedData
end

return M

