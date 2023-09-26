-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

if vim.g.neovide then
  -- setup neovide
  -- stylua: ignore
  -- vim.opt.guifont = "Iosevka Nerd Font Mono:h16"
  vim.opt.guifont = "Iosevka SS05:h16"
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_animate_in_insert_mode = 0
  vim.g.neovide_cursor_animate_command_line = 0
  vim.g.neovide_cursor_trail_size = 0.3
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    enable = false,
    signs = false,
    update_in_insert = false,
  }
)

-- Makeshift auto-complete
vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Disable diagnostics
vim.diagnostic.disable()

require('lazy').setup({
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = "legacy", opts = {} },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      local nls = require("null-ls")
      local h = require("null-ls.helpers")

      local blackd = {
        name = "blackd",
        method = nls.methods.FORMATTING,
        filetypes = { "python" },
        generator = h.formatter_factory({
          command = "blackd-client",
          to_stdin = true,
        }),
      }
      local sources = { nls.builtins.formatting.prettierd, blackd }
      return { sources = sources }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSUpdateSync" },
    opts = {
      highlight = { enable = true },
      indent = { enable = false },
      ensure_installed = {
        "bash",
        "c",
        "go",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "luadoc",
        "luap",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
    },
    config = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require("nvim-treesitter.configs").setup(opts)
    end
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    -- enabled = false,
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      -- 'L3MON4D3/LuaSnip',
      -- 'saadparwaiz1/cmp_luasnip',
      'dcampos/nvim-snippy',
      'dcampos/cmp-snippy',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',
    },
  },

  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_b = { 'branch', 'diff' },
        lualine_c = {
          { 'filename', path = 1 }
        },
        lualine_x = {}
      }
    },
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  {
    -- Fzf
    'ibhagwan/fzf-lua',
    branch = 'main',
    opts = {
      "default",
    }
  },

  {
    "kylechui/nvim-surround",
    opts = {}
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {}
  },

  -- Colorscheme
  {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
  },
  {
    'ribru17/bamboo.nvim',
    lazy = false,
    priority = 1000,
  },
  {
    'blazkowolf/gruber-darker.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      italic = {
        strings = false,
        comments = false,
        operators = false,
        folds = false,
      }
    }
  },
  {
    'aktersnurra/no-clown-fiesta.nvim',
    lazy = false,
    priority = 1000,
  }
  -- {
  --   'blazkowolf/gruber-darker.nvim',
  --   lazy = false,
  --   opts = {
  --     italic = {
  --       strings = false,
  --       operators = false,
  --     }
  --   },
  --   priority = 1000,
  -- }
})

-- [[ Colorscheme ]]
vim.g.sonokai_style = 'andromeda'
vim.g.sonokai_better_performance = 1
vim.cmd.colorscheme('no-clown-fiesta')
vim.cmd("hi CurSearch guifg=#ffa557 guibg=#984936 gui=bold")
vim.cmd("hi Search guifg=#e1e1e1 guibg=#984936 gui=bold")
vim.cmd("hi LineNr guifg=#727272")
vim.cmd("hi CursorLine guibg=#373737")
-- vim.cmd.colorscheme('minimal-base16')
vim.o.cursorline = true
-- vim.cmd.colorscheme("gruber-darker")
-- Override line number color
-- vim.cmd("hi LineNr guifg=Grey")

-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!
vim.o.smartcase = true

-- Set highlight on search
vim.o.hlsearch = true

-- Relative line numbers + actual line number
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable mouse mode	
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
-- vim.o.breakindent = true

-- Indent
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- TODO: this is only for initial buffer...
vim.cmd("set ai")
vim.cmd("set smartindent")

-- Save undo history
vim.o.undofile = true

-- True color
vim.o.termguicolors = true

-- Block cursor always
vim.o.guicursor = "n-v-c-i:block"

-- Proper contrast for block cursor
-- vim.api.nvim_set_hl(0, "Cursor", { fg = "white", bg = "black" })

-- [[ Basic Keymaps ]]
-- Not lazily loaded! Keymaps that should be lazy loaded should go under require('lazy').setup({...})
-- under their individual plugin sections.

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { silent = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { silent = true })

vim.keymap.set("n", "<C-l>", "<cmd>wincmd l<cr>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>wincmd k<cr>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>wincmd j<cr>", { silent = true })
vim.keymap.set("n", "<C-h>", "<cmd>wincmd h<cr>", { silent = true })

-- Auto session save and restore, just in case of e.g. LSP crashes
function saveSession()
  vim.cmd("mks! ~/.config/nvim/session/session.vim")
  vim.cmd("echo 'Saved session'")
end

function restoreSession()
  vim.cmd("source ~/.config/nvim/session/session.vim")
  vim.cmd("echo 'Restored session'")
end

vim.keymap.set("n", "<leader>ms", saveSession)
vim.keymap.set("n", "<leader>mr", restoreSession)

-- Replace current word on current line
vim.keymap.set("n", "<leader>rw", function()
  local cword = vim.fn.expand("<cword>")
  local curpos = vim.fn.getcurpos()
  vim.ui.input({ prompt = string.format('Replace %s with: ', cword) }, function(input)
    if input then
      vim.cmd(string.format(".s/%s/%s/g", cword, input))
    end
    vim.fn.setpos(".", curpos)
  end)
end, { silent = true })

