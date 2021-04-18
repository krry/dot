-- meta-accessor aliases --
-- thanks to https://icyphox.sh/blog/nvim-lua/ --
local o = vim.o
local wo = vim.wo
local bo = vim.bo

-- local scopes = {o = vim.o, b = vim.bo, w = vim.wo}

-- local function opt(scope, key, value)
--   scopes[scope][key] = value
--   if scope ~= 'o' then scopes['o'][key] = value end
-- end

-- global options
o.clipboard = 'unnamed,unnamedplus'
o.completeopt = 'menuone,noinsert,noselect'  -- Completion options (for deoplete)
o.dir = '/tmp'
o.hidden = true                              -- Enable modified buffers in background
o.hlsearch = true
o.ignorecase = true                          -- Ignore case
o.incsearch = true
o.joinspaces = false                         -- No double spaces with join after a dot
o.laststatus = 2
o.scrolloff = 12
o.scrolloff = 4                              -- Lines of context
o.shiftround = true                          -- Round indent
o.sidescrolloff = 8                          -- Columns of context
o.smartcase = true                           -- Don't ignore case with capitals
o.splitbelow = true                          -- Put new windows below current
o.splitright = true                          -- Put new windows right of current
o.swapfile = true
o.termguicolors = true                       -- True color support
o.wildmode = 'list:longest'                  -- Command-line completion mode

-- window-local options
wo.list = true                                -- Show some invisible characters (tabs...)
wo.number = false                              -- Print line number
wo.relativenumber = true                      -- Relative line numbers
wo.wrap = false                               -- Disable line wrap

-- buffer-local options
bo.expandtab = false                          -- Use spaces instead of tabs
bo.shiftwidth = indent                        -- Size of an indent
bo.smartindent = true                         -- Insert indents automatically
bo.tabstop = indent                           -- Number of spaces tabs count for
