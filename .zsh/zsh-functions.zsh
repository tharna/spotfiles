#!/usr/bin/env zsh

function dc()
{
  case $1 in
    c)
      cr
      cd drupal/current
      ;;
    sam)
      cr
      echo $1
      cd drupal/current/sites/all/modules/$2
      ;;
    code)
      cr
      cd drupal/code/$2
      ;;
    cf)
      cr
      cd drupal/conf
      ;;
  esac

}

function cr()
{
  root=$(git rev-parse --show-cdup)
  if [ ! -z  $root ]; then 
    cd $root
  fi
}

function gdiff()
{
  git diff --color $@ | diff-so-fancy
}