-- Replace current WORD on current line
vim.keymap.set("n", "<leader>rW", function()
  local cword = vim.fn.expand("<cWORD>")
  local curpos = vim.fn.getcurpos()
  vim.ui.input({ prompt = string.format('Replace %s with: ', cword) }, function(input)
    if input then
      vim.cmd(string.format(".s/%s/%s/g", cword, input))
    end
    vim.fn.setpos(".", curpos)
  end)
end, { silent = true })

-- Fzf keymaps
vim.keymap.set("n", "<leader>f", "<cmd> lua require('fzf-lua').files()<cr>", { silent = true })
vim.keymap.set("n", "<leader>b", "<cmd> lua require('fzf-lua').buffers()<cr>", { silent = true })
vim.keymap.set("n", "<leader>'", "<cmd> lua require('fzf-lua').resume()<cr>", { silent = true })
vim.keymap.set("n", "<leader>/", "<cmd> lua require('fzf-lua').live_grep_glob()<cr>", { silent = true })
vim.keymap.set("n", "<leader>l", "<cmd> lua require('fzf-lua').blines()<cr>", { silent = true })
vim.keymap.set("n", "gw", function() require('fzf-lua').grep_curbuf({ search = vim.fn.expand("<cword>") }) end,
  { silent = true })
vim.keymap.set("n", "<leader>gw", "<cmd> lua require('fzf-lua').grep_cword()<cr>", { silent = true })
vim.keymap.set("n", "<leader>gW", "<cmd> lua require('fzf-lua').grep_cWORD()<cr>", { silent = true })
vim.keymap.set("n", "<leader>oc", function() require('fzf-lua').files({ cwd = '~/.config/nvim' }) end, { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>gv", "<cmd> lua require('fzf-lua').grep_visual()<cr>", { silent = true })

-- Clear highlight
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch", silent = true })

-- save file
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- [[ Autocmds ]]

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ "VimResized" }, {
  group = vim.api.nvim_create_augroup("resize_splits", { clear = true }),
  callback = function()
    vim.cmd("tabdo wincmd =")
  end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
  group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- [[ LSP ]]
--
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('fzf-lua').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>s', require('fzf-lua').lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>S', require('fzf-lua').lsp_live_workspace_symbols, '[W]orkspace [S]ymbols')
  nmap('<leader>e', require('fzf-lua').diagnostics_document, '[E]rrors')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })

  -- Autoformat
  -- Used when formatter is baked into LSP instead of another tool, which would use null-ls instead
  vim.api.nvim_create_autocmd("BufWritePre", {
    group = vim.api.nvim_create_augroup("LspFormatting", {}),
    callback = function()
      vim.lsp.buf.format()
    end,
  })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
local servers = {
  clangd = {
    cmd = { "/usr/bin/clangd" },
  },
  intelephense = {},
  -- gopls = {},
  pyright = {
    analysis = {
      diagnosticMode = "openFilesOnly",
    },
  },
  rust_analyzer = {
    checkOnSave = false,
  },
  tsserver = {},

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities( --[[  ]])
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}

-- Not sure why options not being applied
require('lspconfig').rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = false
    }
  }
}

-- [[ Configure null-ls ]]
-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
local nls = require 'null-ls'
nls.setup {
  -- you can reuse a shared lspconfig on_attach callback here
  on_attach = function(_, _)
    -- if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = "LspFormatting" })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("LspFormatting", {}),
      callback = vim.lsp.buf.format,
    })
    -- end
  end,
}

-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
-- local luasnip = require 'luasnip'
-- luasnip.config.setup {}
local snippy = require('snippy')
snippy.setup {}
local MIN_LABEL_WIDTH = 20
local MAX_LABEL_WIDTH = 40
local ELLIPSIS_CHAR = '...'

cmp.setup {
  completion = {
    keyword_length = 3,
  },
  formatting = {
    format = function(entry, vim_item)
      local label = vim_item.abbr
      local truncated_label = vim.fn.strcharpart(label, 0, MAX_LABEL_WIDTH)
      if truncated_label ~= label then
        vim_item.abbr = truncated_label .. ELLIPSIS_CHAR
      elseif string.len(label) < MIN_LABEL_WIDTH then
        local padding = string.rep(' ', MIN_LABEL_WIDTH - string.len(label))
        vim_item.abbr = label .. padding
      end
      return vim_item
    end,
  },
  -- snippet = {
  --   expand = function(args)
  --     luasnip.lsp_expand(args.body)
  --   end,
  -- },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      require('snippy').expand_snippet(args.body) -- For `snippy` users.
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif snippy.can_expand_or_advance() then
        snippy.expand_or_advance()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
        -- elseif luasnip.locally_jumpable(-1) then
        --   luasnip.jump(-1)
      elseif snippy.can_jump(-1) then
        snippy.previous()
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  -- performance = {
  --   debounce = 300,
  --   throttle = 300,
  --   fetching_timeout = 80,
  --   max_view_entries = 20,
  -- },
  sources = {
    { name = 'nvim_lsp', max_item_count = 10 },
    { name = 'snippy' }
    -- { name = 'luasnip' },
  },
}
