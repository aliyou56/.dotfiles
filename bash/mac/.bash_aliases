alias aliases='bat ~/.bash_aliases --pager never && bat ~/.local/.bash_aliases --pager never 2>/dev/null'

alias b='bloop'
alias br='bloop exit && bloop about'
alias c='code .'
alias cdf='cd $(ls | fzf)'
alias ce='code . && exit'
# alias dg-with-test='bloop projects --dot-graph | dot -Tsvg -o dependency-graph.svg'
# alias dg='bloop projects --dot-graph | sed "-test/d" | dot -Tsvg -o dependency-graph.svg'
# alias di='echo dotenv >> .envrc && direnv allow'
# alias din='echo "use nix" > .envrc && echo "watch_fie nix/*" >> .envrc && di'
alias dots='cd ~/.dotfiles'
# alias dr='direnv reload'
alias ipp='curl ifconfig.me && echo'
# alias java-switch='cs java --jvm $(cs java --available | fzf) --env 2>/dev/null > .envrc && di'
# alias jps='jps -lm'
# alias jpsk9='jps | fzf --reverse -m -e -i | cut -d " " -f1 | xargs kill -9 2>/dev/null'
# alias jpsk='jps | fzf --reverse -m -e -i | cut -d " " -f1 | xargs kill 2>/dev/null'
# alias k='kubectl'
# alias ld='lazydocker'
alias new-install-repo='g8 git@github.com:agilesteel/install-seed.g8.git'
# alias sbtd='sbt -jvm-debug 5005'
# alias sbtnoss='sbt -Dsbt.supershell=false'
# alias scalac-phases='scala -Xwhow-phases'
alias scalalines='find . -path "*/src" -name "*.scala" | xargs wc -l | sort n'
alias update='brew update && brew upgrade && cs update && cd ~/.dotfiles && gfa'
alias v='vim'

# Git & Github
alias fgco='gco $(gb | fzf)'
alias fgcor='gco --track $(gb | fzf)'
alias fgcot='gco $(g tag | fzf)'
alias gapaa='gaa -N && gapa .'
alias gca!='gaa && g commit --amend'
alias gcaf='gaa && g commit --fixup'
alias gcam='gaa && gcmsg'
# alias gcamr='gcam "chore: refactoring"'
# alias gcan!='gaa && g commit --amend --no-edit --no-verify'
# alias gcangpf!='gcan! && gpf!'
# alias gcas='gaa && g commit --squash'
# alias ghdi='gi && gh rcd && gpsup && gh rvw'
# alias ghdim='gim && gh rcd && gpsup && gh rvw'
# alias ghdip='gi && gh rcdp && gpsup && gh rvw'
# alias ghi='gi && gh rc && gpsup && gh rvw'
# alias ghim='gim && gh rc && gpsup && gh rvw'
# alias ghip='gi && gh rcp && gpsup && gh rvw'
alias gi='g init && gcam "Initial commit"'
# alias gim='g init -b master && gcam "Initial commit"'
alias gitalias='alias | grep git | fzf'
alias glol='g log --graph --pretty='\''%C(yellow)%h%Creset%C(auto)%d%Creset %s %Cgreen%cr %C(bold blue)%an%Creset'\'''
alias glola='glol --all'
# alias gpe='gp && exit'
# alias grbio='grbi @{u}'
# alias grbiom='grbi origin/$(git_main_branch)'
# alias grbom='grb origin/$(git_main_branch)'
# alias grhom='grh origin/$(git_main_branch)'
# alias groh='grh @{u}'
# alias grohh='grhh @{u}'
alias gs='git -c delta.side-by-side=true'
alias gsd='gs diff'
alias gsds='gs diff --staged'
# alias gstfu='g commit --amend && grbc'
# alias gwipe='gwip && exit'
# alias gwipgp='gwip && gp'
# alias gwipgpe='gwip && gpe'
# alias gwipp='gcmsg "--wip-- [skip ci]" --no-verify --no-gpg-sign'
# alias hk='gcam housekeeping && gpe'
# alias lg='lazygit'

# Changing "ls" to "exa"
alias ls='exa -al --color=always --group-directories-first' # my preferred listing
alias la='exa -a --color=always --group-directories-first'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first'  # long format
alias lt='exa -aT --color=always --group-directories-first' # tree listing
alias l.='exa -a | egrep "^\."'

alias http='noglob http'

alias cp='cp -iv'
alias mv='mv -iv'
# alias la='ls -alh'

#alias ls='ls --color=auto'
alias h='history'
alias ff='find . -name $1'
alias now='date +"%T"'
alias nowdate='date +"%d-%m-%Y"'
alias nowtime='now'
alias path='echo -e ${PATH//:/\\n}'
#alias s='sudo'
alias grep='grep --colour=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

###############################################################################
# tar
alias tarc="tar czvf"
alias tarx="tar xzvf"
alias tart="tar tzvf"

# lists contents of current directory with file permisions
# alias ll='ls -laF -sort'

# list all directories in current directories
#alias ldir='ls -l | grep ^d'

# Apply changes to aliases
alias sa='source ~/.bash_aliases;source ~/.bashrc;echo "Bash aliases sourced."'

# Edit Aliases
alias via='vim ~/.bash_aliases'
#alias vib='vim ~/.bashrc'
