"settings {{{
    set autoindent          "always set autoindenting on
    set autoread
    set bs=2 	            "backspace behavior
    set clipboard=unnamed   "Merge vim and OSX clipboards
    "set completeopt=longest,menuone
	set completeopt=noinsert,menuone,noselect "ncm2 wants this one instead?
    set copyindent          "copy the previous indentation on autoindenting
    set encoding=UTF8       "vim-devicons needs this
    set expandtab           "insert spaces instead of tabs
    set foldenable
    set foldmethod=marker   "fold markers (triple brakcets)
    set hidden              "allow hidden buffers
    set history=1000        "remember more commands and search history
    set hlsearch            "highlight search terms
    set ignorecase          "ignore case when searching
    set incsearch           "show search matches as you type
    set mouse=a             "mouse in vim
    set noautochdir         "dont change dir upon opening a file
    set nobackup
    set nocompatible
    set noerrorbells        "don't beep
	set nopaste				"disable INSERT (paste) mode
    set noswapfile
    set nowrap              "turn off line wrapping
    set nofixendofline      "disable line feed insertion at end of files
    set number              "show current line number
    set relativenumber      "show relative line numbers
    set shiftround          "round indent to a multiple of 'shiftwidth'
    set shiftwidth=4        "number of spaces to use for indent and unindent
	set shortmess+=c        "suppress annoying pattern not found messages
    set showtabline=2       "show tab line at the top
    set smarttab 	        "tab respects tabstop shiftwidth and softtabstop
    set so=4                "Scroll ahead of the cursor
    set softtabstop=4       "edit as if the tabs are 4 characters wide
    set tabstop=4 	        "visible width of tabs
    set textwidth=120       "automaticlaly add newlines for text longer than 120 cols
    set title               "change the terminal's title
    set undodir=~/.vim/undodir "undo directory
    set undofile            "persistent undo
    set undolevels=1000     "use many muchos levels of undo
    set updatetime=750      "speed up gitgutter
    set visualbell          "don't beep
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules "CtrlP
    set wildmenu            "enhanced command line completion
    set wildmode=list:longest " complete files like a shell
"}}}

"plugins {{{
    " let g:python_host_prog = '/Users/andrew/.pyenv/versions/neovim2/bin/python'
    " let g:python3_host_prog = '/Users/andrew/.pyenv/versions/neovim3/bin/python'

    call plug#begin()


    Plug 'airblade/vim-gitgutter'           "git status in the gutter
    Plug 'artemave/spec-index.vim'          "test outline
    " Plug 'autozimu/LanguageClient-neovim', {
        " \ 'branch': 'next',
        " \ 'do': 'bash install.sh',
        " \ }                                 "javascript intellisense
    Plug 'ctrlpvim/ctrlp.vim'               "fuzzy file search
    Plug 'fatih/vim-go'                     "go vim tools
    Plug 'galooshi/vim-import-js'           "js import manager
    Plug 'geekjuice/vim-mocha'              "run mocha tests in vim
    "Plug 'haron-prime/evening_vim'          "colorscheme with better diff
    Plug 'heavenshell/vim-jsdoc'            "jsdoc function comments
    " Plug 'itchyny/lightline.vim'            "pretty statusbar and tabbar
    "Plug 'joshdick/onedark.vim'             "colorscheme
    Plug 'junegunn/fzf.vim'                 "fuzzy file search
    Plug 'kannokanno/previm'                "markdown preview
    Plug 'leafgarland/typescript-vim'       "typescript syntax
    Plug 'majutsushi/tagbar'                "code outline sidebar
    " Plug 'mgee/lightline-bufferline'        "tabline buffers for lightline

    Plug 'HerringtonDarkholme/yats.vim'     "for nvim-typescript

    " A bug makes this plugin unusable: https://github.com/mhartington/nvim-typescript/issues/267
    " Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
    Plug 'Shougo/denite.nvim'               "denite features for nvim-typescript
    Plug 'Shougo/deoplete.nvim'             "async completion for nvim-typescript

    Plug 'mileszs/ack.vim'                  "fuzzy file content search
    Plug 'moll/vim-bbye'                    "close
    Plug 'morhetz/gruvbox'                  "colorscheme
    Plug 'millermedeiros/vim-esformatter'   "alternate js formatter
    Plug 'mxw/vim-jsx'                      "jsx syntax highlighting
    Plug 'mustache/vim-mustache-handlebars' "mustache handlebars syntax
    Plug 'ncm2/ncm2'                        "better than <C-X><C-O>
	Plug 'ncm2/ncm2-path'                   "path completion
    Plug 'othree/yajs.vim'                  "javascript syntax
    Plug 'Quramy/tsuquyomi'                 "typescript goodness
    Plug 'ryanoasis/vim-devicons'           "icons next to filenames
    Plug 'tell-k/vim-autopep8'              "python formatter
    Plug 'tpope/vim-dispatch'               "let ack run independently
    Plug 'tpope/vim-fugitive'               "git inside vim
    Plug 'tpope/vim-repeat'                 "make more mappings repeatable with .
    Plug 'tpope/vim-rhubarb'                "github integration
    Plug 'tpope/vim-surround'               "ysiw' to wrap in '
    Plug 'tpope/vim-unimpaired'             "mappings like ]q [q for :cnext :cpref
    Plug 'roxma/nvim-yarp'                  "requirement of ncm2
    Plug 'scrooloose/nerdcommenter'         "jsdoc comment blocks
    Plug 'scrooloose/nerdtree', {
        \ 'on': ['NERDTreeToggle',
        \        'NERDTreeFind']
        \ }                                 "file browser sidebar
    " Plug 'shinchu/lightline-gruvbox.vim'    "gruvbox theme for lightline
    Plug 'SirVer/ultisnips'                 "snippets
    Plug 'vim-scripts/BufOnly.vim'          "close all other buffers
    " Plug 'vim-airline/vim-airline'          "pretty status bar and tabbar
    " Plug 'vim-airline/vim-airline-themes'
    " Plug 'w0rp/ale'                         "linter/auto formatter
    " Plug 'xavierchow/vim-swagger-preview'   "OpenAPI spec previewer
    call plug#end()
