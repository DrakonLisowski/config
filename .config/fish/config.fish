set -x EDITOR vim
set -x VISUAL vim
set -x TERMINAL alacritty
set -x BROWSER midori

# For adding yarn global bin to path if yarn exists
if type yarn > /dev/null
  set -x PATH (yarn global bin) $PATH
end

alias rmd "rm -rf"
alias ls "exa -a --group-directories-first"
alias lsl "exa -a -l --group-directories-first"
alias nr "npm run"
alias cwd "echo $PWD"

# For fixing nvm on mac os
if test -f "~/.nvm-fish/nvm.fish"
  source ~/.nvm-fish/nvm.fish
end

function cpyr
  cp $argv/$argv temp
  rm -rf $argv
  mv temp $argv
end
function fish_prompt
  powerline-shell --shell bare $status
end
function fish_greeting
  neofetch
end
function languages_known
    if type ruby > /dev/null 2> /dev/null
      ruby --version
      echo
    end
    if type lua > /dev/null 2> /dev/null
      lua -v
      echo
    end
    if type python > /dev/null 2> /dev/null
      python --version
      echo
    end
    if type go > /dev/null 2> /dev/null
      go version
      echo
    end
    if type node > /dev/null 2> /dev/null
      printf 'NodeJS %s\n' (node --version)
      echo
    end
    if type php > /dev/null 2> /dev/null
      php --version
    end
end
function webfleet_release
  npm version $argv --no-git-tag-version
  set DRAKOLIS_WEBFLEET_PROJECT_NAME (node -e "console.log(require('./package.json').name.split(/@.+\//).reverse()[0])")
  set DRAKOLIS_WEBFLEET_PROJECT_VERSION (node -e "console.log(require('./package.json').version)")
  git commit -am "release/$DRAKOLIS_WEBFLEET_PROJECT_NAME/$DRAKOLIS_WEBFLEET_PROJECT_VERSION"
  git tag -a release/$DRAKOLIS_WEBFLEET_PROJECT_NAME/$DRAKOLIS_WEBFLEET_PROJECT_VERSION -m "created tag"
  git push
  git push origin release/$DRAKOLIS_WEBFLEET_PROJECT_NAME/$DRAKOLIS_WEBFLEET_PROJECT_VERSION
  printf "Released $DRAKOLIS_WEBFLEET_PROJECT_NAME@$DRAKOLIS_WEBFLEET_PROJECT_VERSION"
end

# the default color
#set fish_color_normal
# the color for commands
set fish_color_command cyan
# the color for quoted blocks of text
set fish_color_quote brgreen
# the color for IO redirections
set fish_color_redirection brwhite
# the color for process separators like ';' and '&'
set fish_color_end brwhite
# the color used to highlight potential errors
set fish_color_error red
# the color for regular command parameters
set fish_color_param brgreen
# the color used for code comments
set fish_color_comment brblack
# the color used to highlight matching parenthesis
set fish_color_match brcyan
# the color used when selecting text (in vi visual mode)
#set fish_color_selection
# used to highlight history search matches and the selected pager item (must be a background)
#set fish_color_search_match
# the color for parameter expansion operators like '*' and '~'
set fish_color_operator bryellow
# the color used to highlight character escapes like '\n' and '\x70'
set fish_color_escape brmagenta
# the color used for the current working directory in the default prompt
set fish_color_cwd bryellow
# the color used for autosuggestions
#set fish_color_autosuggestion
# the color used to print the current username in some of fish default prompts
#set fish_color_user
# the color used to print the current host system in some of fish default prompts
#set fish_color_host
# the color used to print the current host system in some of fish default prompts, if fish is running remotely (via ssh or similar)
#set fish_color_host_remote
# the color for the '^C' indicator on a canceled command
#set fish_color_cancel
# the color of the progress bar at the bottom left corner
#set fish_pager_color_progress
# the background color of a line
#set fish_pager_color_background
# the color of the prefix string, i.e. the string that is to be completed
#set fish_pager_color_prefix
# the color of the completion itself
#set fish_pager_color_completion
# the color of the completion description
#set fish_pager_color_description
# fish_pager_color_background of every second unselected completion. Defaults to fish_pager_color_background
#set fish_pager_color_secondary_background
#refix, fish_pager_color_prefix of every second unselected completion. Defaults to fish_pager_color_prefix
#set fish_pager_color_secondary_
# fish_pager_color_completion of every second unselected completion. Defaults to fish_pager_color_completion
#set fish_pager_color_secondary_completion
# fish_pager_color_description of every second unselected completion. Defaults to fish_pager_color_description
#set fish_pager_color_secondary_description
# fish_pager_color_background of the selected completion. Defaults to fish_color_search_match
#set fish_pager_color_selected_background
# fish_pager_color_prefix of the selected completion. Defaults to fish_pager_color_prefix
#set fish_pager_color_selected_prefix
# fish_pager_color_completion of the selected completion. Defaults to fish_pager_color_completion
#set fish_pager_color_selected_completion
# fish_pager_color_description of the selected completion. Defaults to fish_pager_color_description
#set fish_pager_color_selected_description
