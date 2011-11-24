" Todo:
"   - Fold settings, per file type (python, java, C).

" General config:
    set nocompatible                    " Turn off compatibility mode with vi.
    set nobackup                        " Turn off backup files (<filename>~ files).
    set nowrap                          " Don't wrap lines.
    set noerrorbells                    " Don't make noise.
    set nohlsearch                      " Don't highlight search.
    set showmatch                       " Briefly show matching brace/parenthese/bracket.
    set incsearch                       " Do highlight search, as you type.
    set number                          " Use line numbers.
    set ruler                           " Use statusbar for every window.
    set list                            " List mode. Prints unprintable characters, for easy identification.
    set listchars=tab:>-,trail:-,
                 \extends:>,precedes:<  " List of characters to be printed, in the specified format, by list mode.
    set mouse=a                         " Cheat a little. The mouse can be used in all modes.
    set backspace=indent,eol,start      " Allow backspace to remove indents, join lines and remove characters before insert.
    set filetype=unix,dos,mac           " Support newline formats in given order.
    set cursorline                      " Highlight the current line.
    "set cursorcolumn                  " Highlight the current column. Not in the mood for that, right now.
    syntax on                           " Turn syntax highlighting on.
    filetype plugin indent on           " Turn on filetype plugins and indentation.

" Fold config:
    set foldmethod=marker               " Only fold lines between markers.
    set foldmarker={,}                  " Markers to use for folding.
    set foldminlines=3                  " Minimum amount of lines for folding.
    set foldlevelstart=99               " No initial folds.

" Indentation config:
    set autoindent                      " Automaticly indent to the level of the previous line.
    set smartindent                     " Guess indent level, based on syntax.
    set expandtab                       " Set soft tabs (replace tabs with <tabstop> spaces).
    set softtabstop=4                   " A tab will be replaced with this amount of spaces.
    set shiftwidth=4                    " Same as tabstop, but for autoindents and >> indents.
    set tabstop=4                       " Real tabs will be this long and will show up, because of the list setting.

" Set color scheme:
    colorscheme darkblue
