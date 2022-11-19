call plug#begin('~/.vim/plugged')

" Colorschemes
"Plug 'projekt0n/github-nvim-theme'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'EdenEast/nightfox.nvim'
Plug 'haishanh/night-owl.vim'
Plug 'bluz71/vim-nightfly-guicolors'
Plug 'ayu-theme/ayu-vim'
Plug 'mcchrish/zenbones.nvim'
Plug 'rktjmp/lush.nvim'
Plug 'cideM/yui'
Plug 'owickstrom/vim-colors-paramount'
Plug 'agudulin/vim-colors-alabaster'
Plug 'p00f/alabaster_dark.nvim'
Plug 'andreypopp/vim-colors-plain'
Plug 'robertmeta/nofrils'
Plug 'axvr/photon.vim'
Plug 'romainl/Apprentice'
Plug 'adigitoleo/vim-mellow', { 'tag': '*' }
Plug 'shaunsingh/nord.nvim'
Plug 'RRethy/nvim-base16'
Plug 'rose-pine/neovim'
Plug 'cocopon/iceberg.vim'
Plug 'mhartington/oceanic-next'
Plug 'sainnhe/sonokai'
Plug 'sainnhe/everforest'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'NTBBloodbath/doom-one.nvim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'AhmedAbdulrahman/aylin.vim', { 'branch': '0.5-nvim' }
Plug 'Yazeed1s/minimal.nvim'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'ziglang/zig.vim'
Plug 'zah/nim.vim'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'

" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'

" See hrsh7th's other plugins for more completion sources!

" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" Fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'
" Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-orgmode/orgmode'
Plug 'nvim-telescope/telescope-smart-history.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-project.nvim'

" sqlite
Plug 'kkharji/sqlite.lua'

" Brackets
Plug 'jiangmiao/auto-pairs'
Plug 'luochen1990/rainbow'
Plug 'kylechui/nvim-surround'

" Indent lines
Plug 'lukas-reineke/indent-blankline.nvim'

" Navigation
Plug 'ggandor/lightspeed.nvim'

" Statusbar
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'psf/black', { 'branch': 'stable' }

" Markdown/writing-related
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'ekickx/clipboard-image.nvim'
Plug 'Pocco81/true-zen.nvim'
call plug#end()

lua << EOF
	require("true-zen").setup {
		-- your config goes here
		-- or just leave it empty :)
        modes = {
            ataraxis = {
                padding = {
                    left = 35,
                    right = 35,
                }
            }
        },
        -- hide() function not working for some reason
        -- integrations = {
        --     lualine = true,
        -- }
	}

    require("clipboard-image").setup {
        default = {
            img_dir = {"%:p:h", "img"}
        }
    }
EOF

if exists('g:neovide')
    "set guifont=Iosevka\ Nerd\ Font\ Mono:h14
    set guifont=CozetteVector:h15
    "set guifont=Fira\ Code:h13
    "set guifont=Liga\ SFMono\ Nerd\ Font:h14
    "set guifont=Iosevka\ Fixed\ SS04:h14
    "default is 0.06 in https://github.com/neovide/neovide/blob/main/src/renderer/cursor_renderer/mod.rs
    let g:neovide_cursor_animation_length=0.05
    let g:neovide_cursor_animate_in_insert_mode=1
    let g:neovide_cursor_animate_command_line=0
    let g:neovide_cursor_trail_size=0.3
endif

" Random lua commands
command! Scratch lua require'tools'.makeScratch()
let g:rainbow_active = 1

hi CursorLineNr guifg=#969696
set cursorline
set cursorlineopt=number
"set scrolloff=999

highlight Cursor guifg=white guibg=black
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver25-Cursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10

set number relativenumber
set rtp^="/Users/iobt/.opam/default/share/ocp-indent/vim"

if (has("termguicolors"))
    set termguicolors
endif
"set-default colorset-option -ga terminal-overrides ",xterm-256color:Tc"

syntax enable
let g:nightflyTransparent = 1
let g:nightflyItalics = 0
let g:sonokai_enable_italic = 0
let g:sonokai_disable_italic_comment = 1
let g:sonokai_style = 'andromeda'
let g:sonokai_better_performance = 1
let g:everforest_background = 'hard'
let g:everforest_better_performance  = 1

