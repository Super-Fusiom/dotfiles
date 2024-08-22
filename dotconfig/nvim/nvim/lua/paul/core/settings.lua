local setting = vim.o

vim.cmd([[
  highlight Normal guibg=none
  highlight NonText guibg=none
  highlight Normal ctermbg=none
  highlight NonText ctermbg=none
]])
vim.opt.clipboard = "unnamedplus"
-- Tab and indentaion
setting.expandtab = true
setting.smartindent = true
setting.tabstop = 2
setting.shiftwidth = 2

setting.wrap = false

-- search
setting.ignorecase = true
setting.smartcase = true

setting.cursorline = true

setting.number = true

setting.termguicolors = true
setting.background = "dark"
setting.signcolumn = "yes"