"}}}

" functions {{{
    function! QuickfixToggle()
        let nr = winnr("$")
        copen 10
        let nr2 = winnr("$")
        if nr == nr2
            cclose 10
        endif
    endfunction

    "==============================================================================
    " wipeout.vim - Destroy all buffers that are not open in any tabs or windows.
    " https://www.vim.org/scripts/script.php?script_id=4882
    "
    " Adapted from the following StackOverflow answer:
    " http://stackoverflow.com/questions/1534835
    "
    " Author: Artem Nezvigin <artem@artnez.com>
    "==============================================================================
    command! -bang Wipeout :call Wipeout(<bang>0)
    function! Wipeout(bang)
    " figure out which buffers are visible in any tab
    let visible = {}
    for t in range(1, tabpagenr('$'))
        for b in tabpagebuflist(t)
        let visible[b] = 1
        endfor
    endfor
    " close any buffer that are loaded and not visible
    let l:tally = 0
    let l:cmd = 'bw'
    if a:bang
        let l:cmd .= '!'
    endif
    for b in range(1, bufnr('$'))
        if buflisted(b) && !has_key(visible, b)
        let l:tally += 1
        exe l:cmd . ' ' . b
        endif
    endfor
    echon "Deleted " . l:tally . " buffers"
    endfun
"}}}

