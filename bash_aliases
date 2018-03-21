# Aliases/exports common to all machines

## FILE/FOLDER OPERATIONS

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias cdd='cd $DATA'
alias cdc='cd $CODE'

alias md='mkdir -p'

# suggest to use trash-cli instead of normal 'rm' command.
# Use \rm or 'rm' (with quotation marks) to circumvent this alias.
alias rm='echo "This is not the command you are looking for. Use trash-put instead."; false'
    
alias CP='rsync -ah --progress'
alias RMTEMP='\rm -v *~'

alias NUMFILES='find . -type f | wc -l' # return number of files in current folder

alias FINDFILE='find $PWD -type f -name' # usage example: 'FINDFILE "file.txt"'


## APPLICATIONS

export EDITOR='emacs'

alias edit='$EDITOR'
alias o='xdg-open'
alias enw='emacs -nw'

# convert markdown to LaTeX. Use like 'MD2TEX output.tex input.md'.
alias MD2TEX='pandoc -s -S -f markdown -t latex -o'

# convert Jupyter notebook to other formats. Use like 'JUPYTER2PDF input.ipynb'
alias JUPYTER2PDF='ipython nbconvert --to pdf'
alias JUPYTER2TEX='ipython nbconvert --to latex'
alias JUPYTER2HTML='ipython nbconvert --to html'
alias JUPYTER2SLIDES='ipython nbconvert --to slides'
alias JUPYTER2MD='ipython nbconvert --to markdown'
alias JUPYTER2SCRIPT='ipython nbconvert --to script'


## GENERAL LINUX

alias bashsource='source $HOME/.bashrc'
alias bashedit='emacs $HOME/dotfiles/bashrc &'
alias UPDATE='sudo apt update && sudo apt upgrade'
alias sudo='sudo ' # Enable aliases to be sudo'ed
alias cat='pygmentize -O style=monokai -f console256 -g' # cat with beautiful colors. requires: 'pip install Pygments'
alias q='exit'


## PYTHON

alias unittest='python -m unittest discover'
alias currentenv='echo "Active virtual environment: "$VIRTUAL_ENV'

## GIT

alias GLOG="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%ar / %cr)%Creset' --abbrev-commit --date=relative"
alias gcl='git clone'
alias ga='git add'
alias grm='git rm'
alias gap='git add -p'
alias gall='git add -A'
alias gf='git fetch --all --prune'
alias gft='git fetch --all --prune --tags'
alias gfv='git fetch --all --prune --verbose'
alias gftv='git fetch --all --prune --tags --verbose'
alias gus='git reset HEAD'
alias gpristine='git reset --hard && git clean -dfx'
alias gclean='git clean -fd'
alias gm="git merge"
alias gmv='git mv'
alias g='git'
alias get='git'
alias gst='git status'
alias gs='git status'
alias gss='git status -s'
alias gsu='git submodule update --init --recursive'
alias gl='git pull'
alias glum='git pull upstream master'
alias gpr='git pull --rebase'
alias gpp='git pull && git push'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gpo='git push origin'
alias gpu='git push --set-upstream'
alias gpom='git push origin master'
alias gr='git remote'
alias grv='git remote -v'
alias gra='git remote add'
alias gd='git diff'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -v -m'
alias gci='git commit --interactive'
alias gb='git branch'
alias gba='git branch -av'
alias gbt='git branch --track'
alias gbm='git branch -m'
alias gbd='git branch -d'
alias gbdr='git branch -d -r'
alias gbD='git branch -D'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcb='git checkout -b'
alias gcob='git checkout -b'
alias gct='git checkout --track'
alias gexport='git archive --format zip --output'
alias gdel='git branch -D'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
alias gsl="git shortlog -sn"
alias gwc="git whatchanged"
alias gt="git tag"
alias gta="git tag -a"
alias gtd="git tag -d"
alias gtl="git tag -l"
# From http://blogs.atlassian.com/2014/10/advanced-git-aliases/
# Show commits since last pull
alias gnew="git log HEAD@{1}..HEAD@{0}"
# Add uncommitted and unstaged changes to the last commit
alias gcaa="git commit -a --amend -C HEAD"
alias ggui="git gui"
alias gcam="git commit -am"
alias gcsam="git commit -S -am"
alias gstd="git stash drop"
alias gstl="git stash list"
alias gtsl="git tag -l | sort -V"


## TIG

alias tigs='tig status'
alias tigl='tig log'
alias tigg='tig grep'
alias tigh='tig -h'


## CLIPBOARD

case $OSTYPE in
  linux*)
    XCLIP=$(command -v xclip)
    [[ $XCLIP ]] && alias pbcopy="$XCLIP -selection clipboard" && alias pbpaste="$XCLIP -selection clipboard -o"
    ;;   
esac


# LATEX

alias latexmk='latexmk -pvc -pdf -outdir=output'
    

## RANDOM STUFF

alias WEATHER='curl wttr.in/vienna'
alias diff='colordiff'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
