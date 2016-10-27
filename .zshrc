# next lets set some enviromental/shell pref stuff up
# setopt NOHUP
#setopt NOTIFY
#setopt NO_FLOW_CONTROL
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY SHARE_HISTORY
# setopt AUTO_LIST		# these two should be turned off
# setopt AUTO_REMOVE_SLASH
# setopt AUTO_RESUME		# tries to resume command of same name
unsetopt BG_NICE		# do NOT nice bg commands
setopt CORRECT			# command CORRECTION
setopt EXTENDED_HISTORY		# puts timestamps in the history
setopt HASH_CMDS		# turns on hashing
setopt HASH_DIRS		# turns on hashing
#
#setopt MENUCOMPLETE
setopt LIST_AMBIGUOUS
setopt ALL_EXPORT

# Set/unset  shell options
setopt   notify globdots correct pushdtohome cdablevars autolist
setopt   correctall autocd recexact longlistjobs
setopt   autoresume histignoredups pushdsilent 
setopt   autopushd pushdminus extendedglob rcquotes mailwarning
unsetopt bgnice autoparamslash

# Autoload zsh modules when they are referenced
zmodload -a zsh/stat stat
zmodload -a zsh/zpty zpty
zmodload -a zsh/zprof zprof
#zmodload -ap zsh/mapfile mapfile


PATH="/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin/:$HOME/bin/:$HOME/.composer/vendor/bin:$PATH"
TZ="Europe/Helsinki"
HISTFILE=$HOME/.zhistory
HISTSIZE=100000
SAVEHIST=100000
HOSTNAME="`hostname`"
PAGER='less'
EDITOR='vim'
autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
  eval PR_$color='%{$terminfo[bold]$fg[${(L)color}]%}'
  eval PR_LIGHT_$color='%{$fg[${(L)color}]%}'
  eval $color='$fg_no_bold[${(L)color}]'
  (( count = $count + 1 ))
done
PR_NO_COLOR="%{$terminfo[sgr0]%}"
NO_COLOR="$terminfo[sgr0]"
PS1="$PR_GREEN%n$PR_BLUE@$PR_YELLOW%m$PR_GREEN:$PR_BLUE%5c/$PR_NO_COLOR%(!.#.$) "
#RPS1="$PR_YELLOW(%D{%d.%m %H:%M:%S})$PR_NO_COLOR"
#LANGUAGE=
LC_ALL='en_US.UTF-8'
LANG='en_US.UTF-8'
LC_CTYPE=C

MUTT_EDITOR=vim

unsetopt ALL_EXPORT
# # --------------------------------------------------------------------
# # aliases
# # --------------------------------------------------------------------

alias slrn="slrn -n"
alias man='LC_ALL=C LANG=C man'
alias f=finger
alias la='ls -al'
alias ls='ls --color=auto '
alias cp='cp -i'
alias sl='ls'
alias la='ls -lah'
alias lars='ls -lahrS'
alias lsd='ls -d */'
alias du='du -h'
alias df='df -h'
alias xc='exit'
alias cd.='cd ..'
alias cgrep='grep -n --color=always'
alias g='git'
#alias cr='cd $(git rev-parse --show-cdup)'
alias sam='dc sam'
alias gv='ge vi'
alias v='vi'
alias d='drush'
alias pf='platform'
alias icanhas='sudo apt-fast install'
alias drupalcs='phpcs --standard=~/drupal/drupalcs/Drupal/ruleset.xml'
alias screen="screen -U"
#alias gd="gdiff --color | diff-so-fancy"
alias gd="git diff"
alias t=todo
alias wt=wundertools
alias vsh="vagrant ssh"
alias vup="vagrant up"
alias vgs="vagrant global-status"
alias ansible-vault="ansible-vault --vault-password-file=$WT_ANSIBLE_VAULT_FILE"
alias k=kontena
#alias lpwd="lpass show"
alias ppwd="pass -c"
alias -s pdf=evince
alias -s txt=cat
alias -s zip=unzip
alias -s js=vim
alias -s php=vim
alias -s module=vim
alias -s jpg=eog
alias -s png=eog
alias -s gif=eog
alias -s JPG=eog
alias -s PNG=eog
alias -s GIF=eog

# alias	=clear

#chpwd() {
#     [[ -t 1 ]] || return
#     case $TERM in
#     sun-cmd) print -Pn "\e]l%~\e\\"
#     ;;
#    *xterm*|screen|rxvt|(dt|k|E)term) print -Pn "\e]2;%~\a"
#    ;;
#    esac
#}

#chpwd

autoload -U compinit
compinit

autoload bashcompinit
bashcompinit

