vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>l", "<C-w>w")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "oo", "o<Esc>k")
vim.keymap.set("n", "OO", "O<Esc>j")
vim.keymap.set("n", "<leader>i", function()
  require("srdamaa7.myFunction").insertText(vim.fn.input("name > "))
end)
vim.keymap.set("n", "<leader>A", "ggVG")

vim.keymap.set("n", "<leader>vwm", function()
  require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
  require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader><leader>", function()
  vim.cmd("so")
end)

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<C-p>pf", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

--open terminal
vim.api.nvim_set_keymap("n", "<Leader>t", ":vsplit | wincmd l | terminal<CR>", { noremap = true, silent = true })

-- Automatically enter insert mode when opening a terminal
vim.cmd([[
  autocmd TermOpen * startinsert
]])

vim.api.nvim_set_keymap("t", "<C-[>", [[<C-\><C-n>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n','<leader>T',':terminal cf test<CR>',{ noremap = true, silent = true })

function _G.cf_test()
  local file_dir = vim.fn.expand("%:p:h")
  local command = string.format(":lcd %s | :terminal cf test", file_dir)
  vim.cmd(command)
end

vim.api.nvim_set_keymap("n", "<leader>T", ":lua cf_test()<CR>", { noremap = true, silent = true })

function _G.cf_submit()
  local file_dir = vim.fn.expand("%:p:h")
  local command = string.format(":lcd %s | :terminal cf submit", file_dir)
  vim.cmd(command)
end

vim.api.nvim_set_keymap("n", "<leader>S", ":lua cf_submit()<CR>", { noremap = true, silent = true })
------

vim.keymap.set("n", "<leader>,", function()
  require("md-pdf").convert_md_to_pdf()
end)
vim.keymap.set("n", "<leader>e", function()
  vim.diagnostic.open_float(0, { scope = "line" })
end, { desc = "Show line diagnostics" })

local harpoon_mark = require("harpoon.mark")
local harpoon_ui = require("harpoon.ui")

-- Key mappings for Harpoon
vim.keymap.set("n", "<leader>ha", harpoon_mark.add_file, { desc = "Add file to Harpoon" })
vim.keymap.set("n", "<leader>hm", harpoon_ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" })

-- Quick navigation to Harpoon marks
vim.keymap.set("n", "<leader>h1", function()
  harpoon_ui.nav_file(1)
end, { desc = "Go to Harpoon mark 1" })
vim.keymap.set("n", "<leader>h2", function()
  harpoon_ui.nav_file(2)
end, { desc = "Go to Harpoon mark 2" })
vim.keymap.set("n", "<leader>h3", function()
  harpoon_ui.nav_file(3)
end, { desc = "Go to Harpoon mark 3" })
vim.keymap.set("n", "<leader>h4", function()
  harpoon_ui.nav_file(4)
end, { desc = "Go to Harpoon mark 4" })
