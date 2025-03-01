local M={}
local parser=require("srdamaa7.parser")
-- Function to split string into lines
local function splitStringIntoLines(str)
  local lines = {}
  for line in str:gmatch("([^\n]*)\n?") do
    table.insert(lines, line)
  end
  return lines
end

-- Dummy function to get text based on name
local function getTextByName(name)
  -- Replace this with actual logic to find text
  local texts=parser.readFileAndParse("/home/srdamaa7/.config/nvim/lua/srdamaa7/myFuncs.txt")
  if(texts)then
    return texts[name] or "Text not found"
  end
  return "Text not found"
end

-- Function to insert text at cursor position
function M.insertText(name)
  local text = getTextByName(name)
  local lines = splitStringIntoLines(text)
  local bufnr = vim.api.nvim_get_current_buf()
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))

  -- Handling the first line
  local current_line = vim.api.nvim_buf_get_lines(bufnr, row - 1, row, false)[1]
  lines[1] = current_line:sub(1, col) .. lines[1]
  lines[#lines] = lines[#lines] .. current_line:sub(col + 1)

  -- Insert the lines into the buffer
  vim.api.nvim_buf_set_lines(bufnr, row - 1, row, false, lines)
end

return M

