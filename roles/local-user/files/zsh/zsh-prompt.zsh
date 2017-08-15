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

#autoload -U colors && colors
LEFT="%{$fg_bold[green]%}%n@%m : [%{$fg_bold[blue]%}%d%{$fg_bold[green]%}]"
RIGHT="%{$fg_bold[green]%}[%{$fg_bold[magenta]%}%l : %D{%a,%T}%{$fg_bold[green]%}]"

prompt_precmd () {
  SPACES=`get_space $LEFT $RIGHT`
  print 
  print -rP "$LEFT$SPACES$RIGHT"
}

#Using conditional expression of the form %(X.true-text.false-text) 
setopt prompt_subst
PROMPT="%(?.%{$fg_bold[green]%}$ .%{$fg_no_bold[red]%}$ )%{$reset_color%}"
RPROMPT="%{$fg_no_bold[red]%}%(?..[%?] :()%{$reset_color%}"

autoload -U add-zsh-hook
add-zsh-hook precmd prompt_precmd