"mappings {{{
    "map leader for more commands
    let mapleader = ','
    let maplocalleader = ','
    let g:mapleader = ','

    "artemave/spec-index.vim
    nnoremap <Leader>si :ShowSpecIndex<cr>

    "moll/vim-bbye close buffer without closing window
    nnoremap <leader>w :Bdelete<cr>

    "scrooloose/nerdcommenter
    noremap <leader>/ :call NERDComment(0,"toggle")<CR>

    "vim-scripts/BufOnly.vim
    " nmap <silent><leader>W :%bd|e#<CR>
    " nmap <silent><leader>W :%bd|e<CR>

    " save
    nmap <leader>, :w<cr>
    inoremap <leader>, <Esc>:w<cr>

    "quickly edit/reload the vimrc file
    nmap <silent> <leader>cv :tabe $MYVIMRC<cr>
    nmap <silent> <leader>sv :so $MYVIMRC<cr>
    nmap <silent> <leader>pi :so $MYVIMRC<cr>:PlugInstall<cr>

    "vim swagger preview
    " nmap <unique> <leader>sp <Plug>GenerateDiagram

    "toggle and grow quickfix
    noremap <leader>q :copen 40<cr>
    noremap <leader>a :copen 10<cr>
    noremap <leader>z :call QuickfixToggle()<cr>

    "toggle and grow loclist
    noremap <leader>e :lopen 40<cr>
    noremap <leader>d :lopen 10<cr>
    noremap <leader>x :lclose<cr>

    " delete and visual replace without replacing clipboard
    vnoremap p "_dP
    " nnoremap <leader>d "_d
    " vnoremap <leader>d "_d

    " leader to get the default vim delete and replace behavior
    vnoremap <leader>p p

    "cusor behave with wrapped lines
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk

    " Buffer navigation
    nnoremap <Tab> :bnext<CR>
    nnoremap <S-Tab> :bprevious<CR>

    " Tab navigation (iterm)
    nnoremap <Alt+1> 1gt
    nnoremap <Alt+2> 2gt

    " Tab navigation (alacritty)
    nnoremap “ :tabprevious<CR>
    nnoremap ‘ :tabnext<CR>
    nnoremap ¡ 1gt
    nnoremap ™ 2gt
    nnoremap £ 3gt
    nnoremap ¢ 4gt
    nnoremap ∞ 5gt
    nnoremap § 6gt
    nnoremap ¶ 7gt
    nnoremap • 8gt
    nnoremap ª 9gt

    "popup menu navigation
    inoremap <expr><TAB> pumvisible() ? "\<C-n>": "\<TAB>"
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>": "\<S-TAB>"
    "inoremap <expr><C-j> pumvisible() ? "\<C-N>" : "\<C-j>"
    "inoremap <expr><C-k> pumvisible() ? "\<C-P>" : "\<C-k>"

    "enter to clear search highlight
    nnoremap <CR> :noh<CR><CR>

    " scroll the viewport faster
    nnoremap <C-e> 3<C-e>
    nnoremap <C-y> 3<C-y>

    " Automatically wrap descriptions in git commits
    autocmd FileType gitcommit set textwidth=72

    " Turn wrapping on for markdown and text
    autocmd FileType markdown,text set wrap
    autocmd FileType markdown,text set linebreak

    " Turn textwidth off for markdown and text
    autocmd FileType markdown,text set textwidth=0

    " Set quickfix filetype default
    augroup quickfix
        autocmd!
        autocmd FileType qf setlocal wrap
        autocmd FileType qf setlocal nospell
    augroup END

    " Set filetype to text by defailt
    autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif

    " Turn off spellcheck for certain file types
    " For some reason this doesn't work I have no idea why, so I have the
    " BufEnter shit instead
    " autocmd FileType yaml setlocal nospell
    autocmd BufEnter *.yml setlocal nospell
    autocmd BufEnter *.yaml setlocal nospell

    " Format JSON
    nmap <leader>jf :%!python -m json.tool<cr>

    " Reload syntax
    noremap <leader>rs :syntax sync fromstart<cr>

    " make Ctrl-C behave like Esc
    inoremap <C-C> <Esc>
    " disable escape
    inoremap <Esc> <Nop>

    " exit insert mode
    inoremap <C-L> <Nop>
    " inoremap <C-K> <Esc>
    " inoremap ;; <Esc>
    " vnoremap <C-L> <Esc>
    " vnoremap <C-K> <Esc>

    " nnoremap <C-w><C-h> :vertical resize +5<cr>
    " nnoremap <C-w><C-l> :vertical resize -5<cr>

    " Copy current path to clipboard
    nmap <Leader>fr :let @*=expand("%")<CR>

    nmap <Leader>b :!npm run build<CR>
"}}}

"autozimu/LanguageClient-neovim {{{
    let g:LanguageClient_autoStart = 1
    let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ 'dockerfile': ['docker-langserver --stdio'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'typescript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'python': ['pyls'],
    \ 'go': ['go-langserver'],
    \ }

    "prevent interference with Ack
    let g:LanguageClient_diagnosticsList = "location"


    " nnoremap <silent> K :call LanguageClient_contextMenu()<CR>
    " nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    " nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    " nnoremap <silent> gt :call LanguageClient#textDocument_typeDefinition()<CR>
    " nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
    " nnoremap <silent> ga :call LanguageClient_textDocument_codeAction()<CR>
    " nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
    "<leader>lf to fuzzy find the symbols in the current document
    " autocmd FileType javascript nnoremap <buffer>
                " \ <leader>lf :call LanguageClient_textDocument_documentSymbol()<cr>
