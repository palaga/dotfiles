" Todo:
"   - Fold settings, per file type (python, java, C).


" NeoBundle config:
  filetype off
  if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle/'))
  endif

" Bundles to manage:
  NeoBundleFetch 'Shougo/neobundle.vim'

  NeoBundle      'Shougo/vimproc.vim'
  NeoBundle      'Shougo/unite.vim'
  NeoBundle      'Shougo/vimshell.vim'
  NeoBundle      'Shougo/neocomplete.vim'
  NeoBundle      'jnurmine/Zenburn'
  NeoBundle      'altercation/vim-colors-solarized'
  NeoBundle      'derekwyatt/vim-scala'
  NeoBundle      'scrooloose/syntastic'
  NeoBundle      'scrooloose/nerdtree'
  NeoBundle      'scrooloose/nerdcommenter'
  NeoBundle      'tpope/vim-fugitive'
  NeoBundle      'tpope/vim-surround'
  NeoBundle      'mileszs/ack.vim'
  NeoBundle      'gregsexton/gitv'
  NeoBundle      'majutsushi/tagbar'
  NeoBundle      'SirVer/ultisnips'
  NeoBundle      'embear/vim-localvimrc'
  NeoBundle      'jceb/vim-orgmode'
  NeoBundle      'godlygeek/tabular'
  NeoBundle      'kien/ctrlp.vim'
  NeoBundle      'bling/vim-airline'
  NeoBundle      'chrisbra/csv.vim'
  NeoBundle      'wannesm/wmgraphviz.vim'
  NeoBundle      'kovisoft/slimv'

  NeoBundleCheck


" General config:
  set nocompatible                    " Turn off compatibility mode with vi.
  set nobackup                        " Turn off backup files (<filename>~ files).
  set nowrap                          " Don't wrap lines.
  set noerrorbells                    " Don't make noise.
  set nohlsearch                      " Don't highlight search.
  set ignorecase                      " Ignore case when searching.
  set wildmenu                        " Auto complete the command-line.
  set showmatch                       " Briefly show matching brace/parenthese/bracket.
  set incsearch                       " Do highlight search, as you type.
  set number                          " Use line numbers.
  set showcmd                         " Show command command in last line, plus lines selected in visual mode.
  set number                          " Use line numbers.
  set ruler                           " Show line and column number of curser in the status line.
  set cursorline                      " Highlight the current line.
  set list                            " List mode. Prints unprintable characters, for easy identification.
  set lazyredraw                      " Do not update screen while executing macros.
  set mousehide                       " Hide mouse while typing.
  set showfulltag                     " Show whole tag on completion, not just the function name.
  set autoread                        " Automatically reread file when it has changed outside of vim.
  set clipboard+=unnamed              " Redirect unnamed register to * register.
  set virtualedit=all                 " Allow curser to go in invalid places.
  set scrolloff=4                     " Minimal number of screen lines to keep above and below the cursor.
  set timeoutlen=500                  " Timeout for key codes or mapped key sequences.
  set history=20                      " Number of commands to save in the history.
  set cmdheight=2                     " Two line command-line, to avoid hit-enter prompts.
  set laststatus=2                    " Always show status line.
  set listchars=tab:>-,trail:-,
                \extends:>,precedes:< " List of characters to be printed, in the specified format, by list mode.
  set foldopen=block,insert,jump,
              \mark,percent,quickfix,
              \search,tag,undo        " Open folds when one of these actions occurs on a fold.
  set mouse=a                         " Cheat a little. The mouse can be used in all modes.
  set backspace=indent,eol,start      " Allow backspace to remove indents, join lines and remove characters before insert.
  set fileformats=unix,dos,mac        " Support newline formats in given order.

  syntax on                           " Turn syntax highlighting on.
  filetype plugin indent on           " Turn on filetype plugins and indentation.

  " Use xdg-open to open possible uri onder cursor
  let g:netrw_browsex_viewer='xdg-open'

" Gui options:
  " a: When in visual try to copy selection to the windowing system's global
  "    selection.
  " c: Use console dialogs instead of popup dialogs for simple choices.
  set guioptions=ac


" Fold config:
  set foldmethod=syntax               " Syntax folding.
  set foldcolumn=1                    " Show folds in an extra column on the left side.
  "set foldmarker={,}                  " Markers to use for folding.
  "set foldminlines=3                  " Minimum amount of lines for folding.
  set foldlevelstart=99               " No initial folds.

" Syntastic config:
  let g:syntastic_java_javac_config_file_enabled=1 " Read javac config file, to make classpath permanent
  let g:syntastic_java_javac_delete_output=0       " Do not delete class files, to speed up checking

" VimTip 1651:
  " Don't screw up folds when inserting text that might affect them, until
  " leaving insert mode. Foldmethod is local to the window. Protect against
  " screwing up folding when switching between windows.
  autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif


" Encryption config:
  set key=                            " Unset any key.
  if exists('+cryptmethod')
    set cryptmethod=blowfish          " Set encryption method to blowfish (only for vim 7.3 and up).
  endif


" Indentation config:
  set autoindent                      " Automaticly indent to the level of the previous line.
  set smartindent                     " Guess indent level, based on syntax.
  set expandtab                       " Set soft tabs (replace tabs with <tabstop> spaces).
  set softtabstop=2                   " A tab will be replaced with this amount of spaces.
  set shiftwidth=2                    " Same as tabstop, but for autoindents and >> indents.
  set tabstop=2                       " Real tabs will be this long and will show up, because of the list setting.


" Set color scheme:
  set background=dark                 " Please use a dark scheme, when posible.
  colorscheme zenburn


" Syntastic specific settings:
  let g:syntastic_java_javac_delete_output=0        " Keep class files, to speedup checking
  let g:syntastic_java_javac_config_file_enabled=1  " Enable javac config file


" Mappings:
  " Open file under curser, even if it doesn't exist, with \gf:
  map <leader>gf :sp   <cfile><cr>
  map <leader>gF :tabe <cfile><cr>
  map <leader>gr :r    <cfile><cr>

