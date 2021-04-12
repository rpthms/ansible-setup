#Setting the prompt
#	* prompt_precmd() is executed before setting the prompt using
#	  the add-zsh-hook command
#	* autoload is used to load certain function definitions
#	* -U flag is to ensure alias definitions don't get
#	  expanded in the function definition (see zshbuiltins(1))

get_space () {
  local STR=$1$2
  local zero='%([BSUbfksu]|([FB]|){*})'
  local LENGTH=${#${(S%%)STR//$~zero/}}
  local _SPACES=""
  (( LENGTH = ${COLUMNS} - $LENGTH - 1))

  for i in {0..$LENGTH}
    do
      _SPACES="$_SPACES "
    done

  echo $_SPACES
}

# Normal color list
nr_black=0
nr_red=1
nr_green=2
nr_yellow=3
nr_blue=4
nr_magenta=5
nr_cyan=6
nr_white=7

# Bright color list
br_black=8
br_red=9
br_green=10
br_yellow=11
br_blue=12
br_magenta=13
br_cyan=14
br_white=15

# Check what the percent prompt sequences mean at: zshmisc(1) § Visual effects

#autoload -U colors && colors
LEFT="%F{$br_green}%n@%m : [%F{$br_blue}%d%F{$br_green}]"
RIGHT="%F{$br_green}[%F{$br_magenta}%l : %D{%a,%T}%F{$br_green}]"

prompt_precmd () {
  SPACES=`get_space $LEFT $RIGHT`
  print
  print -rP "$LEFT$SPACES$RIGHT"
}

#Using conditional expression of the form %(X.true-text.false-text)
setopt prompt_subst
PROMPT="%(?.%F{$br_green}$ .%F{$br_red}$ )%f"
RPROMPT="%F{$br_red}%(?..[%?] :()%f"

autoload -U add-zsh-hook
add-zsh-hook precmd prompt_precmd