"}}}

"ctrlpvim/ctrlp.vim {{{
    let g:ctrlp_custom_ignore = 'node_modules\|dist\|coverage\'

    " let g:ctrlp_prompt_mappings = {
      " \ 'AcceptSelection("e")': [],
      " \ 'AcceptSelection("r")': ['<cr>', '<c-m>'],
      " \ }
    "When opening a file, if it's already open in a window somewhere, CtrlP will try
    "to jump to it instead of opening a new instance: >
    let g:ctrlp_switch_buffer = 'Et'

    "When opening a file with <cr>, CtrlP avoids opening it in windows created by
    "plugins, help and quickfix. Use this to setup some exceptions: >
    let g:ctrlp_reuse_window = 'netrw'
"}}}

"geekjuice/vim-mocha {{{
    let g:mocha_js_command = "Dispatch mocha --colors {spec}"
    "map <Leader>a :call RunAllSpecs()<CR>
    "map <Leader>t :call RunCurrentSpecFile()<CR>
    map <Leader>s :call RunNearestSpec()<CR>
    map <Leader>l :call RunLastSpec()<CR>
"}}}

"itchyny/lightline.vim {{{
    let g:lightline = {
    \   'colorscheme': 'default',
    \   'active': {
    \     'left':[ [ 'mode' ],
    \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
    \     ],
    \     'right': [ [ 'lineinfo' ],
    \                [ 'percent' ],
    \                [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ]
    \     ]
    \   },
    \   'component': {
    \     'lineinfo': ' %3l:%-2v',
    \     'charvaluehex': '0x%B',
    \   },
    \   'component_function': {
    \     'gitbranch': 'fugitive#head',
    \   },
    \   'component_expand': {
    \     'buffers': 'lightline#bufferline#buffers',
    \   },
    \   'component_type': {
    \     'buffers': 'tabsel',
    \   }
    \ }

    let g:lightline.separator = {
    \   'left': '', 'right': ''
    \}

    let g:lightline.subseparator = {
    \   'left': '', 'right': ''
    \}

    let g:lightline.tabline = {
    \   'left': [ ['buffers'] ],
    \   'right': [ ['close'] ]
    \ }
"}}}

"junegunn/fzf{{{
    "nnoremap <C-p> :FZF<cr>
    "let $FZF_DEFAULT_COMMAND = 'ag -g ""'
"}}}

"kannokanno/previm{{{
    let g:previm_open_cmd = 'open -a Google\ Chrome'
    augroup PrevimSettings
        autocmd!
        autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
    augroup END
"}}}

"{{{ majutsushi/tagbar
    let g:etagbar_ctags_bin = '/usr/local/bin/ctags'
    let g:tagbar_position = 'leftabove vertical'

    " https://github.com/majutsushi/tagbar/wiki#typescript
    
    let g:tagbar_type_typescript = {
    \ 'ctagsbin' : 'tstags',
    \ 'ctagsargs' : '-f-',
    \ 'kinds': [
        \ 'e:enums:0:1',
        \ 'f:function:0:1',
        \ 't:typealias:0:1',
        \ 'M:Module:0:1',
        \ 'I:import:0:1',
        \ 'i:interface:0:1',
        \ 'C:class:0:1',
        \ 'm:method:0:1',
        \ 'p:property:0:1',
        \ 'v:variable:0:1',
        \ 'c:const:0:1',
    \ ],
    \ 'sort' : 0
    \ }

    " let g:tagbar_type_typescript = {
    " \ 'ctagstype': 'typescript',
    " \ 'kinds': [
        " \ 'c:classes',
        " \ 'n:modules',
        " \ 'f:functions',
        " \ 'v:variables',
        " \ 'v:varlambdas',
        " \ 'm:members',
        " \ 'i:interfaces',
        " \ 'e:enums',
        " \ 't:tests',
    " \ ]
    " \ }

    nmap <silent> <leader>r :TagbarToggle<cr>
"}}}

"mileszs/ack.vim {{{
    let g:ackprg = 'ack --sort-files'
    "if executable('ag')
        "let g:ackprg = 'ag --vimgrep'
    "endif

    " Alias Ack! to F
    :command! -nargs=* F Ack! <args>
