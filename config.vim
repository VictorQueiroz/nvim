" Backup / undo state.
" Keep editor scratch state out of the config repo: state lives under
" stdpath('state'), which is not version-controlled.
set backup
set writebackup
set backupext=-backup
set undofile

" Neovim creates 'undodir' on demand but NOT 'backupdir' -- if that directory is
" missing, backups are silently never written. Create both, 0700, since they
" hold verbatim copies of whatever you edit.
let s:backupdir = stdpath('state') . '/backup'
let s:undodir = stdpath('state') . '/undo'
for s:dir in [s:backupdir, s:undodir]
  if !isdirectory(s:dir)
    call mkdir(s:dir, 'p', 0700)
  endif
endfor

" The trailing '//' makes Neovim encode the full path into the filename, so
" files with the same basename in different projects do not clobber each other.
let &backupdir = s:backupdir . '//'
let &undodir = s:undodir . '//'

" Never write backups or undo history for files that hold secrets. Leaving
" 'backupskip' empty disables Vim's defaults and leaks credentials to disk.
set backupskip&
set backupskip+=*.env,.env,.env.*,*/.env,*/.env.*
set backupskip+=.mcp.json,*/.mcp.json
set backupskip+=*/.ssh/*,*/.gnupg/*,*.pem,*.key,*_rsa,*_ed25519
set backupskip+=*/.aws/*,*/.config/gh/*,*.netrc,*/.npmrc,*/.pypirc

" Undo history is as sensitive as a backup, and 'backupskip' does not cover it.
augroup NoUndofileForSecrets
  autocmd!
  autocmd BufRead,BufNewFile
        \ .env,*.env,.env.*,.mcp.json,*.pem,*.key,*_rsa,*_ed25519,.netrc,.npmrc,.pypirc
        \ setlocal noundofile nobackup nowritebackup noswapfile
augroup END

" Other
set relativenumber
set number
set cursorline
set laststatus=2
set showmode
set showcmd
set showmatch
set incsearch
set hlsearch
" 'smartcase' has no effect unless 'ignorecase' is also set.
set ignorecase
set smartcase
set scrolloff=5
set sidescroll=5
set sidescrolloff=5
set wrap
set nolist

" Make sure only whole words are wrapped so it is easier to read text.
set linebreak

" Default indentation settings
set expandtab
set tabstop=2
set shiftwidth=2

" Clipboard
set clipboard=unnamedplus
