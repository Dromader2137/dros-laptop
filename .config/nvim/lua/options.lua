vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.scrolloff = 5

vim.wo.nu = true
vim.wo.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.nvim/"
vim.opt.undofile = true

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4


vim.cmd("colorscheme gruvbox")
vim.cmd[[set signcolumn=no]]
vim.cmd[[set nowrap]]
