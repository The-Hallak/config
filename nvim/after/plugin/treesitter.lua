local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {"lua","c","cpp","go","rust","bash","java","javascript","html","vim"},
  highlight = { enable = true },
  indent = { enable = true },
})