"}}}

"morhetz/gruvbox {{{
    set background=dark
    let g:gruvbox_bold=1
    let g:gruvbox_italic=1
    let g:gruvbox_underline=1
    let g:gruvbox_undercurl=1
    let g:gruvbox_contrast_dark='hard'
    let g:gruvbox_italicize_comments=1
    let g:gruvbox_invert_selection=0
    let g:gruvbox_improved_strings=0
    let g:gruvbox_improved_warnings=1
    nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
    nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
    nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

    nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
    nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
    nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
"}}}

"mxw/vim-jsx {{{
    let g:jsx_ext_required = 1
"}}}

"ncm2/ncm2 {{{
 	autocmd BufEnter * call ncm2#enable_for_buffer()
 	let g:ncm2#auto_popup = 0
    " imap <C-j> <Plug>(ncm2_manual_trigger)

    " items of priority 1 - 6 show up with just one char, >= 7 need 2 chars
    let g:ncm2#complete_length=[[1,1],[7,2]]
"}}}

"mhartington/nvim-typescript {{{
    " nnoremap <silent> gt :TSType<CR> " conflicts with tabs
    nnoremap <silent> gd :TSDef<CR>
    nnoremap <silent> gr :TSRefs<CR>
    nnoremap <silent> ga :TSGetCodeFix<CR>
    nnoremap <silent> gn :TSRename<CR>
    nnoremap <silent> gc :TSEditConfig<CR>
    nnoremap <silent> gi :TSOrganizeImports<CR>
    nnoremap <silent> gx :TSGetDiagnostics<CR>
"}}}

"scrooloose/nerdcommenter {{{
    let g:NERDSpaceDelims = 1
"}}}

"scrooloose/nerdtree {{{
    function! ToggleNerdTree()
        if @% != "" && (!exists("g:NERDTree") || (g:NERDTree.ExistsForTab() && !g:NERDTree.IsOpen()))
            :NERDTreeFind
        else
            :NERDTreeToggle
        endif
    endfunction

    noremap <C-n> :NERDTreeToggle<cr>
    nmap <silent> <leader>t :NERDTreeFind<cr>

    let g:NERDTreeIgnore = ['__pycache__$', 'node_modules$', 'dist$', 'build$']
"}}}

"shinchu/lightline-gruvbox.vim {{{
    let g:lightline = {}
    let g:lightline.colorscheme = 'gruvbox'
"}}}

"Shougo/deoplete.nvim {{{
    let g:deoplete#enable_at_startup = 1
"}}}

"SirVer/ultisnips {{{
    let g:UltiSnipsExpandTrigger="<C-j>"
    " let g:UltiSnipsListSnippets="<C-l>"
    " let g:UltiSnipsJumpForwardTrigger="<C-l>"
    " let g:UltiSnipsJumpBackwardTrigger="<C-h>"
"}}}

"tell-k/vim-autopep8 {{{
    let g:autopep8_disable_show_diff=1
    let g:autopep8_on_save = 0
"}}}

