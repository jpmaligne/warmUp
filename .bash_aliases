alias wcd='cd ~/workspace/'

alias dockerrmall='docker rm -f $(docker ps -a -q)'
alias dkapache='docker run -dit --name `basename $PWD` -p 80:80 -v "$PWD":/usr/local/apache2/htdocs/ httpd:alpine'

alias dc='docker-compose'
alias dce='docker-compose exec'
alias dcl='docker-compose logs --tail 20 -f'
alias k='minikube kubectl --'
alias kl='minikube kubectl -- logs'
alias kd='minikube kubectl -- describe'
alias kgp='minikube kubectl -- get pods'
alias kgs='minikube kubectl -- get services'

###################################### go ######################################
go() {
    cd ~/workspace/$1
}
_go_completions()
{
    local s1
    s1=${COMP_WORDS[COMP_CWORD]}
    if [ $COMP_CWORD -eq 1 ]; then
        COMPREPLY=( $(compgen -W "\`ls ~/workspace\`" -- $s1) )
    fi
    return 0
}
complete -F _go_completions go
