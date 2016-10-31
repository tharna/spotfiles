#!/usr/bin/env zsh
function lpass_shortcuts()
{
  git_clear_vars

  if [[ "$#" -eq 1 ]]; then
    results=(${(f)"$(lpass ls | grep -i "$1")"} )
    results_color=(${(f)"$(lpass ls | grep -i --color=always "$1")"} )
  fi
  i=1
  for line in $results_color
  do
    echo "${WHITE}[${NO_COLOR}$i${WHITE}]${NO_COLOR} $line"
    (( i = i + 1 ))
  done
  i=1
  for line in $results
  do
    note_id="${${line#*id: }%]*}"
    e="e$i"
    export $e="$note_id"
    (( i = i + 1 ))
  done
}

function questimate_password()
{
  results=(${(f)"$(lpass ls | grep -i "$1")"} )

  for line in $results
  do
    note_id="${${line#*id: }%]*}"
    break
  done

  if [ $# -eq 1 ]; then
    lpass show $note_id -c --field="www-admin"
  elif [ $# -eq 2 ]; then
    lpass show $note_id -c --field="$2"
  fi
}

alias fp="lpass_shortcuts"
alias lp="exec_scmb_expand_args lpwd"
alias lps="exec_scmb_expand_args lpass show"
alias qp=questimate_password
