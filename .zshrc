export ZSH="/Users/username/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
  git
  dotenv
  macos
  zsh-autosuggestions
  last-working-dir
  web-search
  xcode
)

# z extension for browsing
# https://github.com/rupa/z
. ~/Shell/z.sh

source $ZSH/oh-my-zsh.sh

# user configuration
# custom aliases
alias c="code .";
alias ll="ls -1a";
alias ..="cd ../";
alias ..l="cd ../ && ll";
alias pg="echo 'Pinging Google' && ping www.google.com";
alias de="cd ~/Desktop";
alias dd="cd ~/code";
alias d="cd ~/code && cd "
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
alias deleteDSFiles="find . -name '.DS_Store' -type f -delete"
alias npm-update="npx npm-check -u";
alias flushdns="sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder"

## Xcode Playground aliases
# https://github.com/JohnSundell/Playground
function xp { playground -t "~/code/ios/playground/$@"; }
function xpu { playground -t "~/code/ios/playground/$1" -u "$2"; }
function xpv { playground -t "~/code/ios/playground/$@" -v; }
alias xph="playground -h";
function xc { file="$(find . -maxdepth 1 -name '*.xcworkspace' -o -name '*.xcodeproj' | sort --reverse | head -1)"; echo "Opening file:" $file; open $file; }

## git aliases
function gc { git commit -m "$@"; }
alias gci="git commit --allow-empty -m 'Trigger CI'";
alias gcd="git checkout develop";
alias gs="git status";
alias gpull="git pull";
alias gf="git fetch";
alias gfa="git fetch --all";
alias gf="git fetch origin";
alias gpush="git push";
alias gd="git diff";
alias ga="git add .";
alias gb="git branch";
alias gbr="git branch remote"
alias gfr="git remote update"
alias gcb="git checkout -B "
alias grf="git reflog";
alias grh="git reset HEAD~" # last commit
alias gac="git add . && git commit -a -m "
alias gsu="git push --set-upstream origin "
alias glog="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --branches"


## checkout a new remote branch (exists remote, not locally)
## git checkout -b LocalName origin/remotebranchname (checkout a remote branch)

## other aliases
alias zshrc='code ~/.zshrc'
alias topten="history | commands | sort -rn | head"
alias myip="curl http://ipecho.net/plain; echo"
alias dirs='dirs -v | head -10'
alias usage='du -h -d1'
alias update="source ~/.zshrc"
alias sshdir="cd ~/.ssh"
alias runp="lsof -i "
alias md="mkdir "
alias ..='cd ..'
alias ...='cd ../..'
alias cls="clear"
alias walnut="ssh pi@walnut.local"
alias butterscotch="ssh pi@butterscotch.local"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias hub="sh /Users/kamalwadhwa/Share/Data/hub.sh"

## FFMPEG
function ffm { ffmpeg -i "$@".ts -map 0 -c copy "$@".mov; }

## this loads NVM
#[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh

## custom functions
#gpr() {
#  if [ $? -eq 0 ]; then
#    github_url=`git remote -v | awk '/fetch/{print $2}' | sed -Ee #'s#(git@|git://)#http://#' -e 's@com:@com/@' -e 's%\.git$%%'`;
#    branch_name=`git symbolic-ref HEAD 2>/dev/null | cut -d"/" -f 3`;
#    pr_url=$github_url"/compare/master..."$branch_name
#    open $pr_url;
#  else
#    echo 'failed to open a pull request.';
#  fi
#}
#
#commands() {
#  awk '{a[$2]++}END{for(i in a){print a[i] " " i}}'
#}

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vscode'
else
  export EDITOR='vscode'
fi


# Ruby config using rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Change color of auto suggestions to something that can be visible, Since the default is not!
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

# https://direnv.net/docs/hook.html
eval "$(direnv hook zsh)"
