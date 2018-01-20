#!/bin/env zsh

ZSH_THEME_GIT_PROMPT_PREFIX="$reset_color"
ZSH_THEME_GIT_PROMPT_SUFFIX="$reset_color"
ZSH_THEME_GIT_PROMPT_DIRTY="$fg[red]+"
ZSH_THEME_GIT_PROMPT_CLEAN="$fg[green]"


function get_directory() {
    echo "${PWD/$HOME/~}"
}

function get_user_prompt() {
    echo $fg[cyan]%m
}

function get_directory_prompt() {
    echo $fg[yellow]$(get_directory)
}

function get_git_info() {
    local git=$(git_prompt_info)

    if [ ${#git} != 0 ]
    then
        (( git=${#git} - 10 ))
    else
        git=0
    fi

    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    echo "$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)"
}


function left_top_prompt() {
    echo $(get_user_prompt)@$(get_directory_prompt)
}

function right_top_prompt() {
    echo $(get_git_info)
}


function put_spacing() {
    local termwidth
    (( termwidth = ${COLUMNS} - 2 - ${#$(left_top_prompt)} - ${#$(right_top_prompt)} ))

    local spacing=""
    for i in {1..$termwidth}
    do
        spacing="${spacing} "
    done

    echo $spacing
}

PROMPT='$(left_top_prompt)$(put_spacing)$(right_top_prompt)
> '
