#!/usr/bin/env bash

SCM_GIT_CHAR="${bold_red}±${normal}"
SCM_THEME_PROMPT_DIRTY="${red}✗${reset_color}"
SCM_THEME_PROMPT_CLEAN="${green}✓${reset_color}"
SCM_THEME_PROMPT_AHEAD="${yellow}!${reset_color}"

function git_prompt_info {
    if [[ $(git status 2> /dev/null |grep -v ^# |grep "working tree clean") ]]; then
        SCM_DIRTY=0
        SCM_STATE=${GIT_THEME_PROMPT_CLEAN:-$SCM_THEME_PROMPT_CLEAN}
    else
        if [[ $(git status 2> /dev/null |grep "branch is ahead") ]]; then
            SCM_DIRTY=2
            SCM_STATE=${GIT_THEME_PROMPT_AHEAD:-$SCM_THEME_PROMPT_AHEAD}
        else
            SCM_DIRTY=1
            SCM_STATE=${GIT_THEME_PROMPT_DIRTY:-$SCM_THEME_PROMPT_DIRTY}
        fi
    fi

    local ref=$(git symbolic-ref HEAD 2> /dev/null)
    SCM_BRANCH=${ref#refs/heads/}
    SCM_CHANGE=$(git rev-parse HEAD 2>/dev/null)
    if [[ -z $SCM_BRANCH ]]; then
        GIT_PROMPT=""
    else
        GIT_PROMPT="|$SCM_BRANCH $SCM_STATE "
    fi
    SHA=$(git rev-parse --short HEAD 2> /dev/null) && GIT_SHA="$GIT_SHA_PREFIX$SHA$GIT_SHA_SUFFIX"
    if [[ -n $SHA ]]; then
        echo -e " [$SCM_GIT_CHAR] ${yellow}$SCM_BRANCH ${purple}$SHA $SCM_STATE"
    else
        echo -e ""
    fi
}

function virtualenv_prompt_info() {
    if [[ $VIRTUAL_ENV != "" ]]
    then
        echo -e " ${red}(${VIRTUAL_ENV##*/})"
    else
        echo -e ""
    fi
}


function prompt_command() {
    PS1="${green}[\u@\h ${normal}\W$(git_prompt_info)$(virtualenv_prompt_info)${green}]${normal}\$ "
}

PROMPT_COMMAND=prompt_command
