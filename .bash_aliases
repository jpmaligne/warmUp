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
############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Syntax: go [OPTIONS] [DIRECTORY]"
   echo
   echo "Go can switch to your workspace directory and activate right version of Node or active your venv."
   echo
   echo "   -c          Once directory is changed, open vscode using 'code ./'"
   echo "   -h          Print this Help."
   echo
   echo "With lovely regards <3"
   echo
}
############################################################
# Switch Node Version                                      #
############################################################
switch_node_version() {
    FILE=.nvmrc
    if [ -f "$FILE" ]; then
        nvm use
    fi
}
############################################################
# Activate Venv                                            #
############################################################
activate_venv() {
    FILE=./venv/bin/activate
    if [ -f "$FILE" ]; then
        . venv/bin/activate
    elif [[ "$VIRTUAL_ENV" != "" ]]
    then
        deactivate
    fi
}
############################################################
# Main Programm                                            #
############################################################
go() {
    local file
    if [ $1 == '-h' -o $1 == '--help' ]; then
        Help
        return 0
    fi
    if [ $1 == '-c' -a $# -eq 1 ]; then
        echo "Syntax is : go [OPTIONS] [DIRECTORY]"
        return 0
    fi
    if [ $1 == '-c' -a $# -gt 2 ]; then
        echo "Syntax is : go [OPTIONS] [DIRECTORY]"
        return 0
    fi
    if [[ $1 == -* && $1 != '-c' && $1 != '-h' ]]; then
        echo "Syntax is : go [OPTIONS] [DIRECTORY]"
        return 0
    fi
    if [ $1 == '-c' -a $# -eq 2 ]; then
        cd ~/workspace/$2
        code ./
    else
        cd ~/workspace/$1
    fi    
    switch_node_version
    activate_venv
}
############################################################
# Wonderful completion                                    #
############################################################
_go_completions()
{
    local s1
    s1=${COMP_WORDS[COMP_CWORD]}
    # echo $s1
    # echo $COMP_CWORD
    # if [ $COMP_CWORD -eq 1 ]; then
    COMPREPLY=( $(compgen -W "\`ls ~/workspace\`" -- $s1) )
    # fi
    return 0
}
complete -F _go_completions go