""vim-airline/vim-airline {{{
    let g:airline#extensions#tabline#enabled = 1
"}}}

"w0rp/ale {{{
    let g:ale_fix_on_save = 1
    let g:ale_javascript_prettier_use_global = 0
    let g:ale_typescript_tslint_use_global = 1
    " let g:ale_typescript_tsserver_use_global = 1
    let g:ale_echo_delay = 1000
    " let g:ale_disable_lsp = 1

    " ale forces eslint to run against .ts files, but we don't want it to
    "let g:ale_javascript_eslint_options = '--ignore-pattern *.ts'


    "nnoremap <silent> <leader>f :ALEFix<CR>
    map <leader>f :ALEFix<CR>

    let g:ale_fixers = {
    \   'typescript': ['prettier'],
    \   'javascript': ['prettier'],
    \   'JSON': ['prettier'],
    \   'markdown': ['prettier']
    \}

    "'typescript': ['tsserver', 'tslint'],

    let g:ale_linters = {
    \   'typescript': ['tslint'],
    \   'javascript': ['eslint'],
    \   'java': ['javac'],
    \}
"}}}

"abbreviations {{{
    abbr funciton function
    abbr teh the
    abbr tempalte template
    abbr fitler filter
    abbr cosnt const
    abbr attribtue attribute
    abbr attribuet attribute
    abbr toSTring toString
    abbr requrie require
    abbr accpet accept
    abbr requset request
"}}}

"language specific settings {{{
    " 2 space indent for yaml and ruby
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType rb setlocal ts=2 sts=2 sw=2 expandtab

    "spell check .md files
    "autocmd BufRead,BufNewFile *.js,*.md setlocal spell
    autocmd FileType markdown,rst,text,yaml,js setlocal spell

    "spell check dictionary
    if filereadable("/usr/share/dict/words")
        set dictionary+=/usr/share/dict/words
    endif
"}}}

"project specific settings {{{
    "load local project directory settings
    silent! so .vimlocal

    function! ProjectSettings()
        " smooch-core-js settings
        let smooch_core_js = matchstr(getcwd(), 'git/smooch-core-js')
        if !empty(smooch_core_js)
            let g:ctrlp_custom_ignore = 'lib\|dist\|amd\'
            let g:mocha_js_command = "!mocha --compilers js:babel-core/register --require ./test-setup.js {spec}"
        endif

        " smooch-docs settings
        let smooch_docs = matchstr(getcwd(), 'git/smooch-docs')
        if !empty(smooch_docs)
            let g:ale_fix_on_save = 0
        endif

        " smooch settings
        let smooch = matchstr(getcwd(), 'git/agent-console')
        if !empty(smooch)
            let g:ale_javascript_prettier_use_global = 0
            let g:NERDTreeIgnore = ['__pycache__$', 'node_modules$', 'dist$', 'build$', 'persist$', 'temp$', 'coverage$', '.nyc_output$']
            let g:ale_fix_on_save = 1
        endif

        " smooch-web-private settings
        let smooch_web_private = matchstr(getcwd(), 'git/smooch-web-private')
        if !empty(smooch_web_private)
            let g:ale_fix_on_save = 0
        endif

        " smooch/loadtests locust settings
        let smooch_locust = matchstr(getcwd(), 'git/loadtests/platform/locust')
        if !empty(smooch_locust)
            let g:NERDTreeIgnore = ['__pycache__$']
        endif

        " ioredis settings
        let ioredis = matchstr(getcwd(), 'git/ioredis')
        if !empty(ioredis)
            let g:ale_javascript_prettier_use_global = 0
            let g:ale_fix_on_save = 0
            let g:ctrlp_custom_ignore = 'built'
            let g:NERDTreeIgnore = ['node_modules', 'built']
            set shiftwidth=2
        endif

        " DefinitelyTyped settings
        let definitely_typed = matchstr(getcwd(), 'git/DefinitelyTyped')
        if !empty(definitely_typed)
            let g:ale_fix_on_save = 0
        endif


        " let smooch_debuggler = matchstr(getcwd(), 'git/smooch-debuggler')
        " if !empty(smooch_debuggler)
        "     let g:ctrlp_custom_ignore = 'lib\|dist\|amd'
        "     let g:NERDTreeIgnore = ['lib', 'dist', 'amd']
        "     let g:mocha_js_command = "!mocha --compilers js:babel-core/register --require ./test-setup.js {spec}"
        " endif
    endfunction

    autocmd VimEnter * call ProjectSettings()
"}}}

"colorscheme {{{
    "colorscheme monokai
    "let g:onedark_termcolors=256
    "let g:onedark_terminal_italics=1
    "colorscheme onedark
    "colorscheme evening
    colorscheme gruvbox
    syntax on
    filetype plugin on

    if &diff
        "colorscheme evening
        " Make diff look less awful
        " https://stackoverflow.com/questions/2019281/load-different-colorscheme-when-using-vimdiff
        highlight! link DiffText MatchParen

        "highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
        "highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
        "highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
        "highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
    endif

    "hi SpellBad ctermfg=www ctermbg=xxx guifg=#yyyyyy guibg=#zzzzzz
    "hi SpellCap ctermfg=www ctermbg=xxx guifg=#yyyyyy guibg=#zzzzzz
    "
    "hi SpellBad ctermbg=052 guibg=5f0000
    "hi SpellCap ctermbg=236 guibg=303030
    "hi Search cterm=NONE ctermfg=NONE ctermbg=058

"}}}
