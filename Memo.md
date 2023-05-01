# シェルスクリプト
* 変数の命名
  * 定数は大文字・変数は小文字
  * 関数は小文字
  * 複数単語はアンダーバーでつなぐ
* exportは変数を環境変数にするだけ
* `source`と`.`の実体は同じ
* dirnameについて
  * dirnameは遅いので`echo ${0%/*}`を使うことを推奨
  * スクリプトをコマンドとして実行すると`dirname $0`で絶対パスが返ってくる
  * 一方で相対パス`./**/command`で実行すると相対パスで返ってくる
    * 絶対パスで取得するためには`$(cd $(dirname $0); pwd)`を使うと良い
    * シンボリックリンク解決するなら`readlink -f $0`か`realpath $0`を使う
* リダイレクト
  * `>`: 標準出力  `2>`: 標準エラー出力  `>>`: 追記
  * `set -o noclobber`をすると`>`でファイルが存在するときエラーになる
  * `2>&1`: 標準エラー出力を標準出力と同じにする
    * `ls > ls.txt 2>&1`
      1. 標準出力をls.txtに指定する
      2. `2>&1`でエラー出力も標準出力(ls.txt)に切り替わる
      3. ファイルに書き込みされる
      * `ls &> ls.txt`は同じ意味
  * `1>&2`: 標準出力を標準エラー出力に切り替える
    * 1は省略できるので`>&2`と書いても同じ
* `set -eu`
  * `||`が使えなくなるので闇雲に`set -e`を使わない

# .aliasrc
* 多すぎて拾えないもの
  * git commit
  * git log
* よくわからないもの
  * git bisect
  * git describe
  * git mergetool
  * git pull --autostash
  * git push --dry-run
  * git svn
  * git tag
  * git update-index
  * git whatchanged
* 他にもありそう
  * git ls-files
  * git shortlog

# git
* わかったこと
  * abbrev
    * abbreviation: 省略 -> SHA-1を省略して表示
  * pretty
    * 別のフォーマットで表示する
* すごいわざ
  * git commit --amend --date "`date --date '15 hours ago`"

# pip
* ml
  * jupyter
  * jupyterlab
  * matplotlib
  * pandas
  * scikit-learn
  * jupyter labextension install @lckr/jupyterlab_variableinspectorjupyter
  * jupyter labextension install @jupyterlab/toc

# Mac initializing
- Apple Music -> Account -> Sign in
- System Preferences
  - Share -> Change computer name
  - Apple ID -> Sign in
  - Trackpad -> Check all items
  - Control Center -> Sound -> Always Show in Menu Bar
  - Control Center -> Battery -> Show in Control Center
  - Control Center -> Battery -> Show in Control Center
  - Control Center -> Battery -> Show Percentage
  - Displays -> Automatically adjust brightness -> off
  - Lock Screen -> Turn display off on battery when inactive > For 5 minutes
  - Lock Screen -> Turn display off on power adapter when inactive > For 10 minutes
  - Lock Screen -> Require password after screen saver begins or display is turned off > After 1 hour
  - Keyboard -> Input Sources -> Set ABC & Hiragana(Google)
- Iterm2 -> Preferences -> Profiles
  - General -> Command -> Command -> /usr/local/bin/fish
  - Colors -> Color Presets -> Japanesque
  - Text -> Font -> Liberation Mono for Powerline 16pt.
  - Window
    - Transparency 25
    - Style -> Full Screen
    - Screen -> No Preference
    - Space -> Current Space
  - Keys -> Hotkey Window
    - Check "A hotkey opens ~"
    - Configure Hotkey Window
      - Hotkey -> opt-Space
      - Check "Pin hotkey window"
      - Check "Show this Hotkey Window"
- Terminal -> Preferences -> Text
  - Background -> Opacity 85%
  - Font -> Literation Mono Powerline 16pt.