"set background=light
set background=dark
"colorscheme iceberg
colorscheme sonokai
lua << EOF
require("catppuccin").setup {
    flavour = "frappe" -- mocha, macchiato, frappe, latte
}
EOF
"colorscheme catppuccin
"" Keybindings
nnoremap <Space>h <C-w>h
nnoremap <Space>j <C-w>j
nnoremap <Space>k <C-w>k
nnoremap <Space>l <C-w>l
nnoremap <Space><Space> <C-w>w

nnoremap <D-v> "+p

nnoremap \\ <CMD>:noh<CR> 

" Open man pages
nnoremap <leader>mm :Man 

" Resize splits
noremap <C-w>+ :resize +5<CR>
noremap <C-w>- :resize -5<CR>
noremap <C-w>< :vertical:resize -5<CR>
noremap <C-w>> :vertical:resize +5<CR>
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c
" let g:rustfmt_autosave = 1
let g:zig_fmt_autosave = 0
" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration
lua <<EOF
local nvim_lsp = require'lspconfig'

local opts = {
    tools = { -- rust-tools options
        autoSetHints = false,
        hover_with_actions = true,
        inlay_hints = {
            show_parameter_hints = false,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
        },
    },

    -- all the opts to send to nvim-lspconfig
    -- these override the defaults set by rust-tools.nvim
    -- see https://github.com/neovim/nvim-spconfig/blob/master/doc/server_configurations.md#rust_analyzer
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        -- on_attach = on_attach,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                checkOnSave = {
                    enable = false
                },
            }
        }
    },
}

require('rust-tools').setup(opts)
EOF

lua <<EOF
lspconfig = require'lspconfig'
util = require'lspconfig/util'
local on_attach = function(_, bufnr)
        vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end

lspconfig.pyright.setup{}
lspconfig.tsserver.setup {
    cmd = {"typescript-language-server", "--stdio"},
    settings = {documentFormatting = false}
}
lspconfig.gopls.setup {
    cmd = {"gopls", "serve"},
    filetypes = {"go", "gomod"},
    on_attach = on_attach,
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
  }
lspconfig.sumneko_lua.setup{}

lspconfig.clangd.setup{
    on_attach = on_attach,
}

lspconfig.zls.setup{
    on_attach = on_attach,
}

lspconfig.nimls.setup{
    on_attach = on_attach,
}

lspconfig.ocamllsp.setup{
    on_attach = on_attach,
}

lspconfig.intelephense.setup{
    on_attach = on_attach,
}

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    show_current_context = true,
    show_current_context_start = true,
}
EOF

" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
lua <<EOF
local cmp = require'cmp'
cmp.setup({
  -- Enable LSP snippets
  snippet = {
    expand = function(args)
        vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    -- Add tab support
    ['<S-Tab>'] = cmp.mapping.select_prev_item(),
    ['<Tab>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    })
  },

  -- Installed sources
  sources = {
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
    { name = 'path' },
    { name = 'buffer' },
  },
})
EOF

" Exclude filenames from Ripgrep when run through fzf.vim
"command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0) 

" LSP shortcuts
nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.definition()<CR>

nnoremap <silent> ga    <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gb    <cmd>lua require'tools'.blameVirtText()<CR>

lua <<EOF
local telescope_config = require("telescope")
telescope_config.setup({
  defaults = {
    cache_picker = {
      num_pickers = 10,
    },
    history = {
      path = "~/.local/share/nvim/databases/telescope_history.sqlite3",
      limit = 100
    },
    mappings = {
      n = {
        ["<Tab>"] = require("telescope.actions").toggle_selection
      },
    },
  },
  pickers = {
    find_files = {
      find_command = fd,
      hidden = true,
    },
    live_grep = {
      only_sort_text = true
    }
  }
})

telescope_config.load_extension("fzf")
telescope_config.load_extension("smart_history")
telescope_config.load_extension("file_browser")
telescope_config.load_extension("project")
EOF


" Remapping <leader> to <Space>
nnoremap <Space> <Nop>
let mapleader=" "
nnoremap <leader>sr :source $MYVIMRC<CR>

lua <<EOF
local actions = require'fzf-lua.actions'
require("fzf-lua").setup{
    actions = {
        files = {
            ["default"]       = actions.file_edit,
            ["ctrl-s"]        = actions.file_split,
            ["ctrl-v"]        = actions.file_vsplit,
            -- ["ctrl-t"]        = actions.file_tabedit,
            ["ctrl-q"] = actions.file_sel_to_qf,
        },
    },
    fzf_opts = {
        ['--layout'] = 'reverse-list',
    },
    keymap = {
        fzf = {
            -- fzf '--bind=' options
            ["ctrl-z"]      = "abort",
            ["ctrl-u"]      = "unix-line-discard",
            ["ctrl-f"]      = "half-page-down",
            ["ctrl-b"]      = "half-page-up",
            ["ctrl-a"]      = "select-all",
            ["ctrl-d"]      = "deselect-all",
            ["ctrl-e"]      = "end-of-line",
            ["ctrl-t"]       = "toggle-all",
            -- Only valid with fzf previewers (bat/cat/git/etc)
            ["f3"]          = "toggle-preview-wrap",
            ["f4"]          = "toggle-preview",
            ["shift-down"]  = "preview-page-down",
            ["shift-up"]    = "preview-page-up",
        },
    },
    winopts = {
        preview = {
            default = 'bat_native',
            horizontal = 'right:55%',
        },
    },
}
EOF



nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <leader>rf <cmd>:e!<CR>

" Telescope/fuzzy finder settings
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fg <cmd>:Rg<cr>
"nnoremap <leader>b  <cmd>Telescope buffers<cr>
nnoremap <leader>ff <cmd>lua require'fzf-lua'.files()<CR>
nnoremap <leader>fg <cmd>lua require'fzf-lua'.grep_project()<CR>
nnoremap <leader>lg <cmd>lua require'fzf-lua'.live_grep_native()<CR>
nnoremap <leader>b  <cmd>lua require'fzf-lua'.buffers()<CR>
nnoremap <leader>sh <cmd>lua require'fzf-lua'.search_history()<CR>
nnoremap <leader>ls <cmd>lua require'fzf-lua'.lsp_document_symbols()<CR>
nnoremap <leader>lS <cmd>lua require'fzf-lua'.lsp_workspace_symbols()<CR>
nnoremap <leader>ld <cmd>lua require'fzf-lua'.lsp_document_diagnostics()<CR>
nnoremap <leader>lD <cmd>lua require'fzf-lua'.lsp_workspace_diagnostics()<CR>

nnoremap <leader>fb <cmd>Telescope file_browser<cr>

nnoremap <leader>rp  <cmd>Telescope pickers<cr>
nnoremap <leader>mp <cmd>Telescope man_pages<cr>

"nnoremap <leader>ls <cmd>Telescope lsp_document_symbols<cr>
"nnoremap <leader>lS <cmd>Telescope lsp_workspace_symbols<cr>
" nnoremap <leader>gr <cmd>Telescope lsp_references<cr>
nnoremap <leader>sb  <cmd>:w<cr>

nnoremap <leader>p <cmd>lua require'telescope'.extensions.project.project{}<cr>
" Tabs navigation
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<cr>

" Markdown
nnoremap <leader>mp <cmd>:MarkdownPreview<cr>
nnoremap <leader>zm <cmd>:TZAtaraxis<cr>

nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap n nzz

" Quickly close quickfix list
nnoremap \b :cclose<CR>

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=300

" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })
lua vim.api.nvim_command [[autocmd CursorMoved * lua require'tools'.clearBlameVirtText()]]
lua vim.api.nvim_command [[autocmd CursorMovedI * lua require'tools'.clearBlameVirtText()]]

" Goto previous/next diagnostic warning/error
nnoremap <silent> g[ <cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <silent> g] <cmd>lua vim.diagnostic.goto_next()<CR>

" have a fixed column for the diagnostics to appear in
" this removes the jitter when warnings/errors flow in
set signcolumn=yes

let g:black_quiet=1
autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 200)
augroup format_on_save_py
  autocmd!
  autocmd BufWritePre *.py Black
  " moves cursor to top of file -- not ideal
  " autocmd BufWritePre *.py %!isort -
augroup end


lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
  },
}
EOF

lua <<EOF
require'lualine'.setup{
    options = {
        icons_enabled = false,
        path = 1,
        disabled_filetypes = {
            statusline = { 'markdown' },
            tabline = { 'markdown' },
            winbar = { 'markdown' },
        },
    },
}

require'nvim-surround'.setup{
    delimiters = {
        pairs = {
            ["("] = { "(", ")" },
            [")"] = { "(", ")" },
            ["{"] = { "{", "}" },
            ["}"] = { "{", "}" },
            ["<"] = { "<", ">" },
            [">"] = { "<", ">" },
            ["["] = { "[", "]" },
            ["]"] = { "[", "]" },
        }
    } 
}
EOF

command Hex execute "%!xxd"
