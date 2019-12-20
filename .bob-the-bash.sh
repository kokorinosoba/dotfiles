function get_flags() {
  local flags=''
  # Modified
  if ! git diff --no-ext-diff --quiet; then
    flags="\u002A$flags"
  fi

  # Staged
  if ! git diff --no-ext-diff --staged --quiet; then
    flags="~$flags"
  fi

  # Stash
  if git rev-parse --verify --quiet refs/stash >/dev/null; then
    flags="\$$flags"
  fi

  # Untracked
  if git ls-files --others --exclude-standard --directory --no-empty-directory --error-unmatch -- ':/*' >/dev/null 2>/dev/null; then
    flags="…$flags"
  fi

  echo "$flags"
}

function get_branch_name() {
  local branch_name=$(git rev-parse --abbrev-ref HEAD)
  echo $branch_name
}

function get_hash() {
  local hash=$(git log --pretty=format:'%h' -n 1)
  echo $hash
}

function get_color_code() {
  local flags=$1

  # デフォルトのカラーは緑色
  local color_code=42

  if [[ $flags =~ .*\*.* ]]; then
    # Modifiedがあったら赤色にする
    color_code=41
  elif [[ $flags =~ .*~.* ]]; then
    # Stagedがあったら黄色にする
    color_code=43
  fi
  echo $color_code
}

function git_prompt() {
  local branch_name=$1
  # branch_nameがmasterだったらmasterと表示しない
  [[ $branch_name = "master" ]] && branch_name=""
  # branch_nameの前にブランチのアイコンみたいなのを入れる
  branch_name="  ${branch_name:+$branch_name }"

  # flagsが空文字列でなければ、flagsの前にスペースを1個だけ入れる
  local flags=$2; flags=${flags:+$flags }
  # local h=$(get_hash)

  echo ${branch_name}${flags}
}

function git_ps() {
  # カレントディレクトリがgitリポジトリならgit_prompt関数を実行
  if git rev-parse &>/dev/null; then
    git_prompt
  else
    echo -e -n "\e[37;49m\e[0m "
  fi
}

# [文字黒;背景シアン] ! [文字シアン;背景白]
# [文字黒;背景白] ディレクトリ名

# gitリポジトリの場合
# [文字白;背景=color_code]
# [太字]  ブランチ *~$… [装飾解除]
# [文字=color_code;背景解除][装飾解除]

# gitリポジトリではない場合
# [文字白;背景解除][装飾解除]

PS1='$(
  if [[ $? -ne 0 ]]; then
    # 終了ステータスが0以外なら「!」を表示
    echo "\[\e[30;46m\] ! \[\e[36;47m\]";
  fi
)\[\e[30;47m\] \w \
$(
  if git rev-parse &>/dev/null; then
    # カレントディレクトリがgitリポジトリならブランチの情報を付加
    branch_name=$(get_branch_name)
    flags=$(get_flags)
    color_code=$(get_color_code $flags)
    git_prompt_str=$(git_prompt $branch_name $flags)

    echo -n "\[\e[37;${color_code}m\]"
    echo -n -e "\[\e[1m\] $git_prompt_str \[\e[0m\]"
    echo -n "\[\e[$(($color_code - 10));49m\]\[\e[0m\] "
  else
    echo "\[\e[37;49m\]\[\e[0m\] "
  fi
)'