bindkey "^?" backward-delete-char
bindkey '^[OH' beginning-of-line
bindkey '^[OF' end-of-line
bindkey '^[[5~' up-line-or-history
bindkey '^[[6~' down-line-or-history
bindkey "^r" history-incremental-search-backward
bindkey ' ' magic-space    # also do history expansion on space
bindkey '^I' complete-word # complete on tab, leave expansion to _expand
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '\e[3~' delete-char

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path ~/.zsh/cache/$HOST

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' menu select=1 _complete _ignored _approximate
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'

# Completion Styles
zstyle ':completion:*' accept-exact false
# list of completers to use
zstyle ':completion:*::::' completer _expand _complete _ignored _approximate

# allow one error for every three characters typed in approximate completer
zstyle -e ':completion:*:approximate:*' max-errors \
    'reply=( $(( ($#PREFIX+$#SUFFIX)/2 )) numeric )'
    
# insert all expansions for expand completer
zstyle ':completion:*:expand:*' tag-order all-expansions

# formatting and messages
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%B%d%b'
zstyle ':completion:*:messages' format '%d'
zstyle ':completion:*:warnings' format 'No matches for: %d'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*' group-name ''

# match uppercase from lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# offer indexes before parameters in subscripts
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# command for process lists, the local web server details and host completion
# on processes completion complete all user processes
zstyle ':completion:*:processes' command 'ps -au$USER'

## add colors to processes for kill completion
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'

#zstyle ':completion:*:processes' command 'ps -o pid,s,nice,stime,args'
#zstyle ':completion:*:urls' local 'www' '/var/www/htdocs' 'public_html'
#
#NEW completion:
# 1. All /etc/hosts hostnames are in autocomplete
# 2. If you have a comment in /etc/hosts like #%foobar.domain,
#    then foobar.domain will show up in autocomplete!
zstyle ':completion:*' hosts $(awk '/^[^#]/ {print $2 $3" "$4" "$5}' /etc/hosts | grep -v ip6- && grep "^#%" /etc/hosts | awk -F% '{print $2}') 
# Filename suffixes to ignore during completion (except after rm command)
zstyle ':completion:*:*:(^rm):*:*files' ignored-patterns '*?.o' '*?.c~' \
    '*?.old' '*?.pro'
# the same for old style completion
#fignore=(.o .c~ .old .pro)

# ignore completion functions (until the _ignored completer)
zstyle ':completion:*:functions' ignored-patterns '_*'
zstyle ':completion:*:*:*:users' ignored-patterns \
        adm apache bin daemon games gdm halt ident junkbust lp mail mailnull \
        named news nfsnobody nobody nscd ntp operator pcap postgres radvd \
        rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs avahi-autoipd\
        avahi backup messagebus beagleindex debian-tor dhcp dnsmasq fetchmail\
        firebird gnats haldaemon hplip irc klog list man cupsys postfix\
        proxy syslog www-data mldonkey sys snort
# SSH Completion
zstyle ':completion:*:scp:*' tag-order \
   files users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:scp:*' group-order \
   files all-files users hosts-domain hosts-host hosts-ipaddr
zstyle ':completion:*:ssh:*' tag-order \
   users 'hosts:-host hosts:-domain:domain hosts:-ipaddr"IP\ Address *'
zstyle ':completion:*:ssh:*' group-order \
   hosts-domain hosts-host users hosts-ipaddr
zstyle '*' single-ignored show

zstyle ':chpwd:profiles:~/projects(|/|/*)' profile projects

if [[  ${TERM} == "screen-256color-bce" || ${TERM} == "screen-bce" || ${TERM} == "screen" ]]; then
  precmd () { print -Pn "\033k\033\134\033k%1d/\033\134" }
  preexec () { 
      #print -Pn "\033k\033\134\033k%m[$1]\033\134" 
      local CMD=${1[(wr)^(<*|*=*|sudo|exec|-*)]}
      echo -n "\ek$CMD\e\\"
      }
  #precmd () { print -Pn "\033k\033\134\033k%m[%1d]\033\134" }
  #preexec () { print -Pn "\033k\033\134\033k%m[$1]\033\134" }
else
  precmd () { print -Pn "\e]0;%n@%m: %~\a" }
  preexec () { print -Pn "\e]0;%n@%m: $1\a" }
fi

#setopt extended_glob
#preexec () {
#    if [[ "$TERM" == "screen" ]]; then
#        local CMD=${1[(wr)^(*=*|sudo|-*)]}
#        echo -ne "\ek$CMD\e\\"
#    fi
#}
eval $(dircolors -b ~/.zsh/.dircolors)

# zgitinit and prompt_wunjo_setup must be somewhere in your $fpath, see README for more.

setopt promptsubst

# Load the prompt theme system
#autoload -U promptinit
#promptinit

# Use the wunjo prompt theme
#prompt wunjo
# git integration

setopt prompt_subst
autoload colors    
colors             

