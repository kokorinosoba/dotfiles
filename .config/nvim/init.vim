""" release autogroup in MyAutoCmd
augroup MyAutoCmd
    autocmd!
augroup END

" ==========================================================
" Display settings
" ==========================================================
syntax on
set background=dark
" git clone {colorscheme}
" and then mv {colorscheme}.vim .vim/colors/
colorscheme hybrid
set title               " 編集中のファイル名を表示
set number              " 行番号の表示
set cursorline          " カーソルがある行番号をハイライト
set ruler               " カーソル位置が右下に表示される
set list                " タブ、空白、改行を可視化する、次行で設定
set listchars=tab:»-,trail:-,eol:⏎,extends:»,precedes:«,nbsp:%
set tabstop=4           " <Tab>が対応する空白の数
" set colorcolumn=80      " 80文字目にラインを入れる
let &colorcolumn=join(range(81,999),",") " 80文字以降をハイライト
" 要検証
set wildmenu            " コマンド補完の設定（wildmodeもあるよ）

" ==========================================================
" Edit settings
" ==========================================================
" 移動
set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
" <Tab>, インデント
set expandtab           " <Tab>押下時に<Tab>ではなく、ホワイトスペースを挿入する
set softtabstop=2       " <Tab>押下時の空白数
set shiftwidth=2        " インデントにつかわれる空白の数
set autoindent          " 改行時にインデントを引き継いで改行する
set smartindent         " { を入力したときに自動でインデント
set shiftround          " '<<'や'>>'でインデントする際に'shiftwidth'の倍数に丸める
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=1         " 対応括弧のハイライト表示を0.1*n秒にする
set matchpairs& matchpairs+=<:>   " 対応括弧に'<'と'>'のペアを追加
set backspace=indent,eol,start    " バックスペースでなんでも消せるようにする
set nrformats=          " インクリメント、デクリメントを10進数にする
" 補完
set infercase           " 補完時に大文字小文字を区別しない

set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く

" <Space>+<Return>で空行を挿入
nnoremap <silent> <Space><CR> o<ESC>

augroup MyAutoCmd
  autocmd FileType python setlocal autoindent
  autocmd FileType python setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
  autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
augroup END

" ==========================================================
" Search settings
" ==========================================================
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set hlsearch            " 検索マッチテキストをハイライト
set incsearch           " インクリメンタルサーチ
set wrapscan            " 最後尾まで検索を終えたら次の検索で先頭に移る
" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'
""" マクロおよびキー設定
" ESCを二回押すことでハイライトを消す
nnoremap <silent> <Esc><Esc> :nohlsearch<CR>
" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>
" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk
" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %
" [ と打ったら [] って入力されてしかも括弧の中にいる(以下同様)
inoremap [ []<left>
inoremap ( ()<left>
inoremap { {}<left>
" inoremap " ""<left>
" inoremap ' ''<left>
" Ctrl + hjkl でウィンドウ間を移動
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>
" タブ間の移動
nnoremap <C-n> gt
nnoremap <C-p> gT
" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)
" vim 起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif
    if a:bang == ''
        pwd
    endif
endfunction
autocmd MyAutoCmd VimEnter * call s:ChangeCurrentDir('', '')

" ==========================================================
" dein
" ==========================================================
if &compatible
 set nocompatible
endif

" Install dein automatically if dein does not exist
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

" Add the dein installation directory into runtimepath
let &runtimepath = s:dein_repo_dir .",". &runtimepath

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " set dein.toml and dein_layz.toml directory
  let s:toml_dir = empty($XDG_CONFIG_HOME) ? expand('~/.config/nvim') : $XDG_CONFIG_HOME . '/nvim'
  " plugins loaded at startup
  call dein#load_toml(s:toml_dir . '/dein.toml', {'lazy': 0})
  " lazy loaded plugins
  call dein#load_toml(s:toml_dir . '/dein_lazy.toml', {'lazy': 1})

  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

" ==========================================================
" Others
" ==========================================================
autocmd FileType python setlocal omnifunc=jedi#completions
