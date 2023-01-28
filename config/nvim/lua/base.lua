vim.cmd('autocmd!');

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true
vim.opt.title = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.backupskip = '/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.relativenumber = true
vim.opt.swapfile = false

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
-- vim.api.nvim_create_autocmd("InsertLeave", {
--  pattern = '*',
--  command = "set nopaste"
-- })

-- Sensible comment wrapping behavior
vim.cmd [[autocmd FileType * setlocal formatoptions-=cro]]

-- Spell check and wrap on md files
vim.cmd [[autocmd BufRead,BufNewFile *.md setlocal spell]]
vim.cmd [[autocmd BufRead,BufNewFile *.md setlocal wrap]]

vim.g.loaded_perl_provider = 0