autoload -Uz vcs_info
# set some colors
for COLOR in RED GREEN YELLOW WHITE BLACK CYAN; do
    eval PR_$COLOR='%{$fg[${(L)COLOR}]%}'         
    eval PR_BRIGHT_$COLOR='%{$fg_bold[${(L)COLOR}]%}'
done                                                 
PR_RESET="%{${reset_color}%}"; 

FMT_BRANCH="${PR_GREEN}%b%u%c${PR_RESET}" # e.g. master¹²
FMT_ACTION="(${PR_CYAN}%a${PR_RESET}%)"   # e.g. (rebase-i)
FMT_PATH="%R${PR_YELLOW}/%S"              # e.g. ~/repo/subdir

# check-for-changes can be really slow.
# you should disable it, if you work with large repositories    
zstyle ':vcs_info:*:prompt:*' check-for-changes true
zstyle ':vcs_info:*:prompt:*' unstagedstr '¹'  # display ¹ if there are unstaged changes
zstyle ':vcs_info:*:prompt:*' stagedstr '²'    # display ² if there are staged changes
zstyle ':vcs_info:*:prompt:*' actionformats "${FMT_BRANCH}${FMT_ACTION}//" "${FMT_PATH}"
zstyle ':vcs_info:*:prompt:*' formats       "${FMT_BRANCH}"              "${FMT_PATH}"
zstyle ':vcs_info:*:prompt:*' nvcsformats   ""                             "%~"         

function precmd {       
        vcs_info 'prompt'          
}

#todoprompt(){
#  if $(which todo &> /dev/null)
#  then
#    num=$(echo $(todo ls | wc -l))
#    let todos=num-2
#    if [ $todos != 0 ]
#    then
#      echo "TODO: $todos"
#    else
#      echo ""
#    fi
#  else
#    echo ""
#  fi
#}
#set_prompt () {
#  export RPROMPT="%{$fg_bold[cyan]%}$(todoprompt)%{$reset_color%}"
#}

#precmd() {
#  set_prompt
#}
function lprompt {
    local brackets=$1
    local color1=$2  
    local color2=$3  
                     
    local bracket_open="${color1}${brackets[1]}${PR_RESET}"
    local bracket_close="${color1}${brackets[2]}"          
                                                             
    local git='$vcs_info_msg_0_'                           
    local cwd="${color2}%B%1~%b"

    PROMPT="${PR_RESET}${bracket_open}${git}${cwd}${bracket_close}%# ${PR_RESET}"
}                                                                                        

function rprompt {
    local brackets=$1
    local color1=$2  
    local color2=$3  
                     
    local bracket_open="${color1}${brackets[1]}${PR_RESET}"
    local bracket_close="${color1}${brackets[2]}${PR_RESET}"
    local colon="${color1}:"                                
    local at="${color1}@${PR_RESET}"                        
                                                            
    local user_host="${color2}%n${at}${color2}%m"                    
    local vcs_cwd='${${vcs_info_msg_1_%%.}/$HOME/~}'        
    local cwd="${color2}%B%20<..<${vcs_cwd}%<<%b"
    local inner="${user_host}${colon}${cwd}"

    RPROMPT="${PR_RESET}${bracket_open}${inner}${bracket_close}${PR_RESET}"
}

function prompti {
    # PS1="$PR_GREEN%n$PR_BLUE@$PR_YELLOW%m$PR_GREEN:$PR_BLUE%5c/$PR_NO_COLOR%(!.#.$) "
    local brackets=$1
    local color1=$2  
    local color2=$3  
    local at="${color1}@${PR_RESET}"                        
    
    local bracket_open="${color1}${brackets[1]}${PR_RESET}"
    local bracket_close="${color1}${brackets[2]}${PR_RESET}"

    local git='$vcs_info_msg_0_'                           
    local cwd="${color2}%B%1~%b"

    PROMPT="$PR_GREEN%n$PR_BLUE@$PR_YELLOW%m$PR_GREEN:$PR_BLUE%5c/$PR_NO_COLOR${bracket_open}${git}${bracket_close} %(!.#.$) "


}

function prompt_pro {
    # PS1="$PR_GREEN%n$PR_BLUE@$PR_YELLOW%m$PR_GREEN:$PR_BLUE%5c/$PR_NO_COLOR%(!.#.$) "
    local brackets=$1
    local color1=$2  
    local color2=$3  
    local at="${color1}@${PR_RESET}"                        
    
    local bracket_open="${color1}${brackets[1]}${PR_RESET}"
    local bracket_close="${color1}${brackets[2]}${PR_RESET}"

    local git='$vcs_info_msg_0_'                           
    local cwd="${color2}%B%1~%b"

    local project='test'
    PROMPT="$PR_GREEN%n$PR_BLUE@$PR_YELLOW%m$PR_GREEN:$PR_BLUE%5c/$PR_NO_COLOR${bracket_open}${project}${bracket_close}${bracket_open}${git}${bracket_close} %(!.#.$) "


}


