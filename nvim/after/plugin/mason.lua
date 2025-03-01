require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = { "lua_ls", "clangd", "gopls", "rust_analyzer", "bashls", "lemminx", "pyright", "omnisharp" },
})
local lspconfig = require("lspconfig")
lspconfig.lua_ls.setup({})
lspconfig.clangd.setup({})
lspconfig.gopls.setup({})
lspconfig.ts_ls.setup({})
lspconfig.html.setup({})
lspconfig.pyright.setup({})
lspconfig.omnisharp.setup({
  cmd = { "omnisharp" }, -- Adjust path if omnisharp is not installed globally
})
require("flutter-tools").setup({}) -- use defaults

require("md-pdf").setup()          -- default options, or
require("md-pdf").setup({
  --- Set margins around document
  margins = "1.5cm",
  -- tango, pygments are quite nice for white on white
  highlight = "tango",
  -- Generate a table of contents, on by default
  toc = true,
  -- Define a custom preview command, enabling hooks and other custom logic
  preview_cmd = function()
    return "firefox"
  end,
  -- if true, then the markdown file is continuously converted on each write, even if the
  -- file viewer closed, e.g., firefox is "closed" once the document is opened in it.
  ignore_viewer_state = false,
  -- Specify font, `nil` uses the default font of the theme
  fonts = nil,
  -- or, where all or only some options can be specified. NOTE: those that are `nil` can be left
  -- out completely
  fonts = {
    main_font = nil,
    sans_font = "DejaVuSans",
    mono_font = "IosevkaTerm Nerd Font Mono",
    math_font = nil,
  },
  -- Custom options passed to `pandoc` CLI call, can be ignored for setup
  pandoc_user_args = nil,
  -- or
  pandoc_user_args = {
    -- short
    "-V KEY[:VALUE]",
    -- long options
    "--standalone=[true|false]",
  },
  --- Path to output. Needs to be always relative, e.g.: "./", "../", "./out" or simply "out", but
  --- not absolute e.g.: "/"!
  output_path = "",
})

lspconfig.lemminx.setup({
  on_attach = function(client, bufnr)
    -- Enable auto-formatting for XML files (including `.drawio`)
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_command([[augroup Format]])
      vim.api.nvim_command([[autocmd! * <buffer>]])
      vim.api.nvim_command([[autocmd BufWritePre <buffer> lua vim.lsp.buf.format()]])
      vim.api.nvim_command([[augroup END]])
    end
  end,
})