#lprompt '[]' $BR_BRIGHT_BLACK $PR_WHITE
#rprompt '()' $BR_BRIGHT_BLACK $PR_WHITE
prompti '[]' $BR_BRIGHT_BLACK $PR_WHITE
#chpwd() {
    #if[[PWD ~ $GIT_REPO_DIR ]]
    #print "chpwd(): Switching to profile: $profile"
    #prompt_pro '[]' $BR_BRIGHT_BLACK $PR_WHITE
  #fi 
#}
zle-keymap-select() {
  if [[ $KEYMAP = vicmd ]]; then
    echo -ne "\033]12;Red\007"
  else
    echo -ne "\033]12;Green\007"
  fi
}
zle -N zle-keymap-select

zle-line-init () {
  zle -K viins
  if [ $TERM = "rxvt-256color" ]; then
    echo -ne "\033]12;Green\007"
  fi
}
zle -N zle-line-init

bindkey -v

bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

unset GREP_OPTIONS
#alias grep='grep --color=auto'
export GREP_COLOR='1;33'

source ~/.zsh/.git-completion.sh
source ~/.zsh/.git-flow-completion.sh
#function zle-line-init zle-keymap-select {
#    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
#    RPS2=$RPS1
#    zle reset-prompt
#}
#zle -N zle-line-init
#zle -N zle-keymap-select
expand-or-complete-with-dots() {
      echo -n "\e[31m......\e[0m"
        zle expand-or-complete
          zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots
insert_sudo () { zle beginning-of-line; zle -U "sudo " }
zle -N insert-sudo insert_sudo
bindkey "^[s" insert-sudo
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search.zsh
source ~/.zsh/grep_with_file_shortcuts.zsh
source ~/.zsh/lpass_shortcuts.zsh
source ~/.zsh/zsh-functions.zsh

fpath=(~/code/drush_zsh/zsh $fpath)
fpath=(~/.zsh/completion $fpath)
autoload -U compinit
compinit -i

#grep() { 
#    if [[ -t 0 && -t 1 ]]; then 
#        command grep -n "$@"
#    else 
#        command grep "$@"
#    fi
#}
# make compass work with utf-8
#export RUBYOPT=-Ku
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[ -s "/home/janne/.scm_breeze/scm_breeze.sh" ] && source "/home/janne/.scm_breeze/scm_breeze.sh"

source /home/janne/.zsh/lpass_bash_completion
source /home/janne/.zsh/lpwd_completion
export LPASS_CLIPBOARD_COMMAND="xclip -selection clipboard -in -l 1"
export PASS_DISABLE_PINENTRY=1
export LPASS_AGENT_TIMEOUT=28800
export LPASS_ASKPASS=/home/janne/bin/lpass_prompt
#autoload predict-on
#predict-on
#function zle-line-init zle-keymap-select {
    #VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/} $EPS1"
    #zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select

# Platform.sh CLI configuration
PLATFORMSH_CONF=~/.composer/vendor/platformsh/cli/platform.rc
[ -f "$PLATFORMSH_CONF" ] && . "$PLATFORMSH_CONF"

. ~/.zsh/z.sh

# source /usr/share/zsh/vendor-completions/_pass

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=0;32:*.jpe=0;32:*.jpeg=0;32:*.gif=0;32:*.bmp=0;32:*.pbm=0;32:*.pgm=0;32:*.ppm=0;32:*.tga=0;32:*.xbm=0;32:*.xpm=0;32:*.tif=0;32:*.tiff=0;32:*.png=0;32:*.eps=0;32:*.mpg=0;32:*.mpeg=0;32:*.avi=0;32:*.fli=0;32:*.gl=0;32:*.dl=0;32:*.xcf=0;32:*.xwd=0;32:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:*.o=01;33:*.c=01;35:*.h=01;35:*.m=01;35:*Makefile=0;35:*tags=01;32:*~=01;30:*.swp=01;30:*README=01;31:*.tex=01;31:*.htm=01;31:*.html=01;31:*readme=00;31:*.pdf=00;31:*.doc=00;31:*.ps=00;31:*.dvi=00;31:*.sql=01;37:*.sqlite=01;37:*.js=01;33:*.xul=01;35:*.xml=01;35:*.php=01;36:*.inc=01;36:*.css=01;32:*.html=01;36:*.module=01;37:"

export WT_ANSIBLE_VAULT_FILE="~/bin/ansible-vault-pass"

export VISUAL=vim
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd v edit-command-line

which kontena > /dev/null && . "$( kontena whoami --bash-completion-path )"

complete -F "ahoy --generate-bash-completion" ahoy
